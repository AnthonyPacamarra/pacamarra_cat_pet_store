import 'package:cat_pet_store_application/models/cat.dart';
import 'package:cat_pet_store_application/models/avail_cats.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_cats_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  // PreferredSizeWidget _appBar(BuildContext context) {
  //   return AppBar(
  //     title: const Text(
  //       "Store"
  //     ),
  //     actions: [
  //       IconButton(
  //         onPressed: () {
  //           Navigator.pushNamed(context, "/cart");
  //         },
  //         icon: const Icon(
  //           Icons.shopping_cart,
  //         )
  //       ),
  //     ],
  //   );
  // }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: availCats.length, 
          itemBuilder: (context, index){
            Cat cat = availCats[index];
            return GridCatsItem(
              cat: cat,
              breed: cat.breed, 
              cardImage: cat.cardImage, 
              price: cat.price, 
              age: cat.age, 
              gender: cat.gender
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width ~/ 168,
            childAspectRatio: 1/1.1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          )
        ),
      )
    );
  }

}