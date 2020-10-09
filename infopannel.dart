import 'package:covid19tracker_thirdapp/datasource.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                launch(
                    'https://www.ailevecalisma.gov.tr/sayfa/kovid-19-bagis-hesap-numaralari/');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Ülkene Destek Ol !",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
          SizedBox(height: 10),
          GestureDetector(
              onTap: () {
                launch('https://hsgm.saglik.gov.tr/tr/covid19');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Nedir COVİD-19?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
