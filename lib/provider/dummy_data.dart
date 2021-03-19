//12-13 (2047)
import 'package:bank_app_social/models/client.dart';

const String baseImgPath = "assets/images/";
const String fakeMail = "fake@gmail.com";

///later date format 
///formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));
List<Client> dummyData = [
  Client(
    name: "Emma",
    email: "emma.demo@gmail.com",
    phone: "+80-1234-5xx8",
    address: "Promise Neverland",
    imagePath: baseImgPath + "emma.png",
    balance: 63194,
    accCreated: DateTime(2047, 12, 13),
  ),
  //July 14 2014
  Client(
    name: "Elezebeth",
    email: "eleza.fake@gmail.com",
    phone: "+1231x20923",
    address: "Promise Neverland",
    balance: 9830,
    accCreated: DateTime(2014, 7, 14),
    imagePath: baseImgPath + "elezabeth.jpg",
  ),

  Client(
    name: "Jerry",
    email: "jerry.fake@mail.com",
    phone: "0908--9897",
    address: "Domestic Box Office",
    accCreated: DateTime(1954, 2, 2),
    balance: 28150000,
    imagePath: baseImgPath + "jerry.jpg",
  ),
  Client(
    name: "Tom",
    email: "tom",
    phone: "12312",
    address: "International Box Office",
    accCreated: DateTime(1946, 2, 2),
    balance: 38740000,
    imagePath: baseImgPath + "tom.png",
  ),
  Client(
    name: "Kochou Shinobu",
    email: "kochou" + fakeMail,
    phone: "12312312xx",
    address: "butterfly",
    accCreated: DateTime(2002, 1, 1),
    balance: 2323,
    imagePath: baseImgPath + "kochoushinobu.jpg",
  ),
  Client(
    name: "Light Yagami",
    email: "light" + fakeMail,
    phone: "8800x23123",
    address: "Death Note",
    balance: 1220,
    accCreated: DateTime(1986, 2, 28),
    imagePath: baseImgPath + "lightYagami.jpg",
  ),
  Client(
    name: "Meena",
    email: "mena" + fakeMail,
    phone: "+8801x6233",
    address: "UNICEF, Hanna-Barbera",
    accCreated: DateTime(1990, 1, 1),
    balance: 120,
    imagePath: baseImgPath + "mena.jpg",
  ),
  Client(
    name: "Mikasa",
    email: "mikasa" + fakeMail,
    phone: "88012323x2",
    address: "Attack on Titan",
    accCreated: DateTime(2002, 1, 1),
    balance: 200,
    imagePath: baseImgPath + "mikasa.jpg",
  ),
  Client(
    name: "Minion",
    email: "mini" + fakeMail,
    phone: "02328x7",
    address: "Minion",
    accCreated: DateTime(2010, 1, 1),
    balance: 0,
    imagePath: baseImgPath + "minion.jpg",
  ),
  Client(
    name: "Nishimiya Yuzuru",
    email: "nishima" + fakeMail,
    phone: "123x6123",
    address: "Silent Voice",
    balance: 120,
    accCreated: DateTime(1996, 1, 1),
    imagePath: baseImgPath + "nishimiya.jpg",
  ),
  Client(
    name: "Shoya Ishida",
    email: "shoya" + fakeMail,
    phone: "99x192332223",
    address: "Silent Voice",
    balance: 9978,
    accCreated: DateTime(2002, 6, 6),
    imagePath: baseImgPath + "shoya_Ishida.jpg",
  ),

  Client(
    name: "Shukana",
    email: 'sukana' + fakeMail,
    phone: "12312x2321",
    address: "Jujutsu Kaisen",
    balance: 9999999,
    accCreated: DateTime(0, 1, 0),
    imagePath: baseImgPath + "sukuna.jpg",
  ),

  Client(
      name: "Yeasin",
      email: "yeasin50@gmail.com",
      phone: "+8801715469898",
      address: "Manikganj, Dhaka",
      balance: 52,
      accCreated: DateTime(1999, 10, 1),
      imagePath: baseImgPath + "yeasin.jpg"),
];
