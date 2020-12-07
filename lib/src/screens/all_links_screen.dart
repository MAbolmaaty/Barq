import 'dart:convert';

import 'package:barq/src/models/websites_response_model.dart';
import 'package:barq/src/screens/website_details_screen.dart';
import 'package:barq/src/utils/networking/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class AllLinksScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => AllLinksScreen(),
      );

  @override
  _AllLinksScreenState createState() => _AllLinksScreenState();
}

class _AllLinksScreenState extends State<AllLinksScreen> {
  bool isLoading = false;
  List<WebsitesResponseModel> websites;

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator(
                backgroundColor: Colors.black,
              )
          : buildDataWidget(),
    );
  }

  void getDataFromAPI() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(AppUrl.websites_url));
    var parsedJson = await json.decode(response.body) as List;
    setState(() {
      websites = parsedJson.map((websitesResponseModel) => WebsitesResponseModel.fromJson(websitesResponseModel)).toList();
      isLoading = false;
    });
  }

  buildDataWidget() {
    if (websites.length < 1) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations.of(context).addWebsite,
            style: TextStyle(
                fontFamily: 'Cairo', fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: websites.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(WebsiteDetailsScreen.route());
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      websites[index].status
                          ? Icon(
                              Icons.language,
                              color: Colors.orange,
                              size: 50,
                            )
                          : Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50,
                            ),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${websites[index].websiteName}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                '${websites[index].websiteURL}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0x909e9e9e)),
                              )
                            ],
                          ))
                    ],
                  ),
                ));
          });
    }
  }
}
