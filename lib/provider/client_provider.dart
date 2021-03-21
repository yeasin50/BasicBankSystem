import 'package:bank_app_social/models/client.dart';
import 'package:bank_app_social/provider/db_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'dummy_data.dart';

class ClientProvider with ChangeNotifier {
  List<Client> _clients = [];
  late Client _currentUser;
  final ClientDatabse db = ClientDatabse.instance;
  late Future isInitCompleted;

  late Client _receiver;
  late double _amount;

  Client get receiver => _receiver;
  void setreceiver(Client receiver_) {
    _receiver = receiver_;
    print("receiver name: ${_receiver.name}");
    notifyListeners();
  }

  double get amount => _amount;
  void setamount(double m) {
    _amount = m;
    notifyListeners();
  }

  initDB() {
    if (kIsWeb) {
      isInitCompleted = _getDummy();
    } else
      isInitCompleted = _initDB();

    notifyListeners();
  }

  Future<void> _getDummy() async {
    _clients = await dummyData;
    setcurrentUser(0);
  }

  Future<void> _initDB() async {
    print("provider init sql");
    if (_clients.isEmpty) {
      for (int i = 0; i < dummyData.length; i++) {
        var result = await db.insert(ClientDatabse.tableName, dummyData[i]);
        print("result Of $i: $result");
      }
      _currentUser = dummyData[0];
    }
    await getClients();
  }

  getClients() async {
    // await _initDB();
    _clients = await db.getClients(ClientDatabse.tableName);
    if (_clients.isEmpty) {
      print("no data");
      // await _initDB();
    }
    // print("clients $clients");
    notifyListeners();
  }

  Client get currentUser => _currentUser;

  get clients => [..._clients];

  get totalClient => _clients.length;

  Future<void> setcurrentUser(int index) async {
    _currentUser = await _clients[index];
    print("currrent user: ${_currentUser.name}");
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

  Future<bool> transacte() async {
    if (_currentUser.balance < amount) return false;
    if (_currentUser.balance >= amount && kIsWeb) {
      _currentUser.balance -= amount;
      receiver.balance += amount;
      notifyListeners();
      return true;
    }
    return false;
  }

  ///make transactin over sql
  Future<int> transactionOverSQL() async {
    print(
        "sender ${currentUser.name}: ${currentUser.balance} receiver ${receiver.name}: ${receiver.balance} ");

    ///sender side
    var sC = currentUser;
    sC.balance -= amount;
    int result = await db.update(sC);

    //receiver side
    var rC = receiver;
    rC.balance += amount;
    if (result == 1) await db.update(rC);

    print(result.toString());

    return result;
  }
}
