import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:telechat/core/utils/widgets/bottom_navigator.dart';
import 'package:telechat/features/group/presentations/widgets/add_person.dart';
import 'package:telechat/features/group/presentations/widgets/appbar.dart';
import 'package:telechat/features/group/presentations/widgets/chat_item.dart';
import 'package:telechat/features/group/presentations/widgets/person_recommended.dart';

class GroupListBody extends StatefulWidget {
  const GroupListBody({super.key});

  @override
  State<GroupListBody> createState() => _GroupListBodyState();
}

class _GroupListBodyState extends State<GroupListBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        pressAction: () {},
        pressPop: () {},
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          const SizedBox(
            height: 15,
          ),
          _buildPeopleRecomended(),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: _buildGroupList(),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigation(),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(62.0),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        ),
        child: Row(
          children: [
            Icon(
              Ionicons.search,
              size: 17,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 5.0,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Here',
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Icon(
              Ionicons.mic,
              size: 17,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeopleRecomended() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const AddPerson(),
            _listPeople(),
          ],
        ),
      ),
    );
  }

  Widget _listPeople() {
    return Row(
      children: List.generate(20, (index) => PersonRecommended()),
    );
  }

  Widget _buildGroupList() {
    return Scrollbar(
      interactive: true,
      radius: const Radius.circular(20),
      trackVisibility: true,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const ChatItem(),
            ),
          )
        ],
      ),
    );
  }
}
