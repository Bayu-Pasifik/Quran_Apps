import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_apps/app/data/models/surah_model.dart';
import 'package:quran_apps/app/modules/home/controllers/home_controller.dart';
import 'package:quran_apps/app/routes/app_pages.dart';

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
              onTap: () => Get.toNamed(Routes.DETAIL_SURAH, arguments: model),
              leading: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/border.png"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Text('${model.number}'),
                  )),
              title: Text("${model.name!.transliteration!.id}",
                  style: GoogleFonts.poppins()),
              subtitle: Row(
                children: [
                  Text("${model.revelation?.id}", style: GoogleFonts.poppins()),
                  const SizedBox(width: 10),
                  Text("${model.numberOfVerses} ayat",
                      style: GoogleFonts.poppins())
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
