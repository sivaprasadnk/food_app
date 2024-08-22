import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/presentation/provider/filter_provider.dart';
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
    var width = MediaQuery.of(context).size.width;
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
            Consumer<FilterProvider>(builder: (context, provider, _) {
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
            }),
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

                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = provider.filterList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ExpansionTile(
                          backgroundColor: kWhiteColor,
                          expandedAlignment: Alignment.centerLeft,
                          collapsedBackgroundColor: kWhiteColor,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Text(item.name!),
                          initiallyExpanded: false,
                          dense: false,
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
                                // child: Row(
                                //   children: [],
                                // ),
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
                                  // child: RadioListTile(
                                  //   value: e.id!,
                                  //   contentPadding: EdgeInsets.zero,
                                  //   dense: false,
                                  //   groupValue: e.guid,
                                  //   onChanged: (value) {
                                  //     provider.addFilters(e);
                                  //   },
                                  //   title: Text(e.name!),
                                  // ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                    //   child: ExpandablePanel(
                    //     builder: (context, collapsed, expanded) {
                    //       return Expandable(
                    //         collapsed: collapsed,
                    //         expanded: expanded,
                    //       );
                    //     },
                    //     header: Container(
                    //       // margin: const EdgeInsets.only(bottom: 10),
                    //       color: kWhiteColor,
                    //       child: Text(item.name!),
                    //     ),

                    //     collapsed: Container(
                    //       color: kWhiteColor,
                    //     ),
                    //     expanded: Container(
                    //       color: kWhiteColor,
                    //       child: Text(item.taxonomyList!.first.name!),
                    //     ),
                    //     // collapsed: Text(i, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    //     // expanded: Text(article.body, softWrap: true, ),
                    //     // tapHeaderToExpand: true,
                    //     // hasIcon: true,
                    //   ),
                    // );
                    // return Container(
                    //   height: 60,
                    //   margin: const EdgeInsets.only(bottom: 8),
                    //   padding: const EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     color: kWhiteColor,
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Text(
                    //     item.name!,
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    // );
                    // return TapToExpand(

                    //   outerClosedPadding: 8,
                    //   titlePadding: EdgeInsets.zero,
                    //   backgroundcolor: kWhiteColor,
                    //   content: Text(item.taxonomyList!.first.name!),
                    //   // content: Column(
                    //   //   children: <Widget>[
                    //   //     for (var i = 0; i < 20; i++)
                    //   //       Text(
                    //   //         "data $i",
                    //   //         style: const TextStyle(
                    //   //             color: Colors.white, fontSize: 20),
                    //   //       ),
                    //   //   ],
                    //   // ),
                    //   title: Text(
                    //     item.name!,
                    //     style: const TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    //   // onTapPadding: 10,
                    //   closedHeight: 70,
                    //   // scrollable: true,
                    //   // borderRadius: 10,
                    //   openedHeight: 200,
                    // );
                  },
                ),
                // child: ExpandedTileList.builder(
                //   itemCount: provider.filterList.length,
                //   shrinkWrap: true,
                //   padding: const EdgeInsets.only(bottom: 10),
                //   itemBuilder: (context, index, controller) {
                //     var item = provider.filterList[index];

                //     return ExpandedTile(
                //       title: Padding(
                //         padding: const EdgeInsets.only(bottom: 10),
                //         child: Text(item.name!),
                //       ),
                //       content: Text(item.taxonomyList!.first.name!),
                //       controller: controller,
                //     );
                //   },
                // ),
                // child: TapToExpand(
                //   content: Column(
                //     children: <Widget>[
                //       for (var i = 0; i < 20; i++)
                //         Text(
                //           "data $i",
                //           style: const TextStyle(
                //               color: Colors.white, fontSize: 20),
                //         ),
                //     ],
                //   ),
                //   title: const Text(
                //     'TapToExpand',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   ),
                //   // onTapPadding: 10,
                //   closedHeight: 70,
                //   // scrollable: true,
                //   // borderRadius: 10,
                //   openedHeight: 200,
                // ),
              );
            })
          ],
        ),
      ),
    );
  }
}
