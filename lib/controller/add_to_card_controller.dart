
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  RxList cartItems = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartItems;
    addToCart;
    removeFromCart;
    getTotalAmount();
  }

  void addToCart(Map<String, dynamic> product) {
    // Check if the product is already in the cart
    final existingProductIndex = cartItems.indexWhere((item) => item["id"] == product["id"]);

    if (existingProductIndex != -1) {
      // If the product is already in the cart, increment the quantity
      cartItems[existingProductIndex]["quantity"]++;

    } else {
      // If the product is not in the cart, add it with quantity 1
      product["quantity"] = 1;
      cartItems.add(product);
    }
    refresh();
    update();
  }

  void removeFromCart(Map<String, dynamic> product) {
    // Check if the product is in the cart
    final existingProductIndex = cartItems.indexWhere((item) => item["id"] == product["id"]);

    if (existingProductIndex != -1) {
      // If the product is in the cart, decrement the quantity
      cartItems[existingProductIndex]["quantity"] -= 1;

      // If the quantity becomes zero, remove the product from the cart
      if (cartItems[existingProductIndex]["quantity"] <= 0) {
        cartItems.removeAt(existingProductIndex);
      }
    }

    refresh();
    update();
  }

  void clearCart() {
    cartItems.clear();
  }

  double getTotalAmount() {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["quantity"];
    }
    return total;
  }
}
