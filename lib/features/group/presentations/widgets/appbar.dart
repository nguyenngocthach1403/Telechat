import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:telechat/core/constants/nums.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.pressPop,
    required this.pressAction,
  });
  final Function() pressPop;
  final Function() pressAction;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(
        onPressed: widget.pressPop,
        icon: const Icon(Ionicons.arrow_back),
      ),
      title: const Text(
        "Chat",
        style: TextStyle(fontSize: fontSizeAppBar, fontWeight: FontWeight.w600),
      ),
      actions: [
        _buildAcctionButton(press: widget.pressAction),
      ],
    );
  }

  Widget _buildAcctionButton({required Function() press}) {
    return IconButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      icon: Image.asset(
        'assets/icons/edit 3.png',
        width: 20,
      ),
    );
  }
}
