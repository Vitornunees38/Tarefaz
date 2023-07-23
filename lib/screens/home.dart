import 'package:flutter/material.dart';
import 'package:tarefaz/constants/colors.dart';
import 'package:tarefaz/widgets/todo_item.dart';

import '../models/todo.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  
  final todosList = ToDo.todoList();
  List<ToDo> doneToDo = [];
  List<ToDo> pendentToDo = [];
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                searchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20, left: 15),
                        child: Text("Tarefaz", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: txtBox),),
                      ),
                      for(ToDo currTodo in _foundToDo.reversed)
                        ToDoItem(todo: currTodo, onToDoChanged: _toggleToDoStatus, onToDoDelete: _deleteToDo,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: txtBox,
                    boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0.0, 0.0), blurRadius: 10, spreadRadius: 0)],
                    borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                    hintText: "Add a new todo item"
                  ),
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                child: Text('+', style: TextStyle(fontSize: 40),),
                onPressed: () {
                  _addToDo(_todoController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: txtBox,
                  foregroundColor: bgColor,
                  minimumSize: Size(60.0, 60.0),
                  elevation: 10
                ),
              ),
            )
          ]
        ),
        )
        
        ],
      ),
    );
  }

  void _toggleToDoStatus(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  
  void _deleteToDo(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), text: toDo));
    });
    _todoController.clear();
  }

  void _filterSearch(String searchText){
    List<ToDo> results = [];
    if(searchText.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((item) => item.text!.toLowerCase().contains(searchText.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: txtBox,
          size: 30,
        ),
        Container(
          width: 35,
          height: 35,
          child: Image.network(
              'https://www.digitary.net/wp-content/uploads/2021/07/Generic-Profile-Image-300x300.png'),
        )
      ]),
    );
  }

Widget searchBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration:
        BoxDecoration(color: txtBox, borderRadius: BorderRadius.circular(20)),
    child: TextField(
      onChanged: (value) => _filterSearch(value),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(
            Icons.search,
            color: bgColor,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 25, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey)),
    ),
  );
}
}
