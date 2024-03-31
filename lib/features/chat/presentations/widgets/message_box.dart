import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:telechat/features/chat/presentations/widgets/chat_body.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.message});
  final MessageEntityDemo message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        //avatar
        message.isMe
            ? const SizedBox()
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/h2.png'),
                  ),
                ),
              ),
        //Message
        Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: MediaQuery.of(context).size.width / 1.7,
              ),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: message.isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(20),
                      bottomLeft: message.isMe
                          ? const Radius.circular(20)
                          : const Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message,
                        style: const TextStyle(fontSize: 16),
                      ),

                      // Datetime & Status
                      _buildTimeAndStatus(context),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeAndStatus(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //status
        message.isMe
            ? Text(
                message.dateTime,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary),
              )
            : const SizedBox(),
        //date sent
        message.isMe
            ? Icon(
                Ionicons.checkmark,
                size: 14,
                color: Theme.of(context).primaryColor,
              )
            : Text(
                message.dateTime,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary),
              )
      ],
    );
  }
}

class VoiceMessage extends StatelessWidget {
  const VoiceMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: AssetImage('assets/images/h2.png'),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 50,
                    maxHeight: MediaQuery.of(context).size.width / 1.9),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 5,
                    bottom: 5,
                    right: 15,
                  ),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildPlayAndPause(),

                      //
                      _buildBody(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlayAndPause() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(
        Ionicons.pause,
        size: 20,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width / 1.9,
      height: 3,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}

class VoiceMessageByMe extends StatelessWidget {
  const VoiceMessageByMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: 50, maxHeight: MediaQuery.of(context).size.width / 1.9),
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5,
              right: 5,
            ),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                //
                _buildBody(context),

                _buildPlayAndPause(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlayAndPause() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(
        Ionicons.pause,
        size: 20,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width / 1.9,
      height: 3,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
