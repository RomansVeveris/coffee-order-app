import 'package:flutter/material.dart';
import 'detail.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = ["All coffee", "Machiato", "Latte", "Americano", "Espresso"];
  String selectedCategory = "All coffee";

  final List<Map<String, String>> coffeeItems = [
    {
      "name": "Caffe Mocha",
      "desc": "Deep Foam",
      "price": "4.53",
      "image": "assets/images/caffe_mocha.png"
    },
    {
      "name": "Flat White",
      "desc": "Espresso",
      "price": "3.53",
      "image": "assets/images/flat_white.png"
    },
    {
      "name": "Latte Machiato",
      "desc": "Latte",
      "price": "4.99",
      "image": "assets/images/flat_white.png"
    },
    {
      "name": "Cappucino",
      "desc": "White coffee",
      "price": "3.99",
      "image": "assets/images/caffe_mocha.png"
    },
    {
      "name": "Espresso",
      "desc": "Black coffee",
      "price": "3.49",
      "image": "assets/images/americano.png"
    },
  ];

  Widget buildCoffeeCategory(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC67C4E) : const Color.fromARGB(134, 220, 220, 220),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF313131),
            fontFamily: 'Sora',
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

Widget buildCoffeeCard(Map<String, String> coffee) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeDetailPage(
            name: coffee['name']!,
            desc: coffee['desc']!,
            price: coffee['price']!,
            image: coffee['image']!,
          ),
        ),
      );
    },
    child: Container(
      width: 160,
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            coffee['image']!,
            width: 160,
            height: 148,
            fit: BoxFit.contain,
          ),
          Text(
            coffee['name']!,
            style: const TextStyle(
              fontFamily: 'Sora',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Text(
            coffee['desc']!,
            style: const TextStyle(
              fontFamily: 'Sora',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${coffee['price']!}",
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.add, size: 22, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: const Color(0xFF111111),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Location', style: TextStyle(color: Colors.white, fontFamily: 'Sora')),
                  Text('Latvia, Riga',
                      style: TextStyle(color: Colors.white, fontFamily: 'Sora', fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded, color: Colors.white54),
                        hintText: 'Search coffee',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF222222),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.settings_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(0, 0, 0, 0), Color.fromARGB(255, 240, 240, 240)],
                  stops: [0.5, 0.5],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: 
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/banner.png',
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                          ),
                          Positioned(

                            left: 24,
                            bottom: 16,
                            child: Text(
                              'Buy one get \none FREE',
                              style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 240, 240, 240),
              padding: const EdgeInsets.only(bottom: 12),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    final category = categories[index];
                    return Padding(
                      padding: EdgeInsets.only(right: index != categories.length - 1 ? 24 : 0),
                      child: buildCoffeeCategory(category, category == selectedCategory),
                    );
                  }),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 240, 240, 240),
              padding: const EdgeInsets.only(left: 24, right: 24, top: 12.5, bottom: 24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: coffeeItems.map((coffee) => buildCoffeeCard(coffee)).toList(),
              ),
            ),
          ],
        ),
      ),
    ),
  
          bottomNavigationBar:Stack(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 70.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((0.001 * 255).toInt()),
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.favorite),
                  Icon(Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }
}