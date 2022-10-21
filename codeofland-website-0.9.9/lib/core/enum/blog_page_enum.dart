import 'package:hucel_core/hucel_core.dart';

enum BlogPageEnum {
  title,
  subtitle,
  text,
  image,
  video,
  code,
  link,
}

class BlogDetailModel extends BaseModel {
  BlogPageEnum blogEnum;
  String value;

  BlogDetailModel({
    required this.blogEnum,
    required this.value,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

List<BlogDetailModel> listBlog = [
  BlogDetailModel(blogEnum: BlogPageEnum.title, value: 'Section One:'),
  BlogDetailModel(
    blogEnum: BlogPageEnum.text,
    value: 'This is first text in my blog and tested how can do enum with page',
  ),
  BlogDetailModel(blogEnum: BlogPageEnum.image, value: ''.randomImage),
  BlogDetailModel(
    blogEnum: BlogPageEnum.text,
    value:
        'A few days ago I took my Macbook Pro into the shop. It needed a new battery; the current one is five years old and dies after an hour. We’ll be in touch by next Tuesday, the repair shop said. So in the meantime, I started working on my backup laptop — which runs Linux. It’s an 11-year-old Thinkpad T420, a big ol’ thick brick of computation that I bought used a few years ago for 200. Things were going fine, as I cranked away at email and some reading for research. Then a few minutes before 1 pm, I remembered I had to join a video call.',
  ),
  BlogDetailModel(blogEnum: BlogPageEnum.image, value: ''.randomImage),
  BlogDetailModel(blogEnum: BlogPageEnum.image, value: ''.randomImage),
  BlogDetailModel(
    blogEnum: BlogPageEnum.text,
    value:
        'A few days ago I took my Macbook Pro into the shop. It needed a new battery; the current one is five years old and dies after an hour. We’ll be in touch by next Tuesday, the repair shop said. So in the meantime, I started working on my backup laptop — which runs Linux. It’s an 11-year-old Thinkpad T420, a big ol’ thick brick of computation that I bought used a few years ago for 200. Things were going fine, as I cranked away at email and some reading for research. Then a few minutes before 1 pm, I remembered I had to join a video call.',
  ),
];

Map<BlogPageEnum, String> blogMap = {
  BlogPageEnum.title: 'Section 1',
  BlogPageEnum.text:
      'This is first text in my blog and tested how can do enum with page',
  BlogPageEnum.image: ''.randomImage,
  BlogPageEnum.code: 'Widget build(BuildContext context) {}',
  // ignore: equal_keys_in_map
  BlogPageEnum.text:
      'A few days ago I took my Macbook Pro into the shop. It needed a new battery; the current one is five years old and dies after an hour. We’ll be in touch by next Tuesday, the repair shop said. So in the meantime, I started working on my backup laptop — which runs Linux. It’s an 11-year-old Thinkpad T420, a big ol’ thick brick of computation that I bought used a few years ago for 200. Things were going fine, as I cranked away at email and some reading for research. Then a few minutes before 1 pm, I remembered I had to join a video call.',
};
