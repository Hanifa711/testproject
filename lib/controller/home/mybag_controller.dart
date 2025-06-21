import 'package:get/get.dart';

enum PaymentMethod { card, bkash, cod }

class MyBagController extends GetxController {
  List<Map<String, dynamic>> cartProducts = [];
  DateTime? selectedDate;
  int? selectedTimeIndex;
  final List<String> timeSlots = [
    '8 AM - 10 AM',
    '11 AM - 12 PM',
    '12 PM - 2 PM',
    '2 PM - 4 PM',
    '4 PM - 6 PM',
    '6 PM - 8 PM',
  ];

  // New: الدفع
  PaymentMethod paymentMethod = PaymentMethod.cod;

  int get subtotal => cartProducts.fold(
    0,
    (sum, prod) =>
        sum +
        (((prod['price'] ?? 0) as num) * ((prod['count'] ?? 1) as num)).toInt(),
  );
  int get deliveryCharge => 50;
  int get total => subtotal + deliveryCharge;

  void addProduct(Map<String, dynamic> product) {
    final name = product['name'] ?? product['product_name'] ?? '';
    final img = product['image'] ?? product['image_front_url'] ?? '';
    final quantity = product['quantity'] ?? product['weight'] ?? '';
    final price = product['price'] ?? 99;
    final oldPrice = product['oldPrice'] ?? price + 15;
    final count = 1;

    final idx = cartProducts.indexWhere((p) => p['name'] == name);
    if (idx != -1) {
      cartProducts[idx]['count'] += 1;
    } else {
      cartProducts.add({
        'name': name,
        'image': img,
        'quantity': quantity,
        'price': price,
        'oldPrice': oldPrice,
        'count': count,
      });
    }
    update();
  }

  void removeProduct(Map<String, dynamic> product) {
    final name = product['name'] ?? product['product_name'];
    cartProducts.removeWhere((p) => p['name'] == name);
    update();
  }

  void incrementProduct(Map<String, dynamic> product) {
    final name = product['name'] ?? product['product_name'];
    final idx = cartProducts.indexWhere((p) => p['name'] == name);
    if (idx != -1) {
      cartProducts[idx]['count'] += 1;
      update();
    }
  }

  void decrementProduct(Map<String, dynamic> product) {
    final name = product['name'] ?? product['product_name'];
    final idx = cartProducts.indexWhere((p) => p['name'] == name);
    if (idx != -1 && cartProducts[idx]['count'] > 1) {
      cartProducts[idx]['count'] -= 1;
      update();
    }
  }

  void setDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void setTime(int index) {
    selectedTimeIndex = index;
    update();
  }

  void setPaymentMethod(PaymentMethod method) {
    paymentMethod = method;
    update();
  }

  void clearBag() {
    cartProducts.clear();
    update();
  }
}
