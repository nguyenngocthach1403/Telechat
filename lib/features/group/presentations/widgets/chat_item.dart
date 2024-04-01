import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.press,
  });
  final Function() press;

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
                  const Text(
                    'Smith Mathew',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //nums of new messagge
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 15,
                    alignment: Alignment.center,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// time
            Text(
              '29 mar',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
        //recent Message
        Text(
          'Hi, David. Hope you\'re doing dad . . .',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
