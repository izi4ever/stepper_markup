import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '__custom_calendar.dart';

import 'marked_calendar.dart';

popupCalendar(BuildContext context) {
  showDialog(
    barrierColor: Colors.grey[300]?.withOpacity(0.7),                              // <<< Цвет затемнения под диалоговым окном .withOpacity(0.9)
    context: context, 
    builder: (context) {
      return AlertDialog(
        // scrollable: true,                                                       // <<< viewPort error
        insetPadding: EdgeInsets.zero,                                          // <<< Отступы от экрана!!!
        contentPadding: const EdgeInsets.only(top: 7, left: 10, right: 10, ),
        content: SizedBox(                                                      // <<<
          width: MediaQuery.of(context).size.width * 0.83,                      // <<< Ширина экрана * множитель
          // width: double.maxFinite * 0.85,                                       // Так умножение не работает
          child: ListView(                                                      // <<<
            shrinkWrap: true,                                                   // <<< Схлопывает по высоте содержимого
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context), 
                  icon: Icon(FontAwesomeIcons.circleXmark,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ),
              ),
              // CustomCalendar(),                                                 // <<< Не выделяются дни с датами
              MarkedCalendar(),
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Choose'),
              child: const Text('Choose'),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      );
    }
  );

}