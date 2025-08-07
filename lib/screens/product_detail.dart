import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedVolume = 400;

  final List<int> volumes = [250, 400, 800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/serum.png')),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const Row(
                children: [
                  Text(
                    'To my skin. ',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(
                    ' 4.7 (1,537 reviews)',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Cherry Sunset Gel Shower',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Volume / ml',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Row(
                children: volumes.map((v) {
                  final isSelected = selectedVolume == v;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedVolume = v;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.pink.shade300
                                : Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$v',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.pink.shade200
                                : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'The shower gel formula gently cleanses and softens the skin. The product foams abundantly...',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '\$13.00',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '\$7.90',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
