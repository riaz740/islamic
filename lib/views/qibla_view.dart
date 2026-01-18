import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'dart:math' show pi;

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qibla Direction',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: FlutterQiblah.androidDeviceSensorSupport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (snapshot.data == true) {
            return const QiblaCompass();
          } else {
            return const Center(
              child: Text("Your device doesn't support Qibla sensors"),
            );
          }
        },
      ),
    );
  }
}

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final qiblaDirection = snapshot.data;
        if (qiblaDirection == null) {
          return const Center(child: Text("Waiting for sensor data..."));
        }

        // qiblaDirection.qibla is the angle of Qibla from North (0-360)
        // qiblaDirection.direction is the heading of the device (0-360)
        // We want to rotate the compass needle to point to Qibla.
        // If we rotate the whole compass so North is up (based on direction), then Qibla needle is at qibla angle.
        // Or easier: Just rotate the needle relative to device heading.
        // Angle to rotate = (qibla - direction)

        // Actually, usually we show a compass background that rotates with device heading (so North points North),
        // and a needle that points to Qibla.

        // Using Transform.rotate takes radians.

        // Let's visualize:
        // Compass Image (North fixed on image top) -> Rotate by -direction (so image North matches real North)
        // Needle Image (Points Up fixed) -> Rotate by -direction + qibla (so it points to Qibla)

        // Simpler approach:
        // Rotate a needle to point to Qibla relative to device top.
        // Angle = qiblaDirection.qibla - qiblaDirection.direction ?? 0; (Not exactly)
        // FlutterQiblah gives `qibla`: The angle of the Qibla relative to North.
        // `direction`: The angle of the device relative to North.

        // We want the needle to point to Qibla.
        // Device Top is 0 degrees.
        // North is at -direction degrees relative to device top.
        // Qibla is at qibla degrees relative to North.
        // So Qibla is at (qibla - direction) relative to device top.

        final double direction = qiblaDirection.direction;
        final double qibla = qiblaDirection.qiblah;
        final double angle = (qibla - direction) * (pi / 180);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Static Compass Rose (or rotated if we want North to be dynamic)
                    // Let's rotate the compass background so North points to North
                    Transform.rotate(
                      angle: -direction * (pi / 180),
                      child: const Icon(
                        Icons.explore,
                        size: 280,
                        color: Colors.grey,
                      ),
                    ),
                    // Qibla Pointer
                    Transform.rotate(
                      angle: -direction * (pi / 180) + (qibla * (pi / 180)),
                      child: const Icon(
                        Icons.navigation,
                        size: 100,
                        color: Color(0xFF00BCD4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                '${qibla.toStringAsFixed(1)}°',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Point the arrow towards the Qibla',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
