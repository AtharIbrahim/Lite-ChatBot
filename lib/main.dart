import 'package:flutter/material.dart';
import 'package:lite_chatbot/splashScreen.dart';
import 'Provider/Provider_File.dart';
import 'package:provider/provider.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderFile(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Splashscreen(),
      ),
    );
  }
}
