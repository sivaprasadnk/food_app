import 'package:flutter/material.dart';
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
        leading: const Icon(Icons.arrow_back_ios_rounded),
        title: const Text(
          'Filter Options',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
