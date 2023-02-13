import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class AboutUsOccasionsCard extends StatelessWidget {
  final String text;

  const AboutUsOccasionsCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              BaseStrings.charity,
              style: BaseTextStyle.black18Bold,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: BaseTextStyle.black14,
            ),
          ],
        ),
      ),
    );
  }
}
