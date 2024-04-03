import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.press,
    required this.group,
  });
  final Function() press;
  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding:
            const EdgeInsets.only(left: 25, right: 10, top: 10, bottom: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            _buildAvatar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 5,
                  bottom: 5,
                  right: 5,
                ),
                child: _buildBody(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: group.groupImage.isNotEmpty
              ? NetworkImage(group.groupImage)
              : const NetworkImage(
                  'https://www.freeiconspng.com/uploads/no-image-icon-11.PNG'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  //Name
                  Text(
                    group.groupName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //nums of new messagge
                  group.newMessageNumber > 0
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 15,
                          alignment: Alignment.center,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            group.newMessageNumber.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),

            /// time
            Text(
              group.recentTime,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
        //recent Message
        Text(
          group.recentMessage.length > 32
              ? '${group.recentMessage.substring(0, 32)} . . .'
              : group.recentMessage,
          style: TextStyle(
            fontSize: 16,
            fontWeight: group.newMessageNumber > 0
                ? FontWeight.w600
                : FontWeight.normal,
            color: group.newMessageNumber > 0
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
