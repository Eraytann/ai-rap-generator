import 'package:flutter/material.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import 'package:rap_generator/app/Screens/prompts_page/view/prompts_page_view.dart';

import '../../../Widgets/circle_button_widget.dart';

class PlusButtonWidget extends StatelessWidget {
  const PlusButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 70,
      child: CircleButton(
        onPressed: () {
          Navigation.push(
            page: const PromtsPage(),
          );
        },
      ),
    );
  }
}
