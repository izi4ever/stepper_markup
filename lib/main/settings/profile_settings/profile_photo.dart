import 'package:flutter/material.dart';
import 'package:stepper_markup/main/settings/profile_settings/get_avatar.dart';

import '../../../theme/theme_const.dart';

class ProfilePhoto extends StatefulWidget {
  ProfilePhoto({Key? key}) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        Text('Profile photo', style: kTextHeader1),
        const SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 6),
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/564x/1c/6d/50/1c6d50321c3ccd49565d6446789797fb.jpg'),
                radius: 37,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => GetAvatar());
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xfff9fafc),
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                    side: BorderSide(color: Colors.grey[200]!, width: 1),
                  ), 
                  child: Text('Upload', style: TextStyle(color: Colors.grey[500])),
                ),
                const SizedBox(height: 3),
                Text('Recommended size 100x100', style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ],
        ),
        const SizedBox(height: 17),
      ],
    );
  }
}