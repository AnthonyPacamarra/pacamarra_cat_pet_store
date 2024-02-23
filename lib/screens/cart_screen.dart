import 'package:cat_pet_store_application/models/cat.dart';
import 'package:cat_pet_store_application/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
      body: _buildUI(),
    );
  }

  // PreferredSizeWidget _appBar() {
  //   return AppBar(
  //     title: const Text(
  //       "Cart"
  //     ),
  //   );
  // }

  Widget _buildUI() {
    return Consumer<CartProvider>( 
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Cat cat = provider.items[index];
                  return ListTile( 
                    title: Row(
                      children: [
                        Text(
                          cat.breed,
                        ),
                      ],
                    ),
                    onLongPress: () {
                      provider.remove(cat);
                    },
                  );
                }
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text("Cart Total: \$${provider.getTotal()}")
          ],
        );
      }
    );
  }
}