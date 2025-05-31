import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/pages/hotel_search_page.dart';
import 'package:flutter_firebase_project/pages/location_search_page.dart';

class GuestHomePage extends StatefulWidget {
  const GuestHomePage({super.key});

  @override
  State<GuestHomePage> createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {
  final Set<String> _wishlist = {};

  void _toggleWishlist(String hotelName) {
    setState(() {
      if (_wishlist.contains(hotelName)) {
        _wishlist.remove(hotelName);
      } else {
        _wishlist.add(hotelName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _GreetingHeader(),
          const SizedBox(height: 20),
          _SectionHeader(
            title: "Hotels",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HotelSearchPage()),
            ),
          ),
          const SizedBox(height: 10),
          _HotelListView(
            wishlist: _wishlist,
            onToggleWishlist: _toggleWishlist,
          ),
          const SizedBox(height: 20),
          _SectionHeader(
            title: "Location",
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => LocationSearchPage())),
          ),
          const SizedBox(height: 10),
          const _LocationListView(),
        ],
      ),
    );
  }
}

// ----------------------------- COMPONENTS -----------------------------

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Hi, John Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SectionHeader({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTap,
          child: const Text("See All", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}

class _HotelListView extends StatelessWidget {
  const _HotelListView({
    required this.wishlist,
    required this.onToggleWishlist,
  });

  final Set<String> wishlist;
  final Function(String) onToggleWishlist;

  @override
  Widget build(BuildContext context) {
    final hotels = [
      [
        "Hotel A",
        "assets/images/product.png",
        "Surabaya",
        "Rp 2.000.000,00 / Night"
      ],
      [
        "Hotel B",
        "assets/images/product.png",
        "Jakarta",
        "Rp 2.300.000,00 / Night"
      ],
      [
        "Hotel C",
        "assets/images/product.png",
        "Malang",
        "Rp 2.150.000,00 / Night"
      ],
      [
        "Hotel D",
        "assets/images/product.png",
        "Yogyakarta",
        "Rp 1.850.000,00 / Night"
      ],
    ];

    return SizedBox(
      // return IntrinsicHeight(
      height: 330,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final h = hotels[index];
          final isWishlisted = wishlist.contains(h[0]);

          return _HotelCard(
            name: h[0],
            image: h[1],
            city: h[2],
            price: h[3],
            isWishlisted: isWishlisted,
            onWishlistToggle: () => onToggleWishlist(h[0]),
          );
        },
      ),
    );
  }
}

class _HotelCard extends StatelessWidget {
  final String name;
  final String image;
  final String city;
  final String price;
  final bool isWishlisted;
  final VoidCallback onWishlistToggle;

  const _HotelCard({
    required this.name,
    required this.image,
    required this.city,
    required this.price,
    required this.isWishlisted,
    required this.onWishlistToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      // onTap: () => {
      // Navigator.pushNamed(context, '/hotel-detail'),
      // },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 220,
          height: 320,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                // width: double.infinity,
                // color: Colors.grey[300],
                // child: const Icon(Icons.image, size: 50),
              ),
              const SizedBox(height: 8),

              // Judul + lokasi + ikon favorit
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_pin,
                                color: Colors.red, size: 16),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                city,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color: isWishlisted ? Colors.red : Colors.grey,
                    ),
                    onPressed: onWishlistToggle,
                  ),
                ],
              ),

              const SizedBox(height: 4),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationListView extends StatelessWidget {
  const _LocationListView();

  @override
  Widget build(BuildContext context) {
    final locations = ["Surabaya", "Jakarta", "Malang", "Yogyakarta"];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return _LocationCard(name: locations[index]);
        },
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String name;

  const _LocationCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(
      //   context,
      //   '/location-detail'
      // ),
      onTap: () => {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 120,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_pin, color: Colors.red, size: 30),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
