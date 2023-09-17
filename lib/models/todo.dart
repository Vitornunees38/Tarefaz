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
      ToDo(id: '01', text: 'Academia'),
      ToDo(id: '02', text: 'Estudar para a prova de Cálculo'),
      ToDo(id: '03', text: 'Verificar e-mails', isDone: true),
      ToDo(id: '04', text: 'Regar as plantas')
    ];
  }
}