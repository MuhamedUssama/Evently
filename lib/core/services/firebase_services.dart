import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';

class FirebaseServices {
  static CollectionReference<Event> getEventsCollection() => FirebaseFirestore
      .instance
      .collection(Event.collectionName)
      .withConverter<Event>(
        fromFirestore: (snapshot, options) => Event.fromJson(snapshot.data()!),
        toFirestore: (event, options) => event.toJson(),
      );

  static Future<void> addEventToFireStore(Event event) async {
    CollectionReference<Event> collection = getEventsCollection();

    DocumentReference<Event> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<Event>> getEventsFromFireStore() async {
    CollectionReference<Event> collection = getEventsCollection();

    QuerySnapshot<Event> querySnapshot = await collection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
