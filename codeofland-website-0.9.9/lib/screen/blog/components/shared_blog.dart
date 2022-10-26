import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/enum/blog_page_enum.dart';

class SharedBlogPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SharedBlogPage({Key? key, required this.blogMap}) : super(key: key);

  final List<BlogDetailModel> blogMap;
  late final BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    List<Widget> childBlog = [];
    childBlog.add(const SizedBox(height: 16));
    for (var element in blogMap) {
      switch (element.blogEnum) {
        case BlogPageEnum.title:
          childBlog.add(titleText(element.value));
          break;
        case BlogPageEnum.text:
          childBlog.add(bodyText(element.value));
          break;
        case BlogPageEnum.code:
          childBlog.add(codeContainer(element.value));
          break;
        case BlogPageEnum.image:
          childBlog.add(bodyImage(element.value));
          break;
        default:
      }
    }

    return ColumnWithSpacing(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: childBlog,
    );
  }

  Widget titleText(String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: _context.headline6?.coBoldBlack,
        ),
        const Divider(color: Colors.grey, thickness: 0.5),
      ],
    );
  }

  Widget bodyText(String value) {
    return Text(value.leftTabSpace, style: _context.bodyText1?.coBlack);
  }

  Widget bodyImage(String value) {
    return Image.network(
      value,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return const CircularProgressIndicator();
        }
        return Container(
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }

  Widget codeContainer(String value) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: _context.width * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _context.width * 0.1,
        vertical: _context.width * 0.1,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Text(value, style: _context.bodyText1?.coBlack),
    );
  }
}
