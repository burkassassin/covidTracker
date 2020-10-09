import 'dart:convert';

import 'package:covid19tracker_thirdapp/datasource.dart';
import 'package:covid19tracker_thirdapp/pages/countryPage.dart';

import 'package:covid19tracker_thirdapp/panel/dailydeaths.dart';
import 'package:covid19tracker_thirdapp/panel/infopannel.dart';

import 'package:covid19tracker_thirdapp/panel/mostEffectedCountry.dart';
import 'package:covid19tracker_thirdapp/panel/worldwidepanel.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'CovIDNUM PLATFORM',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(15)
                    ) ,
                    child: Text(
                      'Dünya Ne Durumda ?',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Ülkeler',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: primaryBlack,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Bugünkü Ölüm Sayıları',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            countryData == null
                ? Container()
                : DailyDeaths(
                    countryData: countryData,
                  ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                   color: primaryBlack,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text(
                  'En Çok Etkilenen Ülkeler',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            SizedBox(height: 20),
            InfoPanel(),
            SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}
