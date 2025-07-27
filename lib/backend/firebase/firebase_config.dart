import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC8ko-xvCIq__8TNICHTn9IHE4pvk_OSoA",
            authDomain: "to-do-list-n8mmb5.firebaseapp.com",
            projectId: "to-do-list-n8mmb5",
            storageBucket: "to-do-list-n8mmb5.appspot.com",
            messagingSenderId: "760108044634",
            appId: "1:760108044634:web:a9fc54406b0f991cbda363"));
  } else {
    await Firebase.initializeApp();
  }
}
