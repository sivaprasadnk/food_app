import 'package:flutter/material.dart';
import 'package:food_app/core/constant_colors.dart';
import 'package:food_app/domain/entity/taxonomy.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.selected,
    required this.item,
  });

  final List<Taxonomy> selected;
  final Taxonomy item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (!selected.contains(item))
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kBlackColor),
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
                  border: Border.all(color: kPurpleColor),
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
            Text(item.name!),
          ],
        ),
      ),
    );
  }
}
