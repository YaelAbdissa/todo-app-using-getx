import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read('todos');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => TodoModel.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      print('Todos changed');
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
