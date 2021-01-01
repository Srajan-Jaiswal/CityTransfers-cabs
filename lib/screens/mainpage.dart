import 'package:citytransfers_cabs/widgets/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class MainPage extends StatefulWidget {
  static const String id = 'mainpage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(
                  controller); // when map is created pass the instance of controller
              mapController = controller;
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: 310,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 30.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.7,
                            0.7,
                          ))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome Back !",
                        style: TextStyle(fontSize: 12,fontWeight:FontWeight.w600,color: Colors.purple),
                      ),
                      Text(
                        "Start your Trip",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(
                                    0.7,
                                    0.7,
                                  ))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.search, color: Colors.purple),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Enter drop location",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 22),

                    Row(
                      children: <Widget>[
                        Icon(OMIcons.home,color: Colors.purple,),
                        SizedBox(width: 12),
                    Column(
                      children: <Widget>[
                        Text("Add Home",style:TextStyle(fontWeight:FontWeight.w600)),
                        SizedBox(height: 4,),
                        Text("     Your residential address",style:TextStyle(color:Colors.grey)),


                      ]
                    )


                      ],
                    )

                    ],
                  ),
                )),
          )
        ]));
  }
}
