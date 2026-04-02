import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp(), debugShowCheckedModeBanner: false));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Atributos
  final TextEditingController _tarefaController =
      TextEditingController(); // Obj. para controlar os dados do input
  final List<Map<String, dynamic>> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas ||| Rian"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromRGBO(44, 41, 88, 1),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _tarefaController,
              decoration: InputDecoration(labelText: "Título da Tarefa"),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTarefa,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(44, 41, 88, 1),
              ),
              child: Text(
                "Criar Tarefa",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _tarefas[index]["titulo"],
                    style: TextStyle(
                      decoration: _tarefas[index]["concluida"]
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: _tarefas[index]["concluida"],
                    onChanged: (bool? valor) => setState(() {
                      _tarefas[index]["concluida"] = valor!;
                    }),
                  ),
                  trailing: IconButton(
                    onPressed: () => _excluirTarefa(index),
                    icon: Icon(Icons.delete),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTarefa() {
    if (_tarefaController.text.trim().isNotEmpty) {
      setState(() {
        _tarefas.add({
          "titulo": _tarefaController.text.trim(),
          "concluida": false,
        });
        _tarefaController.clear();
      });
    } else {
      Fluttertoast.showToast(
        msg: "Erro! Você não preencheu o campo da tarefa...",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 255, 88, 76),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _excluirTarefa(int index) {
    if (_tarefas[index]["concluida"] == true) {
      setState(() {
        _tarefas.remove(_tarefas[index]);
      });
    } else {
      Fluttertoast.showToast(
        msg: "Erro! Você não concluiu essa tarefa",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 255, 88, 76),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
