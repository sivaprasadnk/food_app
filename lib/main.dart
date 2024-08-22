import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/core/locator.dart';
import 'package:food_app/domain/use_cases/get_filters.dart';
import 'package:food_app/presentation/home/home_screen.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return FilterProvider(locator<GetFilters>());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          dividerColor: kTransparentColor,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: kTransparentColor,
            foregroundColor: kBlackColor,
          ),
          scaffoldBackgroundColor: kLightGreyColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
