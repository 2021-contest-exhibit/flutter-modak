import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  late double centerLng;
  late double centerLat;
  late GoogleMapController controller;
  Set<Marker> _markers = {};

  late BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    super.initState();
    /*
    아래 함수를 테스트 도중에는 일시적으로 안돌아가게 ( virtual 기기의 위치가 우리나라가 아니라서 테스트하기 힘듬 )
    getPosition();
     */
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration( devicePixelRatio: 2.5 ),
       'image/logo.png');
  }


  getPosition() async {
    var permission = await Geolocator.requestPermission();
    print(permission);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      setState(() {
        centerLng = position.longitude;
        centerLat = position.latitude;
      });
    } on PlatformException catch (e) {
      print(e);
    } finally {
      _currentLocation();
    }
  }

  void _currentLocation() async {

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(centerLat, centerLng),
        zoom: 14.0,
      ),
    ));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.39344116934309, 126.81330326976159),
    zoom: 14.4746,
  );




  Widget floatingControlButton(Widget icon, String tagName) {
    return FloatingActionButton(
        heroTag: tagName,
        onPressed: () {
        },
        backgroundColor: Colors.black,
        mini: true,
        child: icon);
  }



  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set.from(_markers),
          onMapCreated: (GoogleMapController controller) {
            this.controller = controller;
            setState(() {
              _markers.add(
                  Marker(
                      markerId: MarkerId('55'),
                      position: LatLng(37.39344116934309, 126.81330326976159),
                      infoWindow: InfoWindow(title: 'test1'),
                      icon: pinLocationIcon
                  )
              );
            });
          }),
          Positioned(
            top: 48,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              width: _contentWidth,
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                ),
                onPressed: () {
                  getPosition();
                  Navigator.pushNamed(context, '/camping_search');
                },
                child: Row(
                  children: [Icon(Icons.search, color: Colors.black,)],
                ),
              )
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              children: [
                floatingControlButton(Image.asset(
                  'image/logo.png',
                  width: 16.0,
                  height: 16.0,
                ), '1'),
                floatingControlButton(Icon(Icons.ac_unit), '2'),
                floatingControlButton(Icon(Icons.ac_unit), '3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
