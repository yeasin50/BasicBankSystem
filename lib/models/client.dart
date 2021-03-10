/// we can set `email` or `phone` as id
class Client {
  final String name;
  final String email;
  final String phone;
  final String address;

  DateTime accCreated = DateTime.now();
  double balance = 0.0;
  final String imagePath;
  
  Client({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.imagePath,
  });
}
