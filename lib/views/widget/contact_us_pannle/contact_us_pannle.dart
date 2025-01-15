import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilitys/constants/color_constants.dart';
import '../text/tile_text.dart';

class ContactUsPanel extends StatelessWidget {
  final Uri _url = Uri.parse('mailto:patelkrishu888@gmail.com');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkQuizCard,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child:  TitleText(
              "Contact Us",
              color: Colors.orange,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    _lunchURL();
                  },
                  child: TitleText("Patelkrishu888@gmail.com",color: Colors.blue,)),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    _lunchURL();
                  },
                  child: TitleText("Dhameliyarudra2023katargaam@gmail.com",color: Colors.blue,)),
              SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _lunchURL() async {
    if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
    }
  }
}