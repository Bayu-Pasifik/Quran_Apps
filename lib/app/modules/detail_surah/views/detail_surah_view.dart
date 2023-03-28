import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_apps/app/constant/color.dart';
import 'package:quran_apps/app/data/models/detaail_surah.dart' as detail;
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
            FutureBuilder<detail.DetailSurah>(
              future: controller.getDetails(model.number!),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
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
                return ListView.separated(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: snapshot.data!.numberOfVerses!,
                  itemBuilder: (context, index) {
                    detail.DetailSurah detailSurah = snapshot.data!;
                    return Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: appGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/border.png"),
                                                  fit: BoxFit.cover)),
                                          child: Center(
                                            child: Text('${index + 1}'),
                                          )),
                                      GetBuilder<DetailSurahController>(
                                          builder: ((c) => Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.defaultDialog(
                                                            title: "Bookmark",
                                                            middleText:
                                                                "Pilih jenis Bookmark",
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  // c.bookMark(
                                                                  //     true,
                                                                  //     ayat!,
                                                                  //     snapshot
                                                                  //         .data!,index);
                                                                },
                                                                child: Text(
                                                                    "Last Read"),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        primary:
                                                                            appNormalPurple),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  // c.bookMark(
                                                                  //     false,
                                                                  //     ayat!,
                                                                  //     snapshot
                                                                  //         .data!,index);
                                                                },
                                                                child: Text(
                                                                    "Bookmark"),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        primary:
                                                                            appNormalPurple),
                                                              ),
                                                            ]);
                                                      },
                                                      icon: Icon(Icons
                                                          .bookmark_add_outlined)),
                                                  // (ayat?.audioStatus == 'stop')
                                                  // ?
                                                  IconButton(
                                                      onPressed: () {
                                                        // controller
                                                        //     .playAudio(ayat!);
                                                      },
                                                      icon: Icon(
                                                          Icons.play_arrow))
                                                  // :
                                                  // Row(
                                                  //     mainAxisSize:
                                                  //         MainAxisSize.min,
                                                  //     children: [
                                                  //       (ayat?.audioStatus ==
                                                  //               'playing')
                                                  //           ? IconButton(
                                                  //               onPressed:
                                                  //                   () {
                                                  //                 controller
                                                  //                     .pauseAudio(
                                                  //                         ayat!);
                                                  //               },
                                                  //             icon: Icon(Icons
                                                  //                 .pause),
                                                  //           )
                                                  //         : IconButton(
                                                  //             onPressed:
                                                  //                 (() {
                                                  //               controller
                                                  //                   .resumeAudio(
                                                  //                       ayat!);
                                                  //             }),
                                                  //             icon: Icon(Icons
                                                  //                 .play_arrow),
                                                  //           ),
                                                  //     IconButton(
                                                  //       onPressed: () {
                                                  //         controller
                                                  //             .stopAudio(
                                                  //                 ayat!);
                                                  //       },
                                                  //       icon: Icon(
                                                  //           Icons.stop),
                                                  //     )
                                                  //   ],
                                                  // )
                                                ],
                                              )))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2, top: 10),
                              child: Text(
                                '${detailSurah.verses![index].text!.arab}',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${detailSurah.verses![index].text?.transliteration?.en}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${detailSurah.verses![index].translation?.id}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
