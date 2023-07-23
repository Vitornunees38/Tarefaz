class ToDo{
  String? id;
  String? text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', text: 'Academia', isDone: true),
      ToDo(id: '02', text: 'Estudar para prova', isDone: true),
      ToDo(id: '03', text: 'Verificar e-mails'),
      ToDo(id: '04', text: 'Beber 4L de água')
    ];
  }
}