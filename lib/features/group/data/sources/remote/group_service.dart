import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/core/constants/strings.dart';
import 'package:telechat/features/group/data/models/group_model.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';

abstract class GroupService {
  Future<Stream<List<GroupModel>>> getMyGroup(String uid);

  Future<void> createGroup(GroupEntity groupToCreate);
}

class GroupServiceImpl implements GroupService {
  FirebaseFirestore _firestore;
  GroupServiceImpl(this._firestore);

  @override
  Future<Stream<List<GroupModel>>> getMyGroup(String uid) async {
    //Get snapshot
    final docSnapshot = _firestore
        .collection(userDocument)
        .doc(uid)
        .collection('MyGroups')
        .snapshots();

    //Convert to QuerySnapshot to List<GroupModel>
    //Return it
    return docSnapshot.map((event) =>
        event.docs.map((e) => GroupModel.fromSnapshotToMyGroup(e)).toList());
  }

  @override
  Future<void> createGroup(GroupEntity groupToCreate) async {
    //get collection
    final doc = _firestore.collection(groupDocument).doc();

    final groupToCreateHasId = groupToCreate.copyWith(groupId: doc.id);

    //Add to collection group
    _firestore
        .collection(
          groupDocument,
        )
        .doc(doc.id)
        .set(groupToCreateHasId.toDocument());

    //Add to my group of member
    groupToCreate.members.forEach(
      (element) {
        //Get collection
        final myGroupDoc = _firestore
            .collection(userDocument)
            .doc(element)
            .collection('MyGroups');

        // Add
        myGroupDoc.doc(doc.id).set(groupToCreateHasId.toDocumentMyGroup());
      },
    );
  }
}
