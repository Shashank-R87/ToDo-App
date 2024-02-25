import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class todoItem extends StatelessWidget {
  final ToDo todo;
  final todoClicked;
  final deleteClicked;
  const todoItem(
      {Key? key,
      required this.todo,
      required this.todoClicked,
      required this.deleteClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        onTap: () {
          todoClicked(todo);
        },
        leading:
            Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteClicked(todo.id);
          },
        ),
      ),
    );
  }
}
