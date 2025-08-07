import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text('Today deals', style: TextStyle(color: Colors.white)),
      ),
      body: ProductGridWidget(),
    );
  }
}

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'icon': Icons.face,
        'title': 'Foundation',
        'price': '\$29.99',
        'color': 'Beige',
      },
      {
        'icon': Icons.brush,
        'title': 'Mascara',
        'price': '\$19.99',
        'color': 'Black',
      },
      {
        'icon': Icons.home,
        'title': 'Lipstick',
        'price': '\$14.99',
        'color': 'Red',
      },
      {
        'icon': Icons.remove_red_eye,
        'title': 'Eyeliner',
        'price': '\$12.99',
        'color': 'Black',
      },
      {
        'icon': Icons.palette,
        'title': 'Eyeshadow',
        'price': '\$39.99',
        'color': 'Various',
      },
      {
        'icon': Icons.cleaning_services,
        'title': 'Cleanser',
        'price': '\$24.99',
        'color': 'White',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          height: 200,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 150,

                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Icon(
                    product['icon'],
                    size: 50,
                    color: Colors.pink.shade200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['price']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['title']!,
                      style: const TextStyle(color: Colors.black87),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product['color']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
