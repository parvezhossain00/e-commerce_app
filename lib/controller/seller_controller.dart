import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SellerController extends GetxController {
  var sellers = [].obs;
  var sellerProducts = [].obs;
  RxBool isLoading = false.obs;
  int currentPage = 1 ;

  Future <void> loadMore() async{
    currentPage++;
    await getSeller(loadMore: true);
  }

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      isLoading.value = true;

      // Fetch sellers and seller products concurrently
      await Future.wait([getSeller(), sellerProduct(sellers.isEmpty ? "" : sellers[0]["id"])]);

      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
      isLoading.value = false;
    }
  }

  Future<void> getSeller({bool loadMore = false}) async {
    if(!loadMore){
      isLoading.value = true;
      currentPage = 1;
    }
    final url = Uri.parse("https://demo.alorferi.com/api/users?page=$currentPage");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> sellerData = responseData['data'];
      sellers.value = List.from(sellerData);
      print("Sellers fetch successful");
    } else {
      print("Sellers fetch failed");
    }
  }

  Future<void> sellerProduct(String sellerId) async {
    final url = Uri.parse("https://demo.alorferi.com/api/users/$sellerId/products");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> sellerProductsData = responseData['data'];
      sellerProducts.value = List.from(sellerProductsData);
      print("Seller products fetch successful");
    } else {
      print("Seller products fetch failed");
    }
  }
}
