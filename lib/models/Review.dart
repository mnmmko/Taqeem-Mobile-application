import 'package:intl/intl.dart';

class Review {
  final name;
  final date;
  final review;
  double rate;

  Review({
    this.name,
    this.date,
    this.review,
    required this.rate,
  });
}