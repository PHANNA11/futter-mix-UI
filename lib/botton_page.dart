import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';

class FlutterBottonPage extends StatefulWidget {
  const FlutterBottonPage({super.key});

  @override
  State<FlutterBottonPage> createState() => _FlutterBottonPageState();
}

class _FlutterBottonPageState extends State<FlutterBottonPage> {
  int selectIndex = 0;
  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  List<Widget> pageList = [ChatScreen(), HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pageList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Botton Widget'),
          // bottom: const TabBar(tabs: [
          //   Tab(
          //     icon: Icon(Icons.settings),
          //   ),
          //   Tab(
          //     icon: Icon(Icons.favorite),
          //   ),
          //   Tab(
          //     icon: Icon(Icons.access_alarm_outlined),
          //   )
          // ]),
        ),
        body: Center(child: pageList[selectIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_sharp), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          currentIndex: selectIndex,
          onTap: changeIndex,
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.chat,
          size: 80,
        ),
        Text('Find your Friends')
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> images = [
    'https://burst.shopifycdn.com/photos/a-drop-of-pink-and-yellow-paint-in-water.jpg?width=1000&format=pjpg&exif=0&iptc=0',
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA=',
    'https://burst.shopifycdn.com/photos/red-foiled-hearts-on-a-pink-background.jpg?width=1000&format=pjpg&exif=0&iptc=0',
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      autoPlayInterval: 3000,
      isLoop: true,
      children: List.generate(
        images.length,
        (index) => Image(
          image: NetworkImage(images[index]),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imagFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 140,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  openCamera();
                                },
                                title: const Text('Camera'),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  openGallary();
                                },
                                title: const Text('Gallary'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        const Text('Sign in your Account'),
        if (imagFile != null)
          Image(height: 200, image: FileImage(File(imagFile!.path)))
      ],
    );
  }

  void openGallary() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagFile = File(getImage!.path);
    });
  }

  void openCamera() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imagFile = File(getImage!.path);
    });
  }
}
