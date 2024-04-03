import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({super.key, required this.addNewGroup});
  final Function() addNewGroup;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addNewGroup,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 58,
        height: 58,
        padding: const EdgeInsets.all(2),
        child: DottedBorder(
          strokeWidth: 1,
          borderPadding: const EdgeInsets.all(2),
          borderType: BorderType.Circle,
          dashPattern: const [4, 4],
          color: Theme.of(context).colorScheme.secondary,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Ionicons.add,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
