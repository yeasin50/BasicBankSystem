import 'package:bank_app_social/models/client.dart';
import 'package:flutter/cupertino.dart';

class ClientProvider with ChangeNotifier {
  late Client _currentUser;

  List<Client>? _clients = [];

  get clients => _clients;

  get totalClient => _clients?.length;

  set currentUser(Client user) {
    _currentUser = user;
    notifyListeners();
  }

  addClient(Client client) async {
    _clients!.add(client);
    notifyListeners();
  }

  Future<List<String>> getClientNames() async {
    List<String> names = [];
    _clients!.forEach((element) {
      names.add(element.name);
    });
    return names;
  }

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

  Future<bool> transacte(Client receiver, double amount) async {
    if (_currentUser.balance >= amount) {
      _currentUser.balance -= amount;
      receiver.balance += amount;
      notifyListeners();
      return true;
    }
    return false;
  }
}
