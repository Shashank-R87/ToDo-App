import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widget/todoItem.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late TextEditingController _controller;
  final todoList = ToDo.todoList();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appbar(),
        body: _body(),
      ),
    );
  }

  ListView _body() {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: _controller,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: "Add a new task",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    icon: Container(
                      child: Icon(Icons.add),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      _addToDo();
                    },
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "All ToDos",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for (ToDo i in todoList.reversed)
            todoItem(
              todo: i,
              todoClicked: _handleToDoChange,
              deleteClicked: _deleteToDo,
            ),
        ]);
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDo(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDo() {
    setState(() {
      var id = DateTime.now().microsecondsSinceEpoch.toString();
      todoList.add(ToDo(id: id, todoText: _controller.text));
      _controller.clear();
    });
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.black12,
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.supervised_user_circle,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    );
  }
}
