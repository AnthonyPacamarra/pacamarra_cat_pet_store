import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cat.dart';
import '../provider/cart_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cat.detailedImage),
                  fit: BoxFit.fill
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cat.breed, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text("${cat.storeLocation} | ", style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.grey)),
                              Text("\$${cat.price}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, height: 1.5, color: Colors.orangeAccent))
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.black,
                        onPressed: () {
                          if (cartProvider.items.contains(cat)) {
                            cartProvider.remove(cat);
                          } else {
                            cartProvider.add(cat);
                          }
                        },
                        icon: Icon(
                          cartProvider.items.contains(cat) ? Icons.check : Icons.shopping_cart,
                          color: cartProvider.items.contains(cat) ? Colors.black : null,
                        ),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  const SizedBox( height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.catching_pokemon
                      ),
                      Text("About ${cat.breed}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox( width: 8,),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            children: [
                              const Text('Height',  style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.black)),
                              Text("${cat.height} cm",  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, height: 1.5, color: Colors.orangeAccent))
                            ],
                          ),
                        Column(
                            children: [
                              const Text('Weight',  style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.black)),
                              Text("${cat.height} kg",  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, height: 1.5, color: Colors.orangeAccent))
                            ],
                          ),
                        Column(
                          children: [
                            const Text('Color',  style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.black)),
                            Text(cat.color,  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18, height: 1.5, color: Colors.orangeAccent))
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(cat.description,  style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.grey))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}