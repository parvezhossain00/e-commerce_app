import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/seller_controller.dart';
import 'seller_product_page.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});

  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  SellerController sellerController = Get.put(SellerController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is created
    sellerController.getSeller();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        sellerController.loadMore();
        print("Load Successful");
      } else {
        print("Load Fail");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seller List")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (sellerController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    itemCount: sellerController.sellers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      var product = sellerController.sellers[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Get.to(() => SellerProductPage(
                            sellerId: product["id"],
                          ));
                        },
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const ProductCard({Key? key, required this.product, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: product["url"] == null
                  ? Image.network("https://demo.alorferi.com/images/blank_product_picture.png")
                  : Image.network(
                "https://demo.alorferi.com${product["url"]}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${product["name"]}", style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
