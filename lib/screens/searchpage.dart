import 'package:citytransfers_cabs/brand_colors.dart';
//import 'package:citytransfers_cabs/datamodels/prediction.dart';
//import 'package:citytransfers_cabs/dataprovider/appdata.dart';
import 'package:citytransfers_cabs/globalvariable.dart';
import 'package:citytransfers_cabs/widgets/set_des.dart';
//import 'package:citytransfers_cabs/helpers/requesthelper.dart';
//import 'package:citytransfers_cabs/widgets/BrandDivier.dart';
//import 'package:citytransfers_cabs/widgets/PredictionTile.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
//import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var pickupController = TextEditingController();
  var destinationController = TextEditingController();

  var focusDestination = FocusNode();

  bool focused = false;

  void setFocus(){
    if(!focused){
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  //List<Prediction> destinationPredictionList = [];

  /*void searchPlace(String placeName) async {

    if(placeName.length > 1){

      String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=123254251&components=country:ng';
      var response = await RequestHelper.getRequest(url);

      if(response == 'failed'){
        return;
      }

      if(response['status'] == 'OK'){
        var predictionJson = response['predictions'];
        var thisList = (predictionJson as List).map((e) => Prediction.fromJson(e)).toList();

        setState(() {
          destinationPredictionList = thisList;
        });

      }

    }

  }*/

  @override
  Widget build(BuildContext context) {

    setFocus();

    //String address = Provider.of<AppData>(context).pickupAddress.placeName ?? '';
   // pickupController.text = address;

    return Scaffold(






      body: Column(
        children: <Widget>[
          Container(
            height: 310,
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(
                      0.7,
                      0.7,
                    ),
                  ),
                ]
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24, top: 48, right: 24, bottom: 20),
              child: Column(
                children: <Widget>[

                  SizedBox(height: 5,),
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                      },
                          child: Icon(Icons.arrow_back)
                      ),
                      Center(



                        
                        child: Text('Set Destination',
                          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.purple,fontSize: 20),
                        ),
                        
                      
                      
                      
                      
                      ),
                    ],
                  ),

                  SizedBox(height: 28,),

                  Row(
                    children: <Widget>[
                      Image.asset('images/pickicon.png', height: 16, width: 16,),

                      SizedBox(width: 18,),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: BrandColors.colorLightGrayFair,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextField(
                              controller: pickupController,
                              decoration: InputDecoration(
                                hintText: 'Pickup location',
                                fillColor: BrandColors.colorLightGrayFair,
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),

                  Row(
                    children: <Widget>[
                      Image.asset('images/desticon.png', height: 16, width: 16,),

                      SizedBox(width: 18,),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: BrandColors.colorLightGrayFair,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextField(
                              onChanged: (value){
                                //searchPlace(value);
                              },
                              focusNode: focusDestination,
                              controller: destinationController,
                              decoration: InputDecoration(
                                  hintText: 'Where to?',
                                  fillColor: BrandColors.colorLightGrayFair,
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}