import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Tab App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBarController(),
    );
  }
}

class TabBarController extends StatelessWidget {
  final controller = Get.put(TabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.black,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(bodySmall: const TextStyle(color: Colors.black)),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectTab(index),
            items: const [
              BottomNavigationBarItem(
                label: 'TAB 1',
                icon: const SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                label: 'TAB 2',
                icon: const SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                label: 'TAB 3',
                icon: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabController extends GetxController {
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    if (selectedIndex.value == index) {
      Get.to(Page1());
    } else {
      selectedIndex.value = index;
    }
  }
}

class Page1 extends StatelessWidget {
  final controller = Get.put(Page1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PAGE 1'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black, width: 1)),
          onPressed: () => Get.to(Page2()),
          child: const Text(
            'PAGE 2',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Page1Controller extends GetxController {}

class Page2 extends StatelessWidget {
  final controller = Get.put(Page2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PAGE 2'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black, width: 1)),
          onPressed: () => Get.to(Page3()),
          child: const Text(
            'PAGE 3',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Page2Controller extends GetxController {}

class Page3 extends StatelessWidget {
  final controller = Get.put(Page3Controller());

  final List<String> items = (jsonDecode('''
  {
    "page3": [
      "Samosas.",
      "Chaat.",
      "Pani Puri.",
      "Bhelpuri.",
      "Kachori.",
      "Chole Bhature.",
      "Matar Kulcha.",
      "Dosa.",
      "Milk.",
      "Bread.",
      "Butter.",
      "Cheese.",
      "Yoghurt.",
      "Sandwich.",
      "Pancake.",
      "Pie.",
      "Cake.",
      "Lemon.",
      "Pizza.",
      "Carrots.",
      "Grapes.",
      "Eggs.",
      "Oats.",
      "Pancakes.",
      "Crepes.",
      "Waffles.",
      "Idli."
    ]
  }
  ''')['page3'] as List<dynamic>).cast<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color.fromARGB(255, 187, 234, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(items[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Page3Controller extends GetxController {}
