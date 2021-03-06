// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memoire/models/user.dart';

var logo = "logo.png";
var profile = {
  "name": "user",
  "image": "https://img.icons8.com/fluency/240/000000/user-male-circle.png",
  "email": "",
};
int usertype = 2;
User? user;
var pswrd;

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "Villa", "icon": FontAwesomeIcons.university},
  {"name": "Apparetemnt", "icon": FontAwesomeIcons.home},
  {"name": "Garage", "icon": FontAwesomeIcons.storeAlt},
  {"name": "Studio", "icon": FontAwesomeIcons.building},
];

List filter = [
  {
    "name": "Price",
  },
  {
    "name": "Location",
  },
  {
    "name": "Rent",
  },
  {
    "name": "Buy",
  },
  {
    "name": "Vacation",
  },
];

List wilaya = [
  {
    "image":
        "https://images.unsplash.com/photo-1575664274476-e02d99195164?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80",
    "name": "Alger",
  },
  {
    "image":
        "https://2.bp.blogspot.com/-k4Hb8w4Bvt4/W4WDedMYoyI/AAAAAAAAqX4/upV1rxtP44c8OcqXdjh3paQ1Keb4xNOoACLcBGAs/s1600/constantine.jpg",
    "name": "Constantine",
  },
  {
    "image":
        "https://i.pinimg.com/564x/71/ee/33/71ee33b80632aa4ee5e2debd77b252aa.jpg",
    "name": "Oran",
  },
  {
    "image":
        "https://pbs.twimg.com/media/D3VKERZW4AAW5_3?format=jpg&name=900x900",
    "name": "Annaba",
  },
];

List recents = [
  {
    "image":
        "https://images.unsplash.com/photo-1571939228382-b2f2b585ce15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "name": "Double Villa",
    "price": "\$180k",
    "location": "Alger",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1560185007-5f0bb1866cab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "name": "Convertible Studio",
    "price": "\$150k",
    "location": "Constantine",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Double Villa",
    "price": "\$180k",
    "location": "Oran",
    "is_favorited": false,
  },
];

const List logement = [
  {
    "type": 'Apparetemnt',
    "img": 'assets/log/aprtm.jpg',
  },
  <String, dynamic>{
    'type': 'Villa',
    'img': 'assets/log/villa.jpg',
  },
  <String, dynamic>{
    'type': 'Garage',
    'img': 'assets/log/garage.jpg',
  },
  <String, dynamic>{
    'type': 'Studio',
    'img': 'assets/log/studio.jpg',
  },
];

List equipements = [
  {
    "name": "Bed",
    "icon": FontAwesomeIcons.bed,
  },
  {"name": "Bath", "icon": FontAwesomeIcons.bath},
  {"name": "Room", "icon": FontAwesomeIcons.personBooth},
  {"name": "Visitors", "icon": FontAwesomeIcons.solidUser},
  {"name": "  Wifi", "icon": FontAwesomeIcons.wifi},
  {"name": "Water", "icon": FontAwesomeIcons.faucet},
  {"name": "Gaz", "icon": FontAwesomeIcons.fire},
  {"name": "Clim", "icon": FontAwesomeIcons.snowflake},
  {"name": "  TV", "icon": FontAwesomeIcons.tv},
  {"name": "  Pool", "icon": FontAwesomeIcons.swimmingPool},
  {"name": " Furnitured", "icon": FontAwesomeIcons.couch},
  {"name": "  Park", "icon": FontAwesomeIcons.parking},
  {"name": "  Cam", "icon": FontAwesomeIcons.camera},
];
