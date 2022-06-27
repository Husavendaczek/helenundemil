import 'package:flutter/material.dart';
import 'package:helenundemil/models/challenge.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/widgets/general/my_checkbox.dart';
import 'package:helenundemil/widgets/general/my_text.dart';

class ChallengeCheckbox extends StatefulWidget {
  final Challenge challenge;

  const ChallengeCheckbox({Key? key, required this.challenge})
      : super(key: key);

  @override
  _ChallengeCheckboxState createState() => _ChallengeCheckboxState();
}

class _ChallengeCheckboxState extends State<ChallengeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getIcon(),
        Flexible(child: MyText(text: widget.challenge.title)),
      ],
    );
  }

  Widget _getIcon() {
    if (widget.challenge.challengeType == ChallengeType.person) {
      return MyCheckbox(
        challenge: widget.challenge,
        color: AppColors.Accent,
      );
    } else {
      return MyCheckbox(
        challenge: widget.challenge,
        color: AppColors.Primary,
      );
    }
  }
}
