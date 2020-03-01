import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(Home());

class Task {
  int id;
  String description;
  bool done;

  Task(this.id, this.description, this.done);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        done = json['done'];

  Map<String, dynamic> toJson() =>
      {"id": id, "description": description, "done": done};
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController fieldNewTaskController = TextEditingController();

  final List<Task> _tasksList = [];

  @override
  void initState() {
    super.initState();

    _readTasks().then((jsonTasks) {
      final List<dynamic> taskList = json.decode(jsonTasks);

      setState(() {
        taskList.forEach((task) {
          _tasksList.add(Task.fromJson(task));
        });
      });
    });
  }

  void _addTask() {
    final String taskDescription = fieldNewTaskController.text;

    if (taskDescription.isEmpty) return;

    setState(() {
      final int newId = _tasksList.length;

      _tasksList.add(Task(newId, taskDescription, false));
      fieldNewTaskController.text = "";

      _saveTasks();
    });
  }

  void _checkTask(Task task, bool checked) {
    setState(() {
      task.done = checked;

      _saveTasks();
    });
  }

  Future<void> _sortTasks() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _tasksList.sort((a, b) {
        if (a.done && !b.done)
          return 1;
        else if (!a.done && b.done)
          return -1;
        else
          return 0;
      });

      _saveTasks();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de tarefas"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 15, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: fieldNewTaskController,
                    decoration: InputDecoration(
                        labelText: "Nova tarefa", border: OutlineInputBorder()),
                  )),
                  IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: Colors.teal,
                        size: 36,
                      ),
                      onPressed: _addTask),
                ],
              ),
            ),
            Expanded(
                child: RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: buildListTaskItem,
                      itemCount: _tasksList.length,
                    ),
                    onRefresh: _sortTasks))
          ],
        ),
      ),
    );
  }

  Widget buildListTaskItem(context, index) {
    Task task = _tasksList[index];

    return Dismissible(
      key: Key(task.id.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.95, 0),
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
      ),
      child: CheckboxListTile(
        secondary: CircleAvatar(
          child: Icon(task.done ? Icons.check : Icons.sim_card_alert),
        ),
        title: Text(
          task.description,
          style: TextStyle(
              decoration:
                  task.done ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        value: task.done,
        onChanged: (bool newValue) {
          _checkTask(task, newValue);
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _tasksList.removeAt(index);
          _saveTasks();

          final SnackBar undoSnackBar = SnackBar(
            content: Text("${task.description} excluído(a)"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _tasksList.add(task);
                  _saveTasks();
                });
              },
            ),
            duration: Duration(seconds: 3),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(undoSnackBar);
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/tasks.json");
  }

  Future<File> _saveTasks() async {
    List<Map<String, dynamic>> jsonTasks = [];

    _tasksList.forEach((task) {
      jsonTasks.add(task.toJson());
    });

    String data = json.encode(jsonTasks);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readTasks() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
