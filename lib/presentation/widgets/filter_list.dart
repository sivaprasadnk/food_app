import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
import 'package:food_app/presentation/widgets/custom_radio_button.dart';
import 'package:provider/provider.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context, provider, _) {
      if (provider.isLoading) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (provider.filterList.isEmpty) {
        if (provider.error.isNotEmpty) {
          return Text(provider.error);
        }
        return const SizedBox.shrink();
      }
      return Expanded(
        child: ListView.builder(
          itemCount: provider.filterList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            var item = provider.filterList[index];
            var count = provider.selectedCount(item.slug!);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ExpansionTile(
                  backgroundColor: kWhiteColor,
                  expandedAlignment: Alignment.centerLeft,
                  collapsedBackgroundColor: kWhiteColor,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),

                      /// checking if id not null, ie, for multi-select
                      if (item.taxonomyList!.first.id != 0)

                        /// display count only if count > 0
                        if (count > 0)
                          Text(
                            ' ($count)',
                            style: const TextStyle(
                              color: kPurpleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                    ],
                  ),
                  initiallyExpanded: false,
                  dense: true,
                  children: item.taxonomyList!.map((e) {
                    return InkWell(
                      onTap: () {
                        /// checking if multi-select
                        if (e.id != 0) {
                          /// checking if already selected, then remove, else add
                          if (provider.selected.contains(e)) {
                            provider.removeFilter(e);
                          } else {
                            provider.addMutliSelect(e);
                          }
                        } else {
                          provider.addSingleSelect(e);
                        }
                      },
                      child: CustomRadioButton(
                        selected: provider.selected,
                        item: e,
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
