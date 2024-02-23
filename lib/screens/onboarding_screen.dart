import 'package:cat_pet_store_application/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScren extends StatefulWidget {
  const OnboardingScren({super.key});

  @override
  State<OnboardingScren> createState() => OnboardingScrenState();
}

class OnboardingScrenState extends State<OnboardingScren>{
  
  final PageController pageController = PageController();
  int activePage = 0;
  void onNextPage(){
    if (activePage < pages.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }
  final List<Map<String, dynamic>> pages = [
    {
      'image':'assets/onboarding/1.png',
      'title':'Welcome to Cat Store!',
      'description':"Ready to embark on a journey of feline companionship? Let's get started by exploring our wide range of adorable cats waiting for a loving home. From playful kittens to majestic seniors, we have the perfect companion for every cat lover.",
      'skip': true,
    },
    {
      'image':'assets/onboarding/2.png',
      'title':'Discover Your Perfect Pet!',
      'description':"Swipe through our gallery of charming cats to find your purrfect match. Whether you're drawn to playful kittens or elegant adults, we have a variety of personalities and breeds just waiting to steal your heart.",
      'skip': true,
    },
    {
      'image':'assets/onboarding/3.png',
      'title':'Get Ready For Cat Store!',
      'description':"Once you've found the cat that captures your affection, it's time to make it official! Complete the adoption process and prepare for a lifetime of cuddles, purrs, and unforgettable memories. Welcome to the family!",
      'skip': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (int page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index){
              return OnboardingWidget(
                image: pages[index]['image'],
                title: pages[index]['title'],
                description: pages[index]['description'],
                skip: pages[index]['skip'],
                onTab: onNextPage,
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator()
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];

    for(var i = 0; i < pages.length; i++) {
      if(activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300,),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300,),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}