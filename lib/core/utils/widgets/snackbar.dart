import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void showSnackBarr(BuildContext context,
    {String title = '', String content = '', required Color color}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: _snackBarCustom(context,
            title: title, color: color, content: content)));
}

Widget _snackBarCustom(BuildContext context,
    {String title = '', String content = '', required Color color}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    child: Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.isNotEmpty
              ? Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              : const SizedBox(),
          content.isNotEmpty
              ? Text(
                  content,
                  style: TextStyle(color: Colors.white),
                )
              : const SizedBox(),
        ],
      ),
      Positioned(
          top: -18,
          right: -15,
          child: IconButton(
            style: const ButtonStyle(iconSize: MaterialStatePropertyAll(10)),
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            icon: const Icon(
              Ionicons.close,
              size: 20,
              color: Colors.white,
            ),
          ))
    ]),
  );
}
