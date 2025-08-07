import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uitask2/screens/product_detail.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildFilterSection('Category', [
                    'Cleanser',
                    'Toner',
                    'Serum',
                    'Cream',
                  ]),
                  _buildFilterSection('Brand', [
                    'Brand A',
                    'Brand B',
                    'Brand C',
                    'Brand D',
                  ]),
                  _buildFilterSection('Price', [
                    'Under \$25',
                    '\$25 - \$50',
                    '\$50 - \$100',
                    'Over \$100',
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: options
                .map(
                  (option) => FilterChip(
                    label: Text(option),
                    onSelected: (selected) {},
                    backgroundColor: Colors.pink.shade50,
                    selectedColor: Colors.pink.shade200,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _showSortByDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort by'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Relevance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Price: Low to High'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Price: High to Low'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
          children: [
            Text(
              'Today\'s Deals ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.search, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Products...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      debugPrint('QR Code tapped');
                    },
                    icon: const Icon(
                      CupertinoIcons.qrcode_viewfinder,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _showFilterBottomSheet(context),
                    child: const Pill(),
                  ),
                  InkWell(
                    onTap: () => _showSortByDialog(context),
                    child: const FilterPill(),
                  ),
                ],
              ),
            ),
            Expanded(child: ProductGridWidget()),
          ],
        ),
      ),
    );
  }
}

class Pill extends StatelessWidget {
  const Pill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filters'),

            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text('3', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterPill extends StatelessWidget {
  const FilterPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.pink.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('By Relevance', style: TextStyle(color: Colors.white)),
            Icon(CupertinoIcons.chevron_down, color: Colors.white, size: 20),
          ],
        ),
      ),
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
        'icon': Icons.earbuds,
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

    return SingleChildScrollView(
      child: GridView.builder(
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
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailPage()),
              );
            },
            child: Container(
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
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
            ),
          );
        },
      ),
    );
  }
}
