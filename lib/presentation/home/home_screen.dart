import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
import 'package:food_app/presentation/widgets/filter_list.dart';
import 'package:food_app/presentation/widgets/selected_filter_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FilterProvider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
        leadingWidth: 35,
        title: const Text(
          'Filter Options',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 150,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: kBlackColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            " SHOW 0 RESULTS",
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            SelectedFilterContainer(),
            SizedBox(height: 20),
            FilterList(),
          ],
        ),
      ),
    );
  }
}
