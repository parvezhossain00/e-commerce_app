import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/seller_controller.dart';

class SellerProductPage extends StatelessWidget {
  final String sellerId;


  SellerController sellerController = Get.put(SellerController());

  SellerProductPage({required this.sellerId}) {
    // Constructor - Fetch seller products when the widget is created
    sellerController.sellerProduct(sellerId);
    SellerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Products'),
      ),
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
                    itemCount: sellerController.sellerProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      var product = sellerController.sellerProducts[index];
                      return ProductCard(product: product);
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

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Handle product tap
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: product["url"] == null
                  ?  Image.network("https://demo.alorferi.com/images/blank_product_picture.png")
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
                  Text("${product["name"]}", style: TextStyle(fontWeight: FontWeight.w700),maxLines: 1,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
