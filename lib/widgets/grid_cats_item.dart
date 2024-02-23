import 'package:cat_pet_store_application/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cat.dart';
import '../provider/cart_provider.dart';

class GridCatsItem extends StatelessWidget {
  const GridCatsItem({
    Key? key,
    required this.cat,
  }) : super(key:key);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return GridTile(
      child: MaterialButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailScreen(cat: cat,)),
          );
        },
        child: Container(
          width: 169,
          height: 250,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 144,
                  height: 91,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: NetworkImage(cat.cardImage),
                        fit: BoxFit.fill,
                      ),
                  ),
                ),
                const SizedBox(height: 4,),
                Text(
                  cat.breed,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${cat.price}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    IconButton(
                      color: Colors.orangeAccent,
                      onPressed: () {
                        if (cartProvider.items.contains(cat)) {
                          cartProvider.remove(cat);
                        } else {
                          cartProvider.add(cat);
                        }
                      },
                      icon: Icon(
                        cartProvider.items.contains(cat) ? Icons.check : Icons.shopping_cart,
                        color: cartProvider.items.contains(cat) ? Colors.orangeAccent : null,
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}