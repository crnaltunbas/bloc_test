import 'package:bloc_test/text_bloc.dart';
import 'package:bloc_test/text_event.dart';
import 'package:bloc_test/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => TextBloc(),
      child: const HomePage(),
    ));
  }
}

class HomePage extends StatefulWidget {
    const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  void showDiolog(BuildContext context, String message){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Uyarı'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop(); // AlertDialog'u kapatmak için
              },
            ),
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                // Tamam butonuna tıklanınca yapılacak işlemler
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {
        if (state == OverCharState()){
          showDiolog(context, '6 karakterden fazla giremezsiniz');

        }else if (state == WriteNumState()){
          showDiolog(context, 'Sayı giremezsiniz');
        }else if ( state == EmptyState()){
          showDiolog(context, 'Boşluk kullanamazsınız');
        }else {
          showDiolog(context, 'renk değiştir ');
        }

        return Scaffold(
          body: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: textEditingController,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TextBloc>().add(EnterTextEvent(textEditingController.text));
                },
                child: const Text("Kaydet"),
              )
            ],
          ),
        );
      },
    );
  }
}

