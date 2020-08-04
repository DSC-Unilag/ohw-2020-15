import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../examination/create_exam.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageHeader(heading: 'Your Profile'),
        SizedBox(height: 24),
        Expanded(
          child: Container(
            color: Colors.cyan,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => CreateExamScreen(),
                    ),
                  );
                },
                child: Text(
                  'Create Exam.',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
