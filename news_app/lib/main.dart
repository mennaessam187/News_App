import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/screean/homelayout.dart';
import 'package:news_app/data/cubit/bloc_observe.dart';
import 'package:news_app/data/cubit/theme_cubit.dart';
import 'package:news_app/data/services/api_services.dart';
import 'package:news_app/utils/global/theme/theme_data/theme_data_dark.dart';
import 'package:news_app/utils/global/theme/theme_data/theme_data_light.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  apiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
