import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

import 'add_questions.dart';

class CreateExamScreen extends StatelessWidget {
  addQuestionsToExam(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => AddQuestionsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          PageHeader(heading: "Create Exam"),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Institution',
                      style: Style.fieldLabelTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: Text(
                        'College of Linguistics',
                        style: Style.body1,
                      ),
                    ),
                    OverheadLabelTextField(
                      label: 'Exam Name',
                      hint: 'Enter the name of the Exam',
                    ),
                    OverheadLabelTextField(
                      label: 'Description',
                      hint: 'Describe this test briefly',
                      minLines: 4,
                      maxLines: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GenericInputHolder(
                            inputLabel: 'Opening Date',
                            child: RawMaterialButton(
                              onPressed: () async {
                                DateTime date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 90),
                                  ),
                                );
                                print(date);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('4 Feb, 2020'),
                                  Icon(
                                    Icons.calendar_today,
                                    color: Style.themeGreen,
                                    size: 20,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: GenericInputHolder(
                            inputLabel: 'Closing Date',
                            child: RawMaterialButton(
                              onPressed: () async {
                                DateTime date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 90),
                                  ),
                                );
                                print(date);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('4 Feb, 2020'),
                                  Icon(
                                    Icons.calendar_today,
                                    color: Style.themeGreen,
                                    size: 20,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Duration and class fields
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GenericInputHolder(
                            inputLabel: 'Test Duration',
                            child: RawMaterialButton(
                              onPressed: () async {
                                TimeOfDay time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                print(time);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(''),
                                  Icon(
                                    Icons.access_time,
                                    color: Style.themeGreen,
                                    size: 20,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: DropDownInputField(
                            inputLabel: 'Class',
                            hint: 'Category of students',
                          ),
                        ),
                      ],
                    ),
                    OverheadLabelTextField(
                      label: 'Instructions',
                      hint:
                          'Leave instructions for students taking this test to read before they begin',
                      minLines: 4,
                      maxLines: 7,
                    ),
                    ContinueButton(
                      label: 'Add Questions',
                      onTap: () {
                        addQuestionsToExam(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
