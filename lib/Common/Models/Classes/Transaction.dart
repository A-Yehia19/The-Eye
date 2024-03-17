class Transaction{
  final String id;
  final String creatorId;
  final DateTime timestamp;
  final double amount;
  final String cardNumber;

  Transaction({
    required this.id,
    required this.creatorId,
    required this.timestamp,
    required this.amount,
    required this.cardNumber
  });
}
