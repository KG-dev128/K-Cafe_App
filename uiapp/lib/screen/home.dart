import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uiapp/screen/detail.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "name": "Cappuccino",
      "description": "With Caramel",
      "price": "Rs 130",
      "image": "assets/images/coffee1.jpg",
    },
    {
      "name": "Latte",
      "description": "With Milk",
      "price": "Rs 150",
      "image": "assets/images/coffee2.jpg",
    },
    {
      "name": "Mocha",
      "description": "With Chocolate",
      "price": "Rs 170",
      "image": "assets/images/coffee3.jpg",
    },
    {
      "name": "Americano",
      "description": "With Honey",
      "price": "Rs 500",
      "image": "assets/images/coffee4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18110D),
      appBar: AppBar(
        backgroundColor: const Color(0xff18110D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // back arrow white
        title: const Text(
          "Good Day Kiran!",
          style: TextStyle(color: Colors.white, fontFamily: 'coffee'),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Which Coffee would you like today?",
                style: TextStyle(
                  color: Color(0xff8A6C5B),
                  fontSize: 20,
                  fontFamily: 'coffee',
                ),
              ),
            ),

            /// Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                viewportFraction: 0.85,
              ),
              items:
                  const [
                    "assets/images/coffee1.jpg",
                    "assets/images/coffee2.jpg",
                    "assets/images/coffee3.jpg",
                  ].map((img) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 24),

            /// Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Our Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "coffee",
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryItem(title: "Espresso"),
                  CategoryItem(title: "Latte"),
                  CategoryItem(title: "Mocha"),
                  CategoryItem(title: "Americano"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Products Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Today's Popular Items",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "coffee",
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: const Color(0xff2A1E17),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white70),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white70),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white70),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// CATEGORY ITEM
class CategoryItem extends StatelessWidget {
  final String title;
  const CategoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: const Icon(Icons.coffee, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}

/// PRODUCT CARD
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff2A1E17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                product["image"],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  product["name"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product["description"],
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                Text(
                  product["price"],
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          products: product,
                        ), 
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Explore",
                    style: TextStyle(color: Color(0xff18110D)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
