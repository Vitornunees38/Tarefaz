import 'package:flutter/material.dart';
import 'package:tarefaz/constants/colors.dart';
import 'package:tarefaz/models/todo.dart';

class ToDoItem extends StatelessWidget{
  
  final ToDo todo;
  final onToDoChanged;
  final onToDoDelete;

  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onToDoDelete}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: txtBox,
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank, color: checkColor,),
        title: Text(todo.text!, style: TextStyle(fontSize: 16, color: Colors.black, decoration: todo.isDone? TextDecoration.lineThrough : null),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onToDoDelete(todo.id);
            },
          ),
        )
      ),
    );
  }
}