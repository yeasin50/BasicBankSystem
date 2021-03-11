import 'package:bank_app_social/models/client.dart';
import 'package:flutter/cupertino.dart';

class ClientProvider with ChangeNotifier {
  List<Client>? _clients = [];

  get clients => _clients;

  addClient(Client client) async {
    _clients!.add(client);
    notifyListeners();
  }

  get totalClient => _clients?.length;

  /// `initialzied Dummy Data as Test`
  ///`Dummy data for Ui Test`
  Future<void> generateDummyData() async {
    for (int i = 0; i < 10; i++) {
      Client c = Client(
        name: "yeasin $i",
        email: "yeasinSheikh5$i@gmail.com",
        phone: "+88017${i}5469898",
        address: "Manikganj Sadar, Dhaka $i",
        imagePath: "Image",
        balance: i * 100 + 30,
      );
      _clients?.add(c);
      notifyListeners();
    }
  }
}
