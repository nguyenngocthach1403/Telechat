import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChatTextBox extends StatefulWidget {
  const ChatTextBox({super.key});

  @override
  State<ChatTextBox> createState() => _ChatTextBoxState();
}

class _ChatTextBoxState extends State<ChatTextBox> {
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints.loose(
            Size.infinite,
          ),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            // padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildButton(
                  context,
                  press: () {},
                  isvisible: !_focusNode.hasFocus,
                  icon: Ionicons.chevron_forward,
                ),

                //Expan
                _buildButton(
                  context,
                  press: () {},
                  isvisible: _focusNode.hasFocus,
                  icon: Ionicons.attach,
                ),

                //Camera
                _buildButton(
                  context,
                  press: () {},
                  isvisible: _focusNode.hasFocus,
                  icon: Ionicons.camera,
                ),

                //Textfield
                Flexible(
                  child: _buildTextField(),
                ),

                //Send button
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Ionicons.send_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return TextField(
      focusNode: _focusNode,
      onChanged: (value) {},
      minLines: 1,
      maxLines: null,
      decoration: const InputDecoration(
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 100,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Send Message',
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required Function() press,
    required bool isvisible,
    IconData? icon,
  }) {
    return isvisible
        ? const SizedBox()
        : IconButton(
            padding: EdgeInsets.zero,
            onPressed: press,
            icon: Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
  }
}
