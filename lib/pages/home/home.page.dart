import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Color primaryCol = Color(0xff8A051C); //maroon
//Color primaryCol = Color(0xff1ED760); //green
List<Map> songs = [
  {'song': 'Small Talk', 'duration': '4:29'},
  {'song': 'Bad Guy', 'duration': '2:45'},
  {'song': 'Boyfriend', 'duration': '3:28'},
  {'song': 'OMG', 'duration': '3:37'},
  {'song': 'Let Us Love', 'duration': '3:02'},
  {'song': 'July', 'duration': '3:42'},
];
int selectedSongIndex = 1;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffefefef),
      appBar: _homeAppBar(),
      body: _homeBody(),
      bottomNavigationBar: homeBottomMenu(),
    );
  }

  SizedBox homeBottomMenu() {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(child: Icon(Icons.shuffle), onTap: () {}),
            Row(
              children: [
                Icon(Icons.fast_rewind),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 10),
                      blurRadius: 15,
                    ),
                  ]),
                  child: Icon(
                    Icons.pause_circle_filled,
                    size: 60,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.fast_forward),
              ],
            ),
            InkWell(child: Icon(Icons.toc), onTap: () {}),
          ],
        ),
      ),
    );
  }

  SizedBox _homeBody() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 275,
                height: 390,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Bad guy",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Billie Eilish/Justin Bieber",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 20),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(primaryCol, BlendMode.multiply),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.pexels.com/photos/4972607/pexels-photo-4972607.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                  ),
                ),
              ),
              Positioned(
                bottom: -45,
                left: -40,
                child: SleekCircularSlider(
                  min: 0, //song start time
                  max: 4, //song end time (duration)
                  initialValue: 1, //default value
                  appearance: CircularSliderAppearance(
                    size: 360,
                    counterClockwise: true,
                    startAngle: 150,
                    angleRange: 120,
                    customWidths: CustomSliderWidths(
                      trackWidth: 3,
                      progressBarWidth: 10,
                      shadowWidth: 0,
                    ),
                    customColors: CustomSliderColors(
                      trackColor: Colors.black12,
                      progressBarColor: Colors.black,
                    ),
                    infoProperties: InfoProperties(
                      mainLabelStyle: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${songs[index]['song']}",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: index == selectedSongIndex
                                  ? primaryCol
                                  : Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "${songs[index]['duration']}",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: index == selectedSongIndex
                                  ? primaryCol
                                  : Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 35,
        ),
        onPressed: null,
      ),
      actions: [
        Transform.rotate(
          angle: (270 / (180 / pi)), //rotate by 270 degrees
          child: IconButton(
            icon: Icon(
              Icons.bar_chart,
              color: Colors.black,
              size: 35,
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}
