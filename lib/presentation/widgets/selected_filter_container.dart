import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
import 'package:provider/provider.dart';

class SelectedFilterContainer extends StatelessWidget {
  const SelectedFilterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Consumer<FilterProvider>(builder: (context, provider, _) {
      return SizedBox(
        width: width,
        height: 35,
        child: ListView.builder(
          itemCount: provider.selected.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = provider.selected[index];
            return GestureDetector(
              onTap: () {
                provider.removeFilter(item);
              },
              child: Container(
                height: 30,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'X ${item.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
