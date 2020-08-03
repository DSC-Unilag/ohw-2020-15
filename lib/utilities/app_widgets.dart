import 'package:flutter/material.dart';
import 'style.dart' as Style;

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      color: Style.themeGreen,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.themeGreen,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          Style.OhwExamAppIcons.ohwExamAppIcon,
          color: Style.themeWhite,
          size: 25,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class PageHeader extends StatelessWidget {
  final String heading;
  final String nextActionLabel;
  final Function nextAction;
  final bool canPop;

  const PageHeader(
      {Key key,
      @required this.heading,
      this.nextAction,
      this.canPop = false,
      this.nextActionLabel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: canPop
                ? IconButton(
                    alignment: Alignment(-0.2, 0),
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Style.themeGreen,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: const EdgeInsets.only(left: 0),
                  )
                : null,
          ),
          Container(
            child: Text('$heading', style: Style.pageHeaderTextStyle),
            height: 24,
            constraints: BoxConstraints(minWidth: 88),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Style.themeGreen,
                width: 1,
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
            child: nextActionLabel != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: RawMaterialButton(
                      onPressed: nextAction,
                      elevation: 0,
                      padding: const EdgeInsets.only(right: 0),
                      child: Text(
                        '$nextActionLabel',
                        textAlign: TextAlign.right,
                        style: Style.pageHeaderTextStyle
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const ContinueButton({Key key, @required this.label, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 0,
      constraints: BoxConstraints.tight(Size.fromHeight(40)),
      padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
      fillColor: Style.themeGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label',
            style: Style.bigButtonTextStyle,
          ),
          Icon(
            Icons.keyboard_backspace,
            textDirection: TextDirection.rtl,
            color: Style.themeWhite,
          )
        ],
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final IconData icon;
  final bool reverseIcon;

  const SmallButton(
      {Key key,
      @required this.label,
      @required this.onTap,
      @required this.icon,
      this.reverseIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 0,
      constraints: BoxConstraints.tight(Size(120, 48)),
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      fillColor: Style.themeGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label',
            style: Style.smallButtonTextStyle,
          ),
          Icon(
            icon,
            color: Style.themeWhite,
            size: 18,
            textDirection: !reverseIcon ? TextDirection.ltr : TextDirection.rtl,
          )
        ],
      ),
    );
  }
}

class OverheadLabelTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String label;
  final String hint;
  final int minLines;
  final int maxLines;
  final bool canGrow;
  const OverheadLabelTextField({
    Key key,
    this.controller,
    this.validator,
    @required this.label,
    this.hint,
    this.minLines,
    this.maxLines = 1,
    this.canGrow = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text('$label', style: Style.fieldLabelTextStyle),
          ),
          TextFormField(
            maxLines: maxLines,
            minLines: minLines,
            expands: canGrow,
            cursorColor: Style.themeBlue,
            style: Style.body2,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Style.fieldHintTextStyle,
              contentPadding: const EdgeInsets.fromLTRB(0, 4, 16, 4),
              isDense: true,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Style.themeGreen,
                  width: 0.3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Style.themeGreen,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegularLabelTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String label;
  final String hint;
  final int minLines;
  final int maxLines;
  final bool canGrow;
  const RegularLabelTextField({
    Key key,
    this.controller,
    this.validator,
    this.label,
    this.hint,
    this.minLines,
    this.maxLines = 1,
    this.canGrow = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        expands: canGrow,
        cursorColor: Style.themeBlue,
        style: Style.body2,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Style.fieldLabelTextStyle,
          hintText: hint,
          hintStyle: Style.fieldHintTextStyle,
          contentPadding: const EdgeInsets.fromLTRB(0, 4, 16, 4),
          isDense: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Style.themeGreen,
              width: 0.3,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Style.themeGreen,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class GenericInputHolder extends StatelessWidget {
  final String inputLabel;
  final Widget child;

  const GenericInputHolder(
      {Key key, @required this.inputLabel, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$inputLabel',
              style: Style.fieldLabelTextStyle,
            ),
          ),
          Container(
            child: child,
            constraints: BoxConstraints.tight(
              Size.fromHeight(32),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Style.themeGreen,
                  width: 0.3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DropDownInputField extends StatelessWidget {
  final String inputLabel;
  final String hint;

  const DropDownInputField({Key key, @required this.inputLabel, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$inputLabel',
              style: Style.fieldLabelTextStyle,
            ),
          ),
          Container(
            child: DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text('Class 1'),
                  value: 1,
                ),
              ],
              onChanged: (selectedOption) {
                print('well');
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: hint,
                hintStyle: Style.fieldHintTextStyle,
                contentPadding: const EdgeInsets.only(bottom: 4.0),
                border: InputBorder.none,
              ),
            ),
            constraints: BoxConstraints.tight(
              Size.fromHeight(32),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Style.themeGreen,
                  width: 0.3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  final bool initialValue;
  final String choice;
  final Function(bool value) onChanged;

  const CustomCheckBox(
      {@required this.initialValue, this.onChanged, this.choice});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
          if (widget.onChanged != null) widget.onChanged(value);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 1,
                color: Style.themeGreen,
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: value ? Style.themeGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(
            '${widget.choice}',
            style: Style.body1Green,
          )
        ],
      ),
    );
  }
}

class SquareDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
      decoration: BoxDecoration(
        color: Style.themeGreen,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class ExamDataCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 32, 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Style.themeGreenLight,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.help_outline,
                color: Style.themeGreen,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  '50 questions',
                  style: Style.body2,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Style.themeGreen,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  '45 minutes',
                  style: Style.body2,
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                color: Style.themeGreen,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                  style: Style.body2Grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AttemptDetailsCard extends StatelessWidget {
  Widget dataGroup(String label, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '${label.toUpperCase()}',
          style: Style.body3Light,
        ),
        SizedBox(height: 8),
        Text(
          '$data',
          style: Style.body3,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Style.themeGreenLight,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: <Widget>[
          dataGroup('Started At', '2:30 pm'),
          dataGroup('Time left', '00:00'),
          dataGroup('Ended At', '3:17 pm'),
          dataGroup('Exam Date', '23 August, 2021'),
          dataGroup('Attempted', '50/50'),
          dataGroup('Performace', '67%'),
        ],
      ),
    );
  }
}

class ExamInstructionsCard extends StatelessWidget {
  final Color color;

  const ExamInstructionsCard({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 32, 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color ?? Style.themeGreenLight,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Instructions',
              style: Style.body3Bold,
            ),
          ),
          Text(
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
            style: Style.body2Grey,
          )
        ],
      ),
    );
  }
}

class SummaryOfAttempts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        //crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 48,
        runSpacing: 24,
        runAlignment: WrapAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '200',
                style: Style.body1.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Attempts',
                style: Style.body1.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '87%',
                style: Style.body1.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Performace \nAverage',
                textAlign: TextAlign.center,
                style: Style.body1.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ExamSolutionTile extends StatelessWidget {
  final String count;
  final bool isAnswer;

  const ExamSolutionTile(this.count, {this.isAnswer});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: 36,
        width: 36,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isAnswer ? Style.themeBlueLight : Colors.transparent,
        border: Border.all(
          color: Style.themeGreen,
          width: 0.5,
        ),
      ),
      child: Text(
        '$count',
        style: Style.body2,
      ),
    );
  }
}

class QuestionWidgetReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '1',
              style: Style.body2Green,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: double.maxFinite,
                    ),
                    child: Text(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                      style: Style.body2.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (int i = 0; i < 3; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  "A.  Option 1",
                                  style: Style.body3Bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.end,
                          runAlignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: <Widget>[
                            ExamSolutionTile('B', isAnswer: true),
                            ExamSolutionTile('D', isAnswer: true),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class AppNotification extends StatelessWidget {
  final String heading;
  final String body;

  const AppNotification({@required this.heading, @required this.body});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$heading',
            style: Style.body2.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            '$body',
            style: Style.body3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
