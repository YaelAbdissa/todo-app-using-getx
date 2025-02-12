import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_tutorial/controllers/todo_controller.dart';
import 'package:getx_flutter_tutorial/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Todo List"),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  todoController.todos[index].text,
                  style: todoController.todos[index].done
                      ? TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        )
                      : TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                ),
                onTap: () {
                  if (todoController.todos[index].done) return;
                  Get.to(
                    TodoScreen(
                      index: index,
                    ),
                  );
                },
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (value) {
                    var changed = todoController.todos[index];
                    changed.done = value!;
                    todoController.todos[index] = changed;
                  },
                ),
                trailing: todoController.todos[index].done
                    ? null
                    : Icon(Icons.chevron_right),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: todoController.todos.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
    );
  }
}
