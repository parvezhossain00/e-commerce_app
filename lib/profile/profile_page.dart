
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  static String routeName = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData = profileController.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
            height: 10,
          ),
            Center(
              child: Container(
                height: 400,
                  width: 300,
                  child: Image.network("https://demo.alorferi.com${profileData['url']}")),
            ),
            // const CircleAvatar(
            //   radius: 80,
            //   backgroundImage:
            //   NetworkImage("${Urls.baseUrl}${profileData["url"]}"),
            // ),
            const SizedBox(height: 10),
            Text("${profileData['name']},",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            Text("${profileData['email']}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            // itemProfile(profileData['name']),
            const SizedBox(
              height: 10,
            ),
            // itemProfile('Email', 'swaponbro1@gmail.com', CupertinoIcons.mail),

            // itemProfile(
            //     'Address', 'Rampura, Banasree, Dhaka', CupertinoIcons.location),
          ],
        ),
      ),
    );
  }

//   Widget itemProfile(String title, String subtitle, IconData iconData) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(0, 5),
//                 color: Colors.black.withOpacity(.2),
//                 spreadRadius: 2,
//                 blurRadius: 10)
//           ]),
//       child: ListTile(
//         title: Text(title),
//         subtitle: Text(subtitle),
//         leading: Icon(iconData),
//         trailing: const Icon(Icons.arrow_forward),
//         tileColor: Colors.white10,
//       ),
//     );
//   }
}