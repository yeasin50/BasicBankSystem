import 'package:bank_app_social/models/client.dart';
import 'package:flutter/cupertino.dart';

import 'dummy_data.dart';

class ClientProvider with ChangeNotifier {
  Client _currentUser = dummyData[dummyData.length - 1];

  List<Client> _clients = dummyData;

  Client get currentUser => _currentUser;

  get clients => _clients;

  get totalClient => _clients.length;

  set currentUser(Client user) {
    _currentUser = user;
    notifyListeners();
  }

  addClient(Client client) async {
    _clients.add(client);
    notifyListeners();
  }

  Client getReceiver(String name) {
    late Client r;
    _clients.forEach((element) {
      if (element.name == name) r = element;
    });
    return r;
  }

  String getImagePath(String name) {
    String path = '';
    _clients.forEach((element) {
      if (element.name == name) path = element.imagePath;
    });
    return path;
  }

  List<String> getClientNames() {
    List<String> names = [];
    _clients.forEach((element) {
      if (element.name != _currentUser.name) names.add(element.name);
    });
    // names.remove(_currentUser.name);
    return names;
  }

  /// `initialzied Dummy Data as Test`
  ///`Dummy data for Ui Test`
  Future<void> generateDummyData() async {
    ///dont need it now
  }

  bool transacte(Client receiver, double amount) {
    if (_currentUser.balance >= amount) {
      _currentUser.balance -= amount;
      receiver.balance += amount;
      notifyListeners();
      return true;
    }
    return false;
  }
}
