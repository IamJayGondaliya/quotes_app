import 'package:quotes_app/utils/fonts_enum.dart';

import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.dancingScript.name,
      ),
      routes: AppRoutes.routes,
    );
  }
}
