import 'package:flutter/material.dart';
import 'package:peluqueria/screens/screens.dart';
import 'package:peluqueria/services/auth_services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peluquería',
      initialRoute:
          'home', // Tiene que ser login. Para pruebas cambiar por home
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'gestion_horario': (_) =>
            GestionHorarioScreen(), // Calendario y Horario de Apertura
        'gestion_peluqueros': (_) => GestionPeluquerosScreen(),
        'reservas': (_) => ReservasScreen(),
        'consulta_horarios': (_) => ConsultaHorariosScreen(),
      },
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.lightMode, // TODO: Implementar tema oscuro
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MyApp(),
    );
  }
}
