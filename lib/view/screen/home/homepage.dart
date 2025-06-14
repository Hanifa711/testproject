import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home_controller.dart';
import 'package:myshop/view/widget/home/customcardhome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 25,
            padding: EdgeInsets.all(20),
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
        titleSpacing: 25,

        title: Text(
          "Geocery Plus",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Location"),
                      Text(
                        "32 Llanberis Close, Tonteg, CF38 1HR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "Search Anything",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),

            const SizedBox(height: 20),

            GetBuilder<HomeController>(
              builder: (controller) {
                if (controller.categories.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final firstSix = controller.categories.take(6).toList();
                  return CustomCardHome(categories: firstSix);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
