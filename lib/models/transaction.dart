
///THis class will be used for money transfer info
class Transaction {
  final DateTime dateTime;
  final String receiverName;
  final String receiverID;
  final String senderID;
  final String senderName;
  final double amount;

  Transaction({
    required this.dateTime,
    required this.receiverName,
    required this.receiverID,
    required this.senderID,
    required this.senderName,
    required this.amount,
  });
}
