import 'package:cat_pet_store_application/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.image, required this.title, required this.description, required this.skip, required this.onTab});

  final String image;
  final String title;
  final String description;
  final bool skip;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orangeAccent,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.86,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill
              )
            ),
          ),
          Positioned(
            top: 380,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 62),
                    Text(description, style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.grey), textAlign: TextAlign.center,),
                  ],
                )
              )
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: skip ? 
            Row(
              children: [
                const SizedBox( width: 300,),
                GestureDetector(
                  onTap: onTab,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Icon(Icons.arrow_circle_right, color: Colors.white, size: 42,),
                  ),
                ),
              ],
            ) : 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 300,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const NavigationMenu()),
                      );
                    },
                    child: const Text('Get Started', style: TextStyle(color: Colors.white),),
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}