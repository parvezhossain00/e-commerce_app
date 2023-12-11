
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../payment_page/payment_screen_page.dart';



class DetailsPage extends StatelessWidget {
  // final Map<String, dynamic> product;
  // final AddToCartController? addToCartController;

  var products;

  DetailsPage({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.orangeAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.20),
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              child: products["url"] == null
                  ? Image.network(
                  "https://demo.alorferi.com/images/blank_product_picture.png")
                  : Image.network(
                  "https://demo.alorferi.com${products["url"]}"),
            ),
            SizedBox(),
            Center(
              child: Text(
                "Name: ${products['name']}",
                style:
                const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "Price: ${products['price']}",
                style:
                const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "Stock_quantity: ${products['stock_quantity']}",
                style:
                const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Get.to(() => Payment(price: products['price']));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              minWidth: double.infinity,
              height: 60,
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(00)),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}