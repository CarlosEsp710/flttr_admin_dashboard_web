import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_options.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
