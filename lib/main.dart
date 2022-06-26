import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Wrapper.dart';
import 'package:provider/provider.dart';
import 'Providers/cart_provider.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(
      MultiProvider(providers: [
        
        ChangeNotifierProvider(create: (_)=> CartProvider())

      ], child: MyApp()

      ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //
        // primarySwatch: Colors.white,
        //switchTheme: Colors.white
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Wrapper();
  }
}
