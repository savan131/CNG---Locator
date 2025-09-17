// import 'package:firebase_auth/firebase_auth.dart';

// class DatabaseService {

//   final String? uid;
//   DatabaseService({ this.uid });

//   // collection reference
//   final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

//   Future<void> updateUserData(String sugars, String name, int strength) async {
//     return await brewCollection.doc(uid!).set({
//       'sugars': sugars,
//       'name': name,
//       'strength': strength,
//     });
//   }

// }