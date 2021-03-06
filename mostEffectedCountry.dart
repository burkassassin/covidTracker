import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(countryData[index]['country'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(width: 10),
                      Text("Ölümler: " + countryData[index]['deaths'].toString(),style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
