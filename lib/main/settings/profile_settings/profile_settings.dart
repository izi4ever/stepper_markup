import 'package:flutter/material.dart';
import 'package:stepper_markup/theme/form_dropdown_field.dart';

import '../../../theme/tpl_card_without_header.dart';
import '../../../theme/form_input_field.dart';
import '../../../theme/form_label.dart';
import '../../../theme/theme_const.dart';
import '../../../theme/tpl_page_body_padding.dart';
import 'profile_photo.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String? _selectedGender;
  int? selectedYear;
  int? selectedMonth;
  int? selectedDay;
  List<int> listYear  = [for(int i=0; i<120; i++) DateTime.now().year-i];
  List<int> listMonth = [for(int i=0; i<12;  i++) i+1];
  List<int> listDay   = [for(int i=0; i<31;  i++) i+1];

  @override
  Widget build(BuildContext context) {

    List<List<dynamic>> listDropdownFieldDate = [
      [10, 'Year', listYear, selectedYear, 7],
      [10, 'Day', listDay, selectedDay, 7],
      [10, 'Month', listMonth, selectedMonth, 0],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your profile'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: [
          CardWithoutHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePhoto(),

                Text('Personal information', style: kTextHeader1),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormLabel(title: 'First name'),
                      FormInputField(
                        hintText: 'Your first name',
                      ),
                      FormLabel(title: 'Last name'),
                      FormInputField(
                        hintText: 'Your last name',
                      ),
                      FormLabel(title: 'Gender'),
                      FormDropdownField(
                        hintText: 'Your gender',
                        items: [
                          ...['Male', 'Female'].map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          ),
                        ], 
                        onChanged: (gender) {
                          setState(() {
                            _selectedGender = gender as String;
                          });
                        },
                        value: _selectedGender,
                      ),

                      FormLabel(title: 'Birth date'),
                      Row(
                        children: [
                          ...listDropdownFieldDate.map(
                            (e) => Expanded(
                              flex: e[0],
                              child: Container(
                                margin: EdgeInsets.only(right: double.parse(e[4].toString())),
                                child: FormDropdownField(
                                  hintText: e[1],
                                  items: [
                                    ...e[2].map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e.toString()),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      e[3] = value as int;
                                    });
                                  },
                                  value: e[3],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      Text('Contact information', style: kTextHeader1),
                      FormLabel(title: 'Email'),
                      FormInputField(
                        hintText: 'patient@example.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      FormLabel(title: 'Phone'),
                      FormInputField(
                        hintText: '+XX (XXX) XXX-XX-XX',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context), 
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {}, 
                            child: const Text('Save'),
                          ),
                        ]
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ]
      ),
    );
  }
}