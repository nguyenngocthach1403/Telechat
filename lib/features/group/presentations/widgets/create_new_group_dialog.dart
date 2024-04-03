import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/usecases/get_current_uid.dart';
import 'package:telechat/injection.container.dart';

class CreateNewGroupDialog extends StatefulWidget {
  const CreateNewGroupDialog({super.key, required this.createGroup});
  final Function(GroupEntity newGroup) createGroup;

  @override
  State<CreateNewGroupDialog> createState() => _CreateNewGroupDialogState();
}

class _CreateNewGroupDialogState extends State<CreateNewGroupDialog> {
  TextEditingController groupNameController = TextEditingController();
  FocusNode groupNameFocusNode = FocusNode();

  TextEditingController groupImageController = TextEditingController();
  FocusNode groupImageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGroupNameTextBox(context),
            //
            const SizedBox(
              height: 10,
            ),
            _buildGroupImageTextBox(context),
            //
            const SizedBox(
              height: 10,
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, press: () {
                  Navigator.of(context).pop();
                }, title: 'Exit', background: Colors.red),
                const SizedBox(
                  width: 10,
                ),
                _buildButton(context, press: () async {
                  String currentUid = await GetCurrentUID(sl()).call(Void);

                  List<String> members = [currentUid];
                  widget.createGroup(
                    GroupEntity(
                      groupName: groupNameController.text.trim(),
                      groupImage: groupImageController.text.trim(),
                      members: members,
                    ),
                  );

                  Navigator.of(context).pop();
                }, title: 'Create', background: Theme.of(context).primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGroupNameTextBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: groupNameFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: groupNameFocusNode,
        controller: groupNameController,
        decoration: const InputDecoration(
          label: Text('Group Name'),
          hintText: 'Fiel group name ...',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGroupImageTextBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: groupImageFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: groupImageFocusNode,
        controller: groupImageController,
        decoration: const InputDecoration(
          label: Text('Image'),
          hintText: 'Fiel link image ...',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required Function() press,
    required String title,
    Color background = Colors.black,
  }) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
