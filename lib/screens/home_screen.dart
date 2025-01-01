import 'package:flutter/material.dart';
import 'package:listeler/models/todo_model.dart';
import 'package:listeler/services/database_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
//   final _databaseService = DatabaseService(); // Artık buna ihtiyaç yok. Çünkü aşağıdaki "final _databaseService =context.watch<DatabaseService>();" kod satırı ile bunu değişiklikleri anınnda izleyerek değişkene atayıp o değişken üzerinden işlemlerimizi gerçekleştirdik.
  final _textFieldController = TextEditingController();

    void _fetchTodos() {
    context.read<DatabaseService>().fetchTodos();
  }
  

  @override
  void initState() {
    _fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görev Uygulaması"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Column(
          children: [
            _addTodoWidget(context),
            _todoListWidget(),
          ],
        ),
      ),
    );
  }

  Expanded _todoListWidget() {
    final _databaseService =context.watch<DatabaseService>();
    return Expanded(
      child: Consumer<DatabaseService>(builder: (context, databaseService, child) => ListView.separated(
        itemCount: databaseService.currentTodos.length,
        itemBuilder: (context, index) {
          final Todo todo = _databaseService.currentTodos[index];
          return ListTile(
            title: Text(
              todo.text,
              style: TextStyle(
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(todo.datetime.toString()),
            tileColor: Colors.grey.shade100,
            trailing: Checkbox(
              value: todo.isDone,
              onChanged: (isDone) {
                todo.isDone = isDone!;
                databaseService.updateTodo(todo);
              },
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 0,
          color: Colors.blueGrey.shade100,
        ),
      ),)
    );
  }

  Container _addTodoWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(
          suffixIcon:
              IconButton(onPressed: (){
                context.read<DatabaseService>().addTodo(_textFieldController.text);
              }, icon: const Icon(Icons.add)),
          border: const OutlineInputBorder(),
          isDense: true,
          hintText: "Birşeyler yazın.",
        ),
      ),
    );
  }
}