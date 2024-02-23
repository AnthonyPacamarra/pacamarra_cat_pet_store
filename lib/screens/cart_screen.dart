import 'package:cat_pet_store_application/models/cat.dart';
import 'package:cat_pet_store_application/provider/cart_provider.dart';
import 'package:cat_pet_store_application/widgets/cart_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>( 
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(height: 10,),
            Text("Cart" , style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    Cat cat = provider.items[index];
                    return CartGridDisplay(
                      cat: cat,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 168,
                    childAspectRatio: 1/1.1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  )
                ),
              ),
            ),
            Text("Cart Total: \$${provider.getTotal()}", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
          ],
        );
      }
    );
  }
}