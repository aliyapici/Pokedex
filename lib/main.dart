import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/widgets/app_title.dart';
import 'package:pokemon/widgets/pokemon_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (context, screenUtil) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(
              textTheme: GoogleFonts.latoTextTheme(),
            ),
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            const Expanded(child: PokemonList()),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {}, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }
}
