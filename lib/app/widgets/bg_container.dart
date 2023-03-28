import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_apps/app/constant/color.dart';

class BgContainer extends StatelessWidget {
  final String title;
  final String translate;
  final String numberOfVerse;
  final String revelation;
  final String tafsir;
  const BgContainer({
    super.key,
    required this.title,
    required this.translate,
    required this.numberOfVerse,
    required this.revelation,
    required this.tafsir,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -60,
          top: 40,
          child: Container(
            // color: Colors.amber,
            height: context.height / 3,
            width: context.width,
            child: Image.asset(
              "assets/quran.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: context.height / 3,
          width: context.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                appLightPurple.withOpacity(0.85),
                appNormalPurple.withOpacity(0.85)
              ])),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(title, style: GoogleFonts.poppins(color: appWhite)),
              const SizedBox(height: 10),
              Text(translate, style: GoogleFonts.poppins(color: appWhite)),
              const SizedBox(height: 10),
              const Divider(
                  indent: 50, endIndent: 60, thickness: 2, color: appWhite),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(revelation, style: GoogleFonts.poppins(color: appWhite)),
                  const SizedBox(width: 10),
                  Text("$numberOfVerse ayat",
                      style: GoogleFonts.poppins(color: appWhite)),
                ],
              ),
              const SizedBox(height: 20),
              Text("بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                  style: GoogleFonts.poppins(fontSize: 24, color: appWhite)),
            ],
          ),
        )
      ],
    );
  }
}
