import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_apps/app/modules/home/views/surah_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quran App',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Assalamualaikum"),
                SizedBox(height: 10),
                Text("Tanvir Ahasan"),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[400],
                  ),
                ),
                const SizedBox(height: 10),
                const TabBar(
                    labelColor: Colors.black,
                    tabs: [Tab(text: "Surah"), Tab(text: "Juz")]),
                const Expanded(
                  child: TabBarView(
                    children: [SurahView(), Text("Juz")],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
