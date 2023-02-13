import 'package:flutter/material.dart';
import 'package:yallah_farha/ui/widgets/view_pay_button.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ViewPayCard extends StatelessWidget {
  final String title;
  final String image;

  const ViewPayCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BaseBorderRadius.border20,
              child: Image.network(
                image,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Text(title, style: BaseTextStyle.black14Bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(child: ViewPayButton(title: 'view')),
                SizedBox(width: 8),
                Expanded(child: ViewPayButton(title: 'pay')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
