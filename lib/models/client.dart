import 'package:bank_app_social/provider/db_manager.dart';

/// we can set `email` or `phone` as id
class Client {
  late final String name;
  final String email;
  final String phone;
  final String address;

// we cant use this way on constructor
// because constructor default value must be constans
  DateTime? accCreated = DateTime.now();

  double balance;
  String imagePath;
  Client(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      this.imagePath = "",
      this.balance = 0,
      this.accCreated});

  Map<String, dynamic> toMap() {
    return {
      ClientDatabse.keyName: name,
      ClientDatabse.keyPhone: phone,
      ClientDatabse.keyAddress: address,
      ClientDatabse.keyEmail: email,
      ClientDatabse.keyBalance: balance.toString(),
      ClientDatabse.keyImagePath: imagePath,
      ClientDatabse.ketAccCDate: accCreated!.toIso8601String()
    };
  }

  static Client fromMap(Map<String, dynamic> map) {
    var bl = double.tryParse(map[ClientDatabse.keyBalance]);
    return Client(
        name: map[ClientDatabse.keyName],
        email: map[ClientDatabse.keyEmail],
        phone: map[ClientDatabse.keyPhone],
        address: map[ClientDatabse.keyAddress],
        balance: bl!,
        imagePath: map[ClientDatabse.keyImagePath],
        accCreated: DateTime.parse(map[ClientDatabse.ketAccCDate]));
  }
}
