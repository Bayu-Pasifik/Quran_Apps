import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_apps/app/constant/color.dart';
import 'package:quran_apps/app/data/models/surah_model.dart';
import 'package:quran_apps/app/widgets/bg_container.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SurahModel model = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${model.name!.transliteration!.id}',
            style: GoogleFonts.poppins(color: appDarkPurple),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: appNormalPurple),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            BgContainer(
              title: model.name!.transliteration!.id!,
              translate: model.name!.translation!.id!,
              revelation: model.revelation!.id!,
              numberOfVerse: model.numberOfVerses!.toString(),
              tafsir: model.tafsir!.id!,
            ),
            Container(
              height: context.height,
              width: context.width,
              // child: ,
            )
          ],
        ));
  }
}
