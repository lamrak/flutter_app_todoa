void main() {
  print('Fetching order...');
  print(createOrderMessage());
}

String createOrderMessage() {
  var message = fetchUserOrder();
  return 'Your order is $message';
}

Future<String> fetchUserOrder() =>
    Future.delayed(Duration(seconds: 3), () => 'Large Latte');
