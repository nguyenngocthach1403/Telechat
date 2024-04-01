import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: Colors.black,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Ionicons.arrow_back),
      ),
      title: _buildTitle(),
      actions: [
        _buildCallButton(callPress: () {}),
        _buildVideoCallButton(videoCallPress: () {}),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: AssetImage('assets/images/h2.png'),
            ),
          ),
        ),
        //Name & status
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  //Status
                  Text(
                    'Active Now',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  //Active
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCallButton({required Function() callPress}) {
    return IconButton(
      onPressed: callPress,
      icon: const Icon(Ionicons.call_outline),
    );
  }

  Widget _buildVideoCallButton({required Function() videoCallPress}) {
    return IconButton(
      onPressed: videoCallPress,
      icon: const Icon(Ionicons.videocam_outline),
    );
  }
}
