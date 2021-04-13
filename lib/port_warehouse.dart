void main() {
  performTasks();
}

void performTasks() {
  ship1();
  ship2();
  ship3();
}

void ship1() {
  print('Ship 1 docked');
  print('Start uploading good from Ship 1');
  var goods = unloadingGoods('Ship 1');
  print('Uploading from Ship 1 is completed. Status: $goods');
}

void ship2() {
  print('Ship 2 docked');
  print('Start uploading good from Ship 2');
  var goods = unloadingGoods('Ship 2');
  print('Uploading from Ship 1 is completed. Status: $goods');
}

void ship3() {
  print('Ship 3 docked');
  print('Start uploading good from Ship 3');
  var goods = unloadingGoods('Ship 3');
  print('Uploading from Ship 1 is completed. Status: $goods');
}

String unloadingGoods(String source) {
  String result = 'unknown';

  Future.delayed(Duration(seconds: 3), () => 'Done');

  return result;
}
