import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Função para identificar mudança de estado e reconstruir a janela do app
  @override // Reescrevendo função pré-pronta
  State<MyApp> createState() => _MyAppState();
}

// Construção da lógica e estrutura da janela
class _MyAppState extends State<MyApp> {
  // Atributoss
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nº de Click: $contador",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 22, 22, 22),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contador++;
                  });
                },
                child: Text("Aumentar Contador!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
