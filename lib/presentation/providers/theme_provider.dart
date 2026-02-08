import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Colores inmutable
final colorListProvider = Provider(
  (ref) => colorList,
); //Provider es para valores inmutables

final isDarkModeProvider = StateProvider<bool>(
  (ref) => false,
); //State es para mantener un estado

final selectedColorProvider = StateProvider<int>((ref) => 0);

//Objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
); //StateNotifier es para cuando el estado es más complejo

//Clase para mantener un estado (el tema de la app)
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
