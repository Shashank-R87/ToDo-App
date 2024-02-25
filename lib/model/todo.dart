class ToDo {
  String? id;
  String? todoText;
  bool isDone = false;

  ToDo({this.id, this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Team Meeting',
      ),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', isDone: true),
      ToDo(
        id: '06',
        todoText: 'Dinner with Jenny',
      ),
    ];
  }
}