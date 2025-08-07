import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screens/catalog.dart';
import 'screens/favourite.dart';
import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> screens = [MyHomePage(), Catalog(), Favourite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
        toolbarHeight: 100,
        title: Container(
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
      ),
      body: CustomBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2, color: Colors.grey),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart, color: Colors.grey),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, color: Colors.grey),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: double.infinity,
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
            padding: EdgeInsets.only(top: 20),
            child: ProductCategoryScroller(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ProductGridWidget(),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSearchTap;
  final VoidCallback onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onSearchTap,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 4,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // You can add drawer open logic here
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: onSearchTap),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: onNotificationTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProductCategoryScroller extends StatelessWidget {
  const ProductCategoryScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.phone_android, 'label': 'Mobiles'},
      {'icon': Icons.laptop, 'label': 'Laptops'},
      {'icon': Icons.headphones, 'label': 'Headphones'},
      {'icon': Icons.tv, 'label': 'TV'},
      {'icon': Icons.watch, 'label': 'Watches'},
      {'icon': Icons.kitchen, 'label': 'Kitchen'},
      {'icon': Icons.sports_esports, 'label': 'Gaming'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    items[index]['icon'],
                    size: 30,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  items[index]['label'],
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '580',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BioDerma',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sensibio',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              child: Image.asset(
                'assets/images/image.png',
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
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
