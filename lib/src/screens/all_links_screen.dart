
import 'package:barq/src/models/websites_response_model.dart';
import 'package:barq/src/screens/website_details_screen.dart';
import 'package:barq/src/utils/networking/websites_api.dart';
import 'package:barq/src/utils/preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllLinksScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => AllLinksScreen(),
      );

  @override
  _AllLinksScreenState createState() => _AllLinksScreenState();
}

class _AllLinksScreenState extends State<AllLinksScreen> {
  bool isLoading = false;
  List<WebsitesResponseModel> websites = List();

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => WebsitesApi(),
    //   child: Consumer<WebsitesApi>(
    //     builder: (context, websitesApi, child) {
    //       UserPreferences userPreferences = UserPreferences();
    //       userPreferences.getUser().then((authenticationResponseModel) => {
    //         websitesApi.getWebsites(authenticationResponseModel.user.sId, authenticationResponseModel.jwt).then((result) {
    //           if(result['status']){
    //             websites = result['data'];
    //           }
    //         })
    //       });
    //       return SafeArea(
    //         child: Scaffold(
    //           body: WebsitesApi.loading ? _loading() : buildDataWidget(),
    //         ),
    //       );
    //     },
    //   ),
    // );

    return SafeArea(
      child: Scaffold(
        body: isLoading ? _loading() : buildDataWidget(),
      ),
    );
  }

  void getDataFromAPI() async {
    // var response = await http.get(Uri.parse(AppUrl.websites_url), headers: {
    //   'Authorization':
    //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmZGE4MzY5NjJkYWYyMDAxNzNjZmIyMCIsImlhdCI6MTYwODE1Njc5MSwiZXhwIjoxNjEwNzQ4NzkxfQ.V9VB-D_gaofRcsf-WPuSopT1a1oudZajsLbsydevkMs'
    // });
    // if (response.statusCode != 200) {
    //   setState(() {
    //     Flushbar(
    //       title: AppLocalizations.of(context).loadingFailed,
    //       message: AppLocalizations.of(context).couldNotFetchData,
    //       duration: Duration(milliseconds: 1500),
    //     ).show(context);
    //   });
    // }
    // var parsedJson = await json.decode(response.body) as List;
    // setState(() {
    //   websites = parsedJson
    //       .map((websitesResponseModel) =>
    //           WebsitesResponseModel.fromJson(websitesResponseModel))
    //       .toList();
    //   websites = websites.reversed.toList();
    // });

    isLoading = true;
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getUser().then((authenticationResponseModel) => {
      WebsitesApi().getWebsites(authenticationResponseModel.user.sId, authenticationResponseModel.jwt).then((result) {
        if(result['status']){
          setState(() {
            websites = result['data'];
            isLoading = false;
          });
        } else{
          isLoading = false;
        }
      })
    });
  }

  buildDataWidget() {
    if (websites.length < 1) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations.of(context).addWebsite,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
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
                      Icon(
                        Icons.language,
                        color: Colors.orange,
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
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${websites[index].websiteURL}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0x909e9e9e),
                                    fontFamily: ''),
                              )
                            ],
                          ))
                    ],
                  ),
                ));
          });
    }
  }

  Widget _loading() {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
            backgroundColor: Colors.black,
            strokeWidth: 2,
            valueColor:
                new AlwaysStoppedAnimation<Color>(const Color(0xffFEC200))),
        height: 60,
        width: 60,
      ),
    );
  }
}
