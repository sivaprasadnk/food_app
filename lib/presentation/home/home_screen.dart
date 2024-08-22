import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
import 'package:food_app/presentation/widgets/selected_filter_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late ExpandedTileController _controller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FilterProvider>(context, listen: false).getData();
      // _controller = ExpandedTileController(isExpanded: true);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const SelectedFilterContainer(),
            const SizedBox(height: 20),
            Consumer<FilterProvider>(builder: (context, provider, _) {
              if (provider.filterList.isEmpty) {
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
                          // controlAffinity: ListTileControlAffinity.platform,
                          children: item.taxonomyList!.map((e) {
                            return InkWell(
                              onTap: () {
                                debugPrint(' @@@@');
                                if (provider.selected.contains(e)) {
                                  provider.removeFilter(e);
                                } else {
                                  provider.addFilters(e);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (!provider.selected.contains(e))
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: kBlackColor),
                                          ),
                                        )
                                      else
                                        Container(
                                          height: 15,
                                          width: 15,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kWhiteColor,
                                            border:
                                                Border.all(color: kPurpleColor),
                                          ),
                                          child: Container(
                                            height: 5,
                                            width: 5,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kPurpleColor,
                                            ),
                                          ),
                                        ),
                                      const SizedBox(width: 10),
                                      Text(e.name!),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

