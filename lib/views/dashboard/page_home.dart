import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';
import '../../views/examination/exam_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageHeader(heading: 'Upcoming Exams'),
        SizedBox(height: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ExamDataTile();
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Style.themeBlack,
              ),
              itemCount: 9,
            ),
          ),
        ),
      ],
    );
  }
}

class ExamDataTile extends StatelessWidget {
  _openExamPage(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => ExamPageScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _openExamPage(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              SquareDot(),
              Text(
                'Finals: Biomedical Engineering 2',
                style: Style.heading1.copyWith(),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tomorrow', style: Style.smallHeading),
              Text(
                '2:00 PM 23/12/20',
                style: Style.body2,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'College of Engineering',
            style: Style.heading2,
          ),
          SizedBox(height: 8),
          Text(
              'Lorem ipsum camldron the waka non is ipsum to let in name description in situ cardavva de wahala',
              style: Style.body3),
        ],
      ),
    );
  }
}
