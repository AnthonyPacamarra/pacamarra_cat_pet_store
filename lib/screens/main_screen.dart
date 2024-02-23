import 'package:cat_pet_store_application/models/cat.dart';
import 'package:cat_pet_store_application/models/avail_cats.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_cats_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late List<Cat> _filteredCats;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredCats = List.from(availCats);
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCats = availCats
          .where((cat) => cat.breed
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          Text("Store" , style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Cats...',
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.orangeAccent,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
              ),
            ),
          ),
          Expanded(child: _buildUI(context)),
        ],
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _filteredCats.length,
        itemBuilder: (context, index) {
          Cat cat = _filteredCats[index];
          return GridCatsItem(
            cat: cat,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 168,
          childAspectRatio: 1 / 1.1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ));
  }
}
