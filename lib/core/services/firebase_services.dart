import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static CollectionReference<Event> getEventsCollection() => FirebaseFirestore
      .instance
      .collection(Event.collectionName)
      .withConverter<Event>(
        fromFirestore: (snapshot, options) => Event.fromJson(snapshot.data()!),
        toFirestore: (event, options) => event.toJson(),
      );

  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance
          .collection(UserModel.collectionName)
          .withConverter<UserModel>(
            fromFirestore:
                (snapshot, options) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, options) => user.toJson(),
          );

  static Future<void> addEventToFireStore(Event event) async {
    CollectionReference<Event> collection = getEventsCollection();

    DocumentReference<Event> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<Event>> getEventsFromFireStore(String categoryId) async {
    CollectionReference<Event> collection = getEventsCollection();

    late QuerySnapshot<Event> querySnapshot;

    if (categoryId == '1') {
      querySnapshot = await collection.orderBy('dateTime').get();
    } else {
      querySnapshot =
          await collection
              .where('categoryId', isEqualTo: categoryId)
              .orderBy('dateTime')
              .get();
    }

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      favourateEventsIds: [],
    );

    CollectionReference<UserModel> usersCollection = getUsersCollection();
    await usersCollection.doc(credential.user!.uid).set(user);

    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    CollectionReference<UserModel> usersCollection = getUsersCollection();

    DocumentSnapshot<UserModel> docSnapShot =
        await usersCollection.doc(credential.user!.uid).get();

    return docSnapShot.data()!;
  }

  static Future<UserModel?> getCurrentUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        CollectionReference<UserModel> usersCollection = getUsersCollection();

        DocumentSnapshot<UserModel> docSnapShot =
            await usersCollection.doc(currentUser.uid).get();

        return docSnapShot.data();
      }

      return null;
    } catch (error) {
      log('Error getting user data: ${error.toString()}');
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      log('Error signing out: $error');
    }
  }

  static Future<void> addEventToFavourate(String eventId) async {
    CollectionReference<UserModel> userCollection = getUsersCollection();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await userCollection.doc(userId).update({
      'favourateEventsIds': FieldValue.arrayUnion([eventId]),
    });
  }

  static Future<void> removeEventFromFavourate(String eventId) async {
    CollectionReference<UserModel> userCollection = getUsersCollection();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await userCollection.doc(userId).update({
      'favourateEventsIds': FieldValue.arrayRemove([eventId]),
    });
  }

  static Future<List<Event>> getFavoriteEvents() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return [];

    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentSnapshot<UserModel> userDoc =
        await usersCollection.doc(currentUser.uid).get();
    UserModel? user = userDoc.data();
    if (user == null || user.favourateEventsIds.isEmpty) return [];

    CollectionReference<Event> eventsCollection = getEventsCollection();
    QuerySnapshot<Event> querySnapshot =
        await eventsCollection
            .where(FieldPath.documentId, whereIn: user.favourateEventsIds)
            .get();

    return querySnapshot.docs.map((event) => event.data()).toList();
  }

  static Future<void> deleteEvent(String eventId) async {
    CollectionReference<Event> eventsCollection = getEventsCollection();
    await eventsCollection.doc(eventId).delete();
  }
}
