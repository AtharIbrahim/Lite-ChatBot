import 'package:flutter/material.dart';
import 'Provider/Provider_File.dart';
import 'homeScreen.dart';
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
        home: homeScreen(),
      ),
    );
  }
}
