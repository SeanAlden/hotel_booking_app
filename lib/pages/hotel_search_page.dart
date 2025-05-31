import 'package:flutter/material.dart';

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  State<HotelSearchPage> createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  // Sample hotel data with descriptions
  final List<Map<String, String>> hotels = [
    {
      "name": "Hotel A",
      "city": "Surabaya",
      "price": "Rp 2.000.000,00 / Night",
      "image": "assets/images/product.png", // Placeholder for the image URL
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.",
    },
    {
      "name": "Hotel B",
      "city": "Jakarta",
      "price": "Rp 2.300.000,00 / Night",
      "image": "assets/images/product.png", // Placeholder for the image URL
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.",
    },
    {
      "name": "Hotel C",
      "city": "Malang",
      "price": "Rp 2.150.000,00 / Night",
      "image": "assets/images/product.png", // Placeholder for the image URL
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.",
    },
    {
      "name": "Hotel D",
      "city": "Yogyakarta",
      "price": "Rp 1.850.000,00 / Night",
      "image": "assets/images/product.png", // Placeholder for the image URL
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Hotel',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          // Hotel List View
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Placeholder for hotel image
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(hotel["image"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Hotel details
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotel["name"]!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Hotel description
                                Text(
                                  hotel["description"]!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                const SizedBox(height: 4),
                                // Text(
                                //   hotel["city"]!,
                                //   style: const TextStyle(color: Colors.grey),
                                // ),

                                Row(
                                  children: [
                                    const Icon(Icons.location_pin,
                                        color: Colors.red, size: 16),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        hotel["city"]!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  hotel["price"]!,
                                  style:
                                      const TextStyle(color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ),
                          // Wishlist button (Heart icon)
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              // Handle wishlist toggle
                            },
                          ),
                        ],
                      ),
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
