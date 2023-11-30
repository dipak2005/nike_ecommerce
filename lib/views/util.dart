
import 'package:image_picker/image_picker.dart';

import 'util.dart';

List<Map<String, dynamic>> prolist = [
  {
    "image": "assets/n1.png",
    "name": "Nike Air Max SYSTM",
    "prize": "8595.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.9,
  },
  {
    "image": "assets/n2.png",
    "name": "NIKE BLAZER LOW'77 Vintage",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/n3.png",
    "name": "NIKE AIR FORCE 1'07",
    "prize": "8195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/n4.png",
    "name": "NIKE AIR MAX 1",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/n5.png",
    "name": "NIKE AIR MAX 90 FUTURA",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.9,
  },
  {
    "image": "assets/n6.png",
    "name": "NIKE AIR MAX SC SE",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.4,
  },
  {
    "image": "assets/n7.png",
    "name": "NIKE AIR MAX PLUSE ROAM",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.5,
  },
  {
    "image": "assets/n8.png",
    "name": "NIKE  AIR MAX PLUSE",
    "prize": "139.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/n9.png",
    "name": "NIKE AIR MAX PLUS",
    "prize": "3295.0",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/n10.png",
    "name": "NIKE AIR MAX  EXCEE",
    "prize": "7295.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.3,
  }
];
List<Map<String, dynamic>> productlist = [
  {
    "image": "assets/n1.png",
    "name": "Nike Air Max SYSTM",
    "prize": "8595.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.9,
  },
  {
    "image": "assets/n2.png",
    "name": "NIKE BLAZER LOW'77 Vintage",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/n3.png",
    "name": "NIKE AIR FORCE 1'07",
    "prize": "8195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/n4.png",
    "name": "NIKE AIR MAX1",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/n5.png",
    "name": "NIKE AIR MAX90 FTURA",
    "prize": "1795.00",
    "delivery": " 3.50",
    "product": 1,
    "rating": 3.9,
  },
  {
    "image": "assets/n6.png",
    "name": "NIKE AIRMAX SC SE",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.4,
  },
  {
    "image": "assets/n7.png",
    "name": "NIKE IR MX PLUSE ROAM",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.5,
  },
  {
    "image": "assets/n8.png",
    "name": "NIE  AR MAX PLUSE",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/n9.png",
    "name": "NIKE AIR MAX PLUS",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/n10.png",
    "name": "NIKE AIR MAX  EXCEE",
    "prize": "7995.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.3,
  },
  {
    "image": "assets/o1.png",
    "name": "NIKE BLAZAR 77'VINTAGE",
    "prize": "1295.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/o2.png",
    "name": "NIKE AIR JORDEN FLYER",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/o3.png",
    "name": "NIKE FREE RN NN",
    "prize": "8295.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/o4.png",
    "name": "NIKE AIR FORCE 1'07 EAYSON",
    "prize": "9875.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/o5.png",
    "name": "NIKE AIR MAX EXCEE",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/o6.png",
    "name": "REVOLUTION 5 RUNNING SHOES",
    "prize": "2195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/o7.png",
    "name": " NIKE MEN RUNNING SHOES",
    "prize": "3395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.8,
  },
  {
    "image": "assets/o8.png",
    "name": "NIKE MEN STRUCTURE 25 SHOES",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.7,
  },
  {
    "image": "assets/o9.png",
    "name": "NIKE GRIDE FLYING SHOES ",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.4,
  },
  {
    "image": "assets/o10.png",
    "name": "NIKE SHOES",
    "prize": "7995.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.7,
  },
  {
    "image": "assets/t1.png",
    "name": "NIKE BUTTERFLY SHOES",
    "prize": "8595.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.2,
  },
  {
    "image": "assets/t2.png",
    "name": "NIKE ANACONDA SHOES",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.8,
  },
  {
    "image": "assets/t3.png",
    "name": "NIKE GREEN COBRA",
    "prize": "8195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.5,
  },
  {
    "image": "assets/t4.png",
    "name": "NIKE LOFER SHOES",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/t5.png",
    "name": "NIKE BLUE RED MEN SHOES",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.9,
  },
  {
    "image": "assets/t6.png",
    "name": "NIKE CREAM MEN'S FOOTWEAR",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/t7.png",
    "name": "NIKE GREY FOOTWEAR",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/t7.png",
    "name": "NIKE SAFARI SHOES",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.8,
  },
  {
    "image": "assets/t9.png",
    "name": "NIKE RED MEN'S FOOTWEAR",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/t10.png",
    "name": "NIKE AIR FLYERS SHOES",
    "prize": "7995.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
];
List<Map<String, dynamic>> outlist = [
  {
    "image": "assets/o1.png",
    "name": "Nike Blaxar Mid'77 vintage",
    "prize": "1295.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/o2.png",
    "name": "Air Jordan 1Low",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/o3.png",
    "name": "Nike Free Rn NN",
    "prize": "8295.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/o4.png",
    "name": "Nike Air Force 1'07Easyon",
    "prize": "9875.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/o5.png",
    "name": "Nike Air Max Excee",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/o6.png",
    "name": "Revolution 5 Running Shoes",
    "prize": "2195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/o7.png",
    "name": "Men Running Shoes",
    "prize": "38395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.8,
  },
  {
    "image": "assets/o8.png",
    "name": "Nike men structure 25 shoes",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.7,
  },
  {
    "image": "assets/o9.png",
    "name": "Nike Gried ",
    "prize": "1395.00",
    "delivery": " 3.50",
    "product": 1,
    "rating": 4.4,
  },
  {
    "image": "assets/o10.png",
    "name": "Nike shoes",
    "prize": "7995.00",
    "delivery": " 3.50",
    "product": 1,
    "rating": 4.7,
  },
];
List<Map<String, dynamic>> tennieslist = [
  {
    "image": "assets/t1.png",
    "name": "Nike Butterfly shoes",
    "prize": "8595.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.2,
  },
  {
    "image": "assets/t2.png",
    "name": "Nike anaconda shoes",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.8,
  },
  {
    "image": "assets/t3.png",
    "name": "NIKE Nike Green Cobra",
    "prize": "8195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.5,
  },
  {
    "image": "assets/t4.png",
    "name": "Nike lofer shoes",
    "prize": "1795.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
  {
    "image": "assets/t5.png",
    "name": "Nike blue red Men Shoes",
    "prize": "1795.00",
    "delivery":"3.50",
    "product": 1,
    "rating": 4.9,
  },
  {
    "image": "assets/t6.png",
    "name": "Nike cream men's footwear",
    "prize": "7195.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.6,
  },
  {
    "image": "assets/t7.png",
    "name": "NIKE Grey footwear",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 3.8,
  },
  {
    "image": "assets/t8.png",
    "name": "Nike safari shoes",
    "prize": "1325.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.3,
  },
  {
    "image": "assets/t9.png",
    "name": "Nike red men's footwear",
    "prize": "1395.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.6,
  },
  {
    "image": "assets/t10.png",
    "name": "NIKE AIR flyers shoes",
    "prize": "7995.00",
    "delivery": "3.50",
    "product": 1,
    "rating": 4.5,
  },
];

List<Map<String, dynamic>> cartlist = [];
List<Map<String, dynamic>> favlist = [];

Profile profile = Profile();

class Profile {
  String? fname;
  String? lname;
  String? location;
  String? mnumber;
  XFile? filepath;
  int? totalcost;
  num? delivery;
  int? prize;
  int? product;
}