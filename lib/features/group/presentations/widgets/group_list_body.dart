import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:telechat/core/utils/widgets/bottom_navigator.dart';
import 'package:telechat/core/utils/widgets/loader.dart';
import 'package:telechat/core/utils/widgets/snackbar.dart';
import 'package:telechat/features/chat/presentations/views/chat_page.dart';
import 'package:telechat/features/group/presentations/bloc/group/group_bloc.dart';
import 'package:telechat/features/group/presentations/bloc/user/user_bloc.dart';
import 'package:telechat/features/group/presentations/widgets/add_person.dart';
import 'package:telechat/features/group/presentations/widgets/appbar.dart';
import 'package:telechat/features/group/presentations/widgets/chat_item.dart';
import 'package:telechat/features/group/presentations/widgets/create_new_group_dialog.dart';
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
        pressPop: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          const SizedBox(
            height: 15,
          ),
          _buildPeopleRecomended(context),
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

  Widget _buildPeopleRecomended(BuildContext _) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            AddPerson(
              addNewGroup: () async {
                showDialog(
                  context: context,
                  builder: (context) => CreateNewGroupDialog(
                    createGroup: (newGroup) {
                      BlocProvider.of<GroupBloc>(_).add(CreateGroup(newGroup));
                    },
                  ),
                );
              },
            ),
            _listPeople(),
          ],
        ),
      ),
    );
  }

  Widget _listPeople() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Row(
            children: List.generate(
                state.users.length,
                (index) => PersonRecommended(
                      user: state.users[index],
                    )),
          );
        }
        return Loader();
      },
    );
  }

  Widget _buildGroupList() {
    return Scrollbar(
      interactive: true,
      radius: const Radius.circular(20),
      trackVisibility: true,
      child: BlocConsumer<GroupBloc, GroupState>(
        listener: (context, state) {
          if (state.status == GroupStatus.loadfailed) {
            showSnackBarr(context, color: Colors.red, content: state.error!);
          }
          if (state.status == GroupStatus.created) {
            showSnackBarr(context,
                color: Colors.green, content: 'Create Group Successfully!');
            BlocProvider.of<GroupBloc>(context).add(const LoadGroup());
          }
          if (state.status == GroupStatus.createfailed) {
            showSnackBarr(context, color: Colors.red, content: state.error!);
          }
        },
        builder: (context, state) {
          if (state.status == GroupStatus.loadding) {
            return const Loader();
          }
          if (state.status == GroupStatus.loadfailed) {
            return const SizedBox();
          }
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.groups.length,
                  (context, index) => ChatItem(
                    group: state.groups[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatPage(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
