import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart'; //Todas las pantallas se importan desde el archivo de barril

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => SnackbarScreen(),
    ),
  ],
);