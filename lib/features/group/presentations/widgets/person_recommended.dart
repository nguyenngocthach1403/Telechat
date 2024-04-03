import 'package:flutter/material.dart';
import 'package:telechat/features/group/domain/entities/user_entity.dart';

class PersonRecommended extends StatelessWidget {
  const PersonRecommended({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 58,
      height: 58,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: user.isOnline
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(58),
      ),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: user.profileUrl.isNotEmpty
                ? NetworkImage(user.profileUrl)
                : const NetworkImage(
                    'https://th.bing.com/th/id/OIP.ttYz33RwCujbjz1J9m8lBQHaFK?rs=1&pid=ImgDetMain'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
