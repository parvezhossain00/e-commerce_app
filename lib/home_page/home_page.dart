
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_to_card/add_to_card_page.dart';
import '../controller/add_to_card_controller.dart';
import '../login_singup_page/log_in_page.dart';
import '../my_products_page/my_pruduct_page.dart';
import '../all_products_page/all_product_page.dart';
import '../profile/profile_page.dart';
import '../seller_pages/seller_page.dart';
import '../widgets/token_shareprefe.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// singleticker... dara vsyne er this use kora hoi
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AddToCartController addToCartController = Get.put(AddToCartController());

  // tabController dara bodir satha action set kora hoice
  late TabController _tabController;

  @override
  void initState() {
    addToCartController.cartItems;
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(00),
                bottomRight: Radius.circular(00))),
        title:  Text(
          "E-Shop",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(Icons.search,color: Colors.white,),
          IconButton(
            icon: Badge(
                label:
                    Obx(() => Text("${addToCartController.cartItems.length}")),
                child: const Icon(
                  Icons.shopping_cart,color: Colors.white,
                )),
            onPressed: () {
              Get.to(() => AddToCartPage());
              ///AddToCartProductPage());
            },
          ),
        ],
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: const [
        //     Tab(
        //       text: "All Products",
        //     ),
        //     Tab(
        //       text: "My Products",
        //     ),
        //     Tab(
        //       text: "Seller",
        //     ),
        //   ],
        // ),
      ),
      bottomNavigationBar: Material(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
        color: Colors.orangeAccent,
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favorite",
            ),
            Tab(
              icon: Icon(Icons.people),
              text: "Sellers",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            )
          ],
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.blueGrey),

          child: TabBarView(controller: _tabController, children: [
            Container(
                height: 200,
                width: 200,
                // color: Colors.,
                child: AllProductPage()),
            Container(
                height: 200,
                width: 200,
                color: Colors.red,
                ),
            Container(
                height: 200,
                width: 200,
                color: Colors.purple,
                child: SellerPage()),

            /// profile
            Container(
                height: 200,
                width: 200,
                color: Colors.purple,
                child:  ProfilePage()),
          ])),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration:  BoxDecoration(color: Colors.orangeAccent),
                  accountName: const Text('Mr. Akash'),
                  accountEmail: const Text('Akash@gmail.com'),
                  onDetailsPressed: () {
                    Get.back();
                  },
                  currentAccountPicture: Image.asset("assets/lm.png"),
                )),
            ListTile(
              onTap: () {
                Get.to(MyProductPage());
              },
              title: const Text('My Product'),
              leading: const Icon(Icons.production_quantity_limits_outlined),
            ),
            ListTile(
              onTap: () {
                Get.to(SellerPage());
              },
              title: const Text('All Seller'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              onTap: () {
                Get.to(AllProductPage());
              },
              title: const Text('All Products'),
              leading: const Icon(Icons.align_horizontal_left),
            ),
            ListTile(
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
              title: const Text('Light Mood'),
              leading: const Icon(Icons.light_mode),
            ),
            ListTile(
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
              title: const Text('Dark Mood'),
              leading: const Icon(Icons.dark_mode),
            ),
            const SizedBox(
              height: 180,
            ),
            ListTile(
              onTap: () {
                TokenSharePrefences.loadToken();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LogInPage()));
              },
              title: const Text('Log Out',style: TextStyle(color: Colors.red),),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
