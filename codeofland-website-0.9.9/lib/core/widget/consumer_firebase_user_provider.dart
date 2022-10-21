// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConsumerFirebaseUserProvider extends StatelessWidget {
//   const ConsumerFirebaseUserProvider({Key? key, required this.childWidget})
//       : super(key: key);

//   final Widget childWidget;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<User?>(builder: (context, User? user, child) {
//       return user == null ? _nullUserChild() : childWidget;
//     });
//   }

//   Widget _nullUserChild() {
//     return Center(
//       child: Column(
//         children: [
//           const Text('is User Null Value or Not Auth User'),
//           ElevatedButton(onPressed: () {}, child: const Text('Login Page')),
//         ],
//       ),
//     );
//   }
// }
