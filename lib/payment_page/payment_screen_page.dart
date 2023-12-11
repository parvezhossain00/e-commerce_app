
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  Payment({
    Key? key,
    required this.price,
  }) : super(key: key);

  final num price;

  bool bkashSelected = false;
  bool nagadSelected = false;
  bool stripeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Make Payment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "$price",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildPaymentOption('bkash', 'assets/bkash_logo.png', bkashSelected),
            const SizedBox(
              height: 10,
            ),
            buildPaymentOption('Nagad', 'assets/nagad_logo.png', nagadSelected),
            const SizedBox(
              height: 10,
            ),
            buildPaymentOption('Stripe', 'assets/stripe_logo.png', stripeSelected),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text('Payment successful')));
                  // Handle submission logic here
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String name, String imagePath, bool isSelected) {
    return Row(
      children: [
        Checkbox(

          value: isSelected,
          onChanged: (bool? value) {
            // Handle checkbox selection logic here
            if (name == 'bkash') {
              bkashSelected = value ?? true;
            } else if (name == 'Nagad') {
              nagadSelected = value ?? true;
            } else if (name == 'Stripe') {
              stripeSelected = value ?? true;
            }
          },
        ),
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(name),
      ],
    );
  }
}