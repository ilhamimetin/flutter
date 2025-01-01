import 'package:flutter/material.dart';
import 'package:listeler/screens/home_screen.dart';
import 'package:listeler/services/database_service.dart';
import 'package:provider/provider.dart';

void main() async {
  // Veritabanı işleminden dolayı kullanılan async yüzünden alttaki kod satırı uygulamanın ön hazırlık yapması için eklenmesi gerekmektedir.
  WidgetsFlutterBinding.ensureInitialized();
  // Database işlemlerini öncelikli olarak gerçekleştir. Database olduğundan dolayı bu fonksiyonumuzu yani main() fonksiyonumuzu async yapıyoruz.
  await DatabaseService.initialize();

  // Widgetları Çiz
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatabaseService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
