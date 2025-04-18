import 'package:intl/intl.dart';

String formatPrice(int price) {
  final format = NumberFormat('#,###');
  return '${format.format(price)} 원';
}
