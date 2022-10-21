// import 'package:flutter/material.dart';
// import 'package:hucel_core/hucel_core.dart';
// import 'package:lottie/lottie.dart';

// import '../../../core/constants/screen_constant.dart';
// import '../../../core/extension/style_extension.dart';
// import '../../../core/widget/custom_elevated_button.dart';
// import '../../../core/widget/response/aspect_ratio_builder.dart';

// // return AspectRatioBuilder(
// //   type: AspectRatioType.type4x3,
// //   builder: (context, constraints) {
// //     _constraints = constraints;
// //     return Container(
// //       padding: context.padHorizontalN +
// //           const EdgeInsets.only(top: kMainAppBarDefaultSize),
// //       decoration: BoxDecoration(
// //         gradient: constants.mainBackgroundGradient,
// //       ),
// //       constraints: const BoxConstraints(minWidth: 600),
// //       child: Row(
// //         children: [
// //           Expanded(child: leftWidget),
// //           Expanded(child: rightWidget),
// //         ],
// //       ),
// //     );
// //   },
// // );

// class HomeScreenOnePage extends StatelessWidget {
//   HomeScreenOnePage({Key? key}) : super(key: key);

//   final HomeConstants constants = HomeConstants.instance;
//   late final BuildContext _context;
//   late final BoxConstraints _constraints;

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     return AspectRatioBuilder(
//       type: AspectRatioType.type16x9,
//       builder: (context, constraints) {
//         _constraints = constraints;

//         return ResponsiveChild(
//           small: children,
//         );
//       },
//     );
//   }

//   Widget get children {
//     return Row(children: [leftWidget, rightWidget]);
//   }

//   Widget get rightWidget {
//     return LottieBuilder.network(
//       constants.mainPage.mainUrl!,
//       frameBuilder: (context, child, composition) {
//         return Padding(
//           padding: const EdgeInsets.all(24),
//           child: child,
//         );
//       },
//     );
//   }

//   Widget get leftWidget {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _mainText(),
//         _threeHeightSized,
//         _subText(),
//         _threeHeightSized,
//         _button,
//       ],
//     );
//   }

//   ElevatedButton get _button {
//     return ElevatedButton(
//       style: CustomButtonStyle(
//         padding: EdgeInsets.all(_context.width * 0.015),
//         fixedSize: Size(
//           _constraints.maxWidth * 0.12,
//           _constraints.maxWidth * 0.04,
//         ),
//         minimumSize: const Size(90, 36),
//       ),
//       child: FittedBoxText(
//         HomeConstants.instance.goProject,
//         style: _context.headline3.coBold,
//       ),
//       onPressed: () {},
//     );
//   }

//   SizedBox _subText() {
//     return SizedBox(
//       width: _constraints.maxWidth / 2,
//       child: Text(
//         HomeConstants.instance.mainSubTitle,
//         style: _context.bodyText1.size(_constraints.maxHeight * 0.04),
//       ),
//     );
//   }

//   FittedBoxText _mainText() {
//     return FittedBoxText(
//       constants.mainTitle,
//       style: mainStyle,
//     );
//   }

//   SizedBox get _threeHeightSized => SizedBox(height: _context.height * 0.03);

//   TextStyle? get mainStyle => _context.widthHuge
//       ? _context.headline3.coBold
//       : _context.widthLarge
//           ? _context.headline4.coBold
//           : _context.widthMedium
//               ? _context.headline5.coBold
//               : _context.headline6.coBold;
// }
