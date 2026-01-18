import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MosqueModel {
  final String name;
  final String address;
  final String distance;
  final double rating;
  final bool isOpen;

  MosqueModel({
    required this.name,
    required this.address,
    required this.distance,
    required this.rating,
    required this.isOpen,
  });
}

class MosqueView extends StatelessWidget {
  const MosqueView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MosqueModel> mosques = [
      MosqueModel(
        name: 'Central Jame Masjid',
        address: '123 Islamic Ave, City Center',
        distance: '0.5 km',
        rating: 4.8,
        isOpen: true,
      ),
      MosqueModel(
        name: 'Masjid Al-Noor',
        address: '45 Peace Street, Westside',
        distance: '1.2 km',
        rating: 4.6,
        isOpen: true,
      ),
      MosqueModel(
        name: 'Airport Mosque',
        address: '88 Terminal Rd, Airport Area',
        distance: '3.4 km',
        rating: 4.5,
        isOpen: true,
      ),
      MosqueModel(
        name: 'Masjid Al-Falah',
        address: '101 Quiet Lane, Suburbs',
        distance: '5.0 km',
        rating: 4.9,
        isOpen: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mosque Finder',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Map placeholder
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 50, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Map View Placeholder',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mosques.length,
              itemBuilder: (context, index) {
                final mosque = mosques[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF673AB7).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.mosque,
                            size: 30,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mosque.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                mosque.address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.amber[700],
                                  ),
                                  Text(
                                    ' ${mosque.rating}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.near_me,
                                    size: 14,
                                    color: Colors.grey[600],
                                  ),
                                  Text(
                                    ' ${mosque.distance}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: mosque.isOpen
                                          ? Colors.green.withValues(alpha: 0.1)
                                          : Colors.red.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      mosque.isOpen ? 'Open' : 'Closed',
                                      style: TextStyle(
                                        color: mosque.isOpen
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
