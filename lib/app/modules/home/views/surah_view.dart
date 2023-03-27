import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quran_apps/app/data/models/surah_model.dart';
import 'package:quran_apps/app/modules/home/controllers/home_controller.dart';

class SurahView extends GetView<HomeController> {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahModel>>(
      future: controller.getAllSurah(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
        }
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            SurahModel model = snapshot.data![index];
            return ListTile(
              leading: Text("${model.number}"),
              title: Text("${model.name!.transliteration!.id}"),
              subtitle: Row(
                children: [
                  Text("${model.revelation?.id}"),
                  SizedBox(width: 10),
                  Text("${model.numberOfVerses} ayat")
                ],
              ),
              trailing: Text("${model.name?.short}"),
            );
          },
        );
      },
    );
  }
}
