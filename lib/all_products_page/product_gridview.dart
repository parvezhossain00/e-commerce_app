
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_to_card_controller.dart';
import 'details_page.dart';

class ProductGridView extends StatelessWidget {
  final Map<String, dynamic> product;
  final AddToCartController? addToCartController;

  ProductGridView({required this.product, this.addToCartController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: (){
          Get.to(DetailsPage(products: product));
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: product["url"] == null
                    ? Image.network(
                        "https://demo.alorferi.com/images/blank_product_picture.png")
                    : Image.network("https://demo.alorferi.com${product["url"]}"),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "   ${product["name"]}",
                        style: const TextStyle(fontWeight: FontWeight.w900),
                        maxLines: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("৳ ${product["price"]}"),
                        Text("In Stock: ${product['stock_quantity']}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
        
                              addToCartController!.addToCart(product);
        
                              // Show a snackbar to indicate that the product has been added to the cart
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Product added to cart successful')));
                            },
                            child: SizedBox(
        
        
                                height: 80,
                                width: 90,
                                child: Image.asset("assets/addtocart.png"))),
                        Icon(Icons.favorite)
                      ],
                    ),
        
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
