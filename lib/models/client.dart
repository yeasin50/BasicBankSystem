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
}
