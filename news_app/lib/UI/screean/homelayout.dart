import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/cubit/cubit.dart';
import 'package:news_app/data/cubit/states.dart';
import 'package:news_app/data/cubit/theme_cubit.dart';
import 'package:news_app/data/services/api_services.dart';
import 'package:news_app/utils/app_const.dart';
import 'package:news_app/utils/color_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //apiServices getData=apiServices();
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getGeneralNews()
        ..getSportsNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      icon: Icon(Icons.brightness_2))
                ],
              ),
              backgroundColor: Color(colorManager.ScaffoldColor),
              /*
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  apiServices.getData(Url: AppConstant.topHeadline, query: {
                    "apiKey": AppConstant.apiKey,
                    "country": "eg",
                    "category": "general",
                  }).then((value) {
                    debugPrint(value.data["articles"][0]["title"]);
                  }).catchError((error) {
                    debugPrint(error.toString());
                  });
                },
                child: Icon(Icons.add),
                backgroundColor:
                    Color(colorManager.bottomnavbarbackgroundcolor),
              ),
              */
              bottomNavigationBar: BottomNavigationBar(
                /* selectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                    const Color(colorManager.bottomnavbarbackgroundcolor),
                    */
                items: cubit.buttomitems,
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  cubit.ChangeBottomNavigationBar(index);
                },
              ),
              body: cubit.screens[cubit.currentindex],
            );
          }),
    );
  }
}
