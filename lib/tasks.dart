void main() {
  performTasks();
}

void performTasks() async {
  print('Start');
  String result = await task1();
  task2(result);
  print('End');
}

Future<String> task1() async {
  Duration d3 = Duration(seconds: 3);

  String result = '';

  await Future.delayed(d3, () {
    result = 'Done';
    print('Task 1 completed');
  });

  return result;
}

void task2(String result) {
  print('Task 2 completed. Status t1: $result');
}
