// import 'package:flutter/material.dart';
// import 'package:hucel_core/hucel_core.dart';

// import '../../../core/constants/kDefault_constants.dart';
// import '../../../core/constants/screen_constant.dart';
// import '../../../core/widget/default_piece_container.dart';

// class LastCodeArchive extends StatelessWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   LastCodeArchive({Key? key}) : super(key: key);

//   final double aspect = 9 / 16;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultPieceContainer(
//       decoration: BoxDecoration(
//           gradient: HomeConstants.instance.mainBackgroundGradient),
//       padding: context.allPad * 2,
//       child: ResponsiveChild(
//         small: _child,
//         medium: _child,
//         large: _child,
//       ),
//     );
//   }

//   Widget get _child {
//     return MultiBuilder(builder:
//         (context, deviceHeight, deviceWidth, boxConstraints, orientation) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _title(context),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _leftImageContainer(context),
//               SizedBox(
//                 width: deviceWidth * 0.01,
//               ),
//               _centerNoteContainer(context),
//               SizedBox(
//                 width: deviceWidth * 0.01,
//               ),
//               _rightCodeContainer(context),
//             ],
//           ),
//         ],
//       );
//     });
//   }

//   Container _title(BuildContext context) {
//     return Container(
//       height: kMainAppBarDefaultSize * 0.8,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: context.theme.primaryColor,
//         borderRadius: context.borderRadiusTopS,
//       ),
//       child: FittedBoxText(
//         'Container in Image Decoration',
//         style: context.headline5?.coBoldBlack,
//       ),
//     );
//   }

//   Widget _rightCodeContainer(BuildContext context) {
//     return ExpandedAspectRatio(
//       aspectRatio: aspect,
//       child: Container(
//         padding: context.allPad,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: context.borderRadiusBottomS,
//         ),
//         child: const SingleChildScrollView(
//           child: SelectableText(
//             'Container içerisinde birçok özellik otomatik gelmektedir.\n Code bölümünde okuduğunuz kodlar aslında\n firebase için tasarlanmış kodlardır. bu sebep ile anlamlandırmanız saçma olacaktır. birde Resim rastgele gelmektedir onunla kodu eşleştirmekte hata olacaktır.',
//             maxLines: null,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _centerNoteContainer(BuildContext context) {
//     return ExpandedAspectRatio(
//       aspectRatio: aspect,
//       child: Container(
//         padding: context.allPad,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: context.borderRadiusBottomS,
//         ),
//         child: const SingleChildScrollView(
//           child: SelectableText(
//             'rules_version = 2\nservice cloud.firestore {\nmatch /databases/{database}/documents {\nmatch /{document=**} {\nallow read, write: if request.auth != null;\n}\n\n}\n}\n\n{\n"rules": {\n".read": "auth != null",\n".write": "auth != null"\n}\n}\n',
//             maxLines: null,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _leftImageContainer(BuildContext context) {
//     return ExpandedAspectRatio(
//       aspectRatio: aspect,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//               image: NetworkImage(''.randomImage), fit: BoxFit.cover),
//           borderRadius: context.borderRadiusBottomS,
//         ),
//       ),
//     );
//   }
// }
