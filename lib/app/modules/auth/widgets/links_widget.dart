import 'package:flutter/material.dart';

import 'link_text_widget.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      child: SizedBox(
        width: double.infinity,
        height: size.width >= 1000 ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            LinkTextWidget(text: 'About', onTap: () {}),
            LinkTextWidget(text: 'Help Center', onTap: () {}),
            LinkTextWidget(text: 'Terms of Service', onTap: () {}),
            LinkTextWidget(text: 'Privacy Policy', onTap: () {}),
            LinkTextWidget(text: 'Cookies', onTap: () {}),
            LinkTextWidget(text: 'Ads info', onTap: () {}),
            LinkTextWidget(text: 'Blog', onTap: () {}),
            LinkTextWidget(text: 'Status', onTap: () {}),
            LinkTextWidget(text: 'Brand Resources', onTap: () {}),
            LinkTextWidget(text: 'Careers', onTap: () {}),
            LinkTextWidget(text: 'Developers', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
