// import 'package:flutter/material.dart';
// import 'package:hucel_core/hucel_core.dart';

// import '../../../core/constants/kDefault_constants.dart';
// import '../../../core/enum/blog_page_enum.dart';
// import '../../../core/widget/default_piece_container.dart';

// import '../../blog/components/shared_blog.dart';

// class LastPostedBlog extends StatelessWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   LastPostedBlog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //
//     Offset distance = const Offset(28, 28);
//     double blur = 30.0;
//     //

//     return DefaultPieceContainer(
//       margin: context.allPad * 2,
//       decoration: BoxDecoration(
//         borderRadius: context.borderRadiusAllS,
//         color: 'E7ECEF'.color,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: blur,
//             color: Colors.white,
//             offset: -distance,
//           ),
//           BoxShadow(
//             blurRadius: blur,
//             color: 'A7A9AF'.color,
//             offset: distance,
//           ),
//         ],
//       ),
//       child: ResponsiveChild(
//         small: blogWindow,
//         medium: blogWindow,
//         large: blogWindow,
//         isScrolled: false,
//       ),
//     );
//   }

//   Widget get blogWindow {
//     return MultiBuilder(
//       builder:
//           (context, deviceHeight, deviceWidth, boxConstraints, orientation) {
//         return Stack(
//           children: [
//             Padding(
//               padding: context.padHorizontalS,
//               child: SingleChildScrollView(
//                   child: SharedBlogPage(blogMap: listBlog)),
//             ),
//             Container(
//               height: kMainAppBarDefaultSize * 0.8,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: context.theme.primaryColor,
//                 borderRadius: context.borderRadiusTopS,
//               ),
//               child: FittedBoxText(
//                 'Theme Manager With Provider',
//                 style: context.headline5?.coBoldBlack,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
