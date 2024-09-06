import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar'));

  void toEnglish() => emit(const Locale('en'));

  void toArabic() => emit(const Locale('ar'));
}
