import 'package:flutter/material.dart';
import 'package:simple_isolate/constants/routes.dart';
import 'package:simple_isolate/pages/details_page.dart';
import 'package:simple_isolate/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.movieDetails: (context) => const DetailsPage(),
        },
      );
}
