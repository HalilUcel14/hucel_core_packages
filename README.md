# Hucel_Core

## mail address : hucelsoft@gmail.com

## youtube : https://www.youtube.com/channel/UC4GTOIiDWEe6jIuXlqSIhQg

## Github : https://github.com/HalilUcel14

## Linkedin : https://www.linkedin.com/in/halilucel/

### Text Theme Mod
Ne İşe Yarar: Context içerisinden doğrudan TextTheme.Headline1 gibi uzantıları ele alabilirsiniz.

```dart
  Text(
        'Tested',
        style: context.headLine1,
        );
```

### Error SnackBar
Ne İşe Yarar: Ekranda Error göstermek istediğiniz bilgi ve metinleri hoş bir imaj ile gösterir.

```dart
   @override
  ElevatedButtonWithStadiumBorder(
      child: Text(
        _loginConstant.signInButton,
        style: TextStyle(
          fontSize: constraints.maxHeight * 0.05,
        ),
      ),
      onPressed: () => context.snackbar(errorList: [
        'bu bir test mesajıdır ...................aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        'bu bir test mesajıdır ...................',
        'bu bir test mesajıdır ...................',
        'bu bir test mesajıdır ...................',
      ]), //viewModel.buttonPressed,
      fixedSize: Size(
        constraints.maxWidth * 0.3,
        constraints.maxHeight * 0.13,
      ),
    );
```

### FireStore Get Download Url
Ne İşe Yarar: Fire Store üzerine attığınız dosyaların indirme url linklerini getirir.

```dart
   @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      child: FutureBuilder(
        // 
        future: FirestoreGetDownloadUrl().get(imgUrl),
        //
        builder: (context, AsyncSnapshot snapshot) {
          return myStreamBuilderHelper(
            // My Future or Stream Helper
            snapshot: snapshot,
            connectionDone: Image.network(snapshot.data.toString()),
          );
        },
      ),
    );
  }
```

### IThemeManager
Ne İşe Yarar: Tema Yönetimi için İnterface'dir. Provider ile Theme Yönetiminde kullanılması için yazıldı.

```dart
   import 'package:flutter/material.dart';

    abstract class IThemeManager {
      late ThemeData currentTheme;
      late ThemeEnum currentThemeEnum;

      void changeTheme(ThemeEnum themes);
    }

    enum ThemeEnum { LIGHT, DARK }
```

### Stream Builder Helper
Ne İşe Yarar: Stream Builder için Expand içerisinde Yerini Rahat bulabilmesini sağlama ve helper ile Gelen datayı daha iyi yönetme için kolaylık sağlar

```dart
    Widget build(BuildContext context) {
    ///
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpandedStreamBuilder(
        stream: Stream.fromFuture(Future.delayed(Duration(seconds: 3))),
        builder: (context, AsyncSnapshot snapshot) {
          return myStreamBuilderHelper( // My code
            snapshot: snapshot,
            // Connection is State
            hasError:  Text("Your Error State on Widget"),
            connectionActive: Text("Your Active Widget"),
            connectionWaiting: Text("Your Waiting Widget"),
            connectionDone: Text("Your Done Widget"),
            connectionNone: Text("Your None Widget"),
          );
        },
      ),
    );
  }
```

### Firebase Helper
Ne İşe Yarar: Firebase Auth Code Kullanım.

```dart
    try {
      await FirebaseEmailPassAuthHelper().signIn(
        context,
        email: _appController.emailController.text.trim(),
        password: _appController.passwordController.text.trim(),
      );

      _isLogged(false);
    } on FirebaseAuthException {
      _isLogged(true);
      throw Exception("Firebase Hata");
    }
```

### Show Snackbar Utils
Ne İşe Yarar: Alt Pencere olarak uygulamada mesaj gösterir.

```dart
return Scaffold(
      body: Column(
        children: const [
          AppUtils.snackBarShow(context,
          text: "Email ile Girişte Hata Oluştu ${e.message}");
        ],
      ),
    );
```

### Random Color Container  Widget 
Ne İşe Yarar: Tüm View Modelleri tek bir üst sınıftan alarak ortaklaştırmaya ve bazı özelliklerin zorunlu kılınmasına yardımcı olacak.

```dart
return Scaffold(
      body: Column(
        children: const [
          Expanded(flex: 5, child: RandomColorContainer()),
          Expanded(flex: 3, child: RandomColorContainer()),
          Expanded(flex: 2, child: RandomColorContainer()),
        ],
      ),
    );
```

### Base View  Widget
Ne İşe Yarar: Tüm View Modelleri tek bir üst sınıftan alarak ortaklaştırmaya ve bazı özelliklerin zorunlu kılınmasına yardımcı olacak.

```dart
import 'package:flutter/material.dart';

import '../../core/baseview/base_view.dart';
import '../viewmodel/onboard_viewmodel.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context,OnBoardViewModel value) => Scaffold(),
    );
  }
}
```


### Base View Model Widget
Ne İşe Yarar: Tüm View Modelleri tek bir üst sınıftan alarak ortaklaştırmaya ve bazı özelliklerin zorunlu kılınmasına yardımcı olacak.

```dart
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/baseviewmodel/base_view_model.dart';
part 'onboard_viewmodel.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
```

### Dynamic Text Widget in FittedBox
Ne İşe Yarar: Dinamik olarak boyutlanır ve belirli bir sınır içerisinde şekillenir.

```dart
class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DynamicText(
      text: "Hello",
      fontSize: 0.05,
      colors: Colors.black,
    );
  }
}
```


### Dikey veya Yatay Oranlı Dinamik Sizedbox
Ne İşe Yarar: 0 ile 1 arasında verilecek yüzdesel oran ile Ekran içerisinde alan kaplayacak bir widget oluşturmanızı sağlar

```dart
class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
          Text("Hello"),
          SpaceSizedHeightBox(0.2), // %20 oranlı yüksek widget
          Text("Hello"),
      ]
    );
  }
}
```

### Rastgele Color Değerleri
Ne İşe Yarar: 17 Renk Paleti arasında rastgele bir Renk getirir.

```dart
class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
          Text("Hello",
          style: TextStyle(color: context.randomColor),
          ),
      ]
    );
  }
}
```

### Rastgele Resim (İnternetten)
Ne İşe Yarar: Random image sitesi api ile rastgele resim getirir. Ölçüleri (300x200)

```dart
class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
          Image.network("".randomImage),
      ]
    );
  }
}
```

