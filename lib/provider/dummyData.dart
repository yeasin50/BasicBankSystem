import 'package:bank_app_social/models/client.dart';

///`Dummy data for Ui Test`
get getdummyData {
  List<Client> list = [];

  for (int i = 0; i < 10; i++) {
    Client c = Client(
      name: "yeasin $i",
      email: "yeasinSheikh5$i@gmail.com",
      phone: "+88017${i}5469898",
      address: "Manikganj Sadar, Dhaka $i",
      imagePath: "Image",
      balance: i * 100 + 30,
    );
    list.add(c);
  }
  return list;
}
