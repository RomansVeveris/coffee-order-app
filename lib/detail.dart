import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailPage extends StatefulWidget {
  final String name;
  final String desc;
  final String price;
  final String image;

  const CoffeeDetailPage({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
  });

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  String selectedSize = 'M';

  Widget buildSizeOption(String size) {
    final bool isSelected = selectedSize == size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSize = size;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Color(0xFFC67C4E) : Color.fromARGB(255, 212, 212, 212), width: 1),
            borderRadius: BorderRadius.circular(14),
            color: isSelected ? const Color(0xFFF9F2ED) : Colors.white,
          ),
          child: Text(
            size,
            style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFFC67C4E) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).orientation == Orientation.portrait
      ? const Size.fromHeight(100)
      : const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'Detail',
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),


      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          color: const Color.fromARGB(255, 240, 240, 240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/coffee_detail.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: const TextStyle(fontFamily: 'Sora', fontSize: 24, fontWeight: FontWeight.w600)),
                      Text(widget.desc, style: const TextStyle(fontFamily: 'Sora', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Color(0xFFFBBE21), size: 30),
                          const SizedBox(width: 4),
                          const Text("4.8", style: TextStyle(fontFamily: 'Sora', fontSize: 20, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          const Text("(230)", style: TextStyle(fontFamily: 'Sora', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delivery_dining_rounded, color: Color(0xFFC67C4E)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.coffee, color: Color(0xFFC67C4E)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.local_drink, color: Color(0xFFC67C4E)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Color.fromARGB(255, 220, 220, 220),
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              const Text("Description", style: TextStyle(fontFamily: 'Sora', fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const ReadMoreText(
                "A cappuccino is an approximately 150ml (5oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk, the foam on top adds a creamy texture and smooth finish.",
                trimLines: 3,
                colorClickableText: Color(0xFFC67C4E),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read more',
                trimExpandedText: ' Show less',
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                moreStyle: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC67C4E),
                ),
              ),
              const SizedBox(height: 25),
              const Text('Size', style: TextStyle(fontFamily: 'Sora', fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSizeOption('S'),
                  const SizedBox(width: 24),
                  buildSizeOption('M'),
                  const SizedBox(width: 24),
                  buildSizeOption('L'),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),


      bottomNavigationBar: Container(
        color: const Color(0xFFF0F0F0),
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.portrait ? 130 : 90,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Price",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    SizedBox(height: 4),
                    Text("\$ 4.53",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC67C4E))),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC67C4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Buy Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
