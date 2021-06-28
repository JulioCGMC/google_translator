import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final String apiKey = "YOUR_API_KEY";

  @override
  Widget build(BuildContext context) {
    return GoogleTranslatorInit(apiKey,
      translateFrom: Locale('pt-br'),
      translateTo: Locale('en'),
      cacheDuration: Duration(days: 13),
      // automaticDetection: , In case you don't know the user language
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Página inicial de demonstração do Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title ?? "").translate(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Original: Meu texto traduzido", 
              textAlign: TextAlign.center),
            Text("Meu texto traduzido", 
              textAlign: TextAlign.center).translate(),
            SizedBox(height: 20),
            Text("Original: Este texto mostra um placeholder diferente", 
              textAlign: TextAlign.center),
            Text("Este texto mostra um placeholder diferente", 
              textAlign: TextAlign.center).translate("Place to Holder")
          ]
        ),
      ),
    );
  }
}
