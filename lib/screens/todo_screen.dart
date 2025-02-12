import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_tutorial/models/todo_model.dart';

import '../controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  final int? index;

  const TodoScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();
    TextEditingController textEditingController = TextEditingController();
    String editedTodoText = "";
    if (index != null) {
      editedTodoText = todoController.todos[index!].text;
      textEditingController.text = editedTodoText;
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Cancle",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (index != null) {
                      var changed = todoController.todos[index!];
                      changed.text = textEditingController.text;
                      todoController.todos[index!] = changed;
                      Get.back();
                    } else {
                      todoController.todos
                          .add(TodoModel(text: textEditingController.text));
                      textEditingController.text = "";
                      Get.back();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    index != null ? "Update" : "Add",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
