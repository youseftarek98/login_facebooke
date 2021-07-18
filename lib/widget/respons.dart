import 'package:flutter/cupertino.dart';

class Response extends StatelessWidget {
  final Widget mobile;

  final Widget tablet;

  final Widget desktop;

  bool mobil(BuildContext context) => MediaQuery.of(context).size.width < 800;

  bool tab(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  bool desk(BuildContext context) => MediaQuery.of(context).size.width < 1200;

  const Response({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, index) {
      if (index.maxWidth >= 1200) {
        return desktop;
      } else if (index.maxWidth >= 800) {
        return tablet ?? mobile;
      } else {
        return mobile;
      }
    });
  }
}
