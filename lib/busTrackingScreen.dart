// lib/BusTrackingScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BusTrackingScreen extends StatelessWidget {
  const BusTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Section
          FlutterMap(
            options: MapOptions(
              center: LatLng(17.385044, 78.486671), // Example location
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(17.385044, 78.486671),
                    builder: (ctx) => Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Top Bar with Bus No, Call and Message Icons
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.directions_bus_filled,
                      color: Colors.black,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Bus No. 990032J",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Phone Icon
                    GestureDetector(
                      onTap: () {
                        // Dummy phone call
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Call Driver"),
                            content: Text("Calling +91 9876543210..."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Message Icon
                    GestureDetector(
                      onTap: () {
                        // Dummy message functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Messaging feature coming soon!")),
                        );
                      },
                      child: Icon(
                        Icons.message,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Dark Blue Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Dark blue card color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Time Information
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "25:11",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Drop Count
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Drop",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Total Time
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "28:25",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Total Time",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Distance
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "09 KM",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Distance",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}