import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;
  bool isVisitStory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i in [
              'https://imgs.search.brave.com/gbc2ofJ-b2DbZBvCLUSHDMav4kxuD24vW_HQiBTOg48/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9ocmx0eDEy/cGw4aHEvNXNqWUQy/djJXY2lTS3FlbUh5/RTRyMC9jMGJhNWEx/ODkxMTYzZGM4YmJj/NzM1NjExMWNhODM4/Yy9FYXN0ZXJfVGh1/bWJuYWlsLmpwZw',
              'https://imgs.search.brave.com/NMeCZ50x3oy7Q0oHdGGjHLXVq97lc0HUcWHCHZKB1A0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9idXJz/dC5zaG9waWZ5Y2Ru/LmNvbS9waG90b3Mv/cmVkLWZvaWxlZC1o/ZWFydHMtb24tYS1w/aW5rLWJhY2tncm91/bmQuanBnP3dpZHRo/PTEwMDAmZm9ybWF0/PXBqcGcmZXhpZj0w/JmlwdGM9MA',
              'https://imgs.search.brave.com/Z0h2iIZtS-LEGAH6cjKhuePzFJoVXk4VMVd995losgc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9idXJz/dC5zaG9waWZ5Y2Ru/LmNvbS9waG90b3Mv/cGVyc29uLXdyaXRp/bmctaW4tbm90ZWJv/b2stYmVzaWRlLWxh/cHRvcC13b3JraW5n/LWZyb20tYmVkLmpw/Zz93aWR0aD0xMDAw/JmZvcm1hdD1wanBn/JmV4aWY9MCZpcHRj/PTA',
              'https://imgs.search.brave.com/NbITOffqy7rRYIZjY8xSzn-O2mF32p972xlQUoJLDkI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9idXJz/dC5zaG9waWZ5Y2Ru/LmNvbS9waG90b3Mv/bGVuc2JhbGwteWVs/bG93LWFuZC1vcmFu/Z2UtbGlnaHRzLmpw/Zz93aWR0aD0xMDAw/JmZvcm1hdD1wanBn/JmV4aWY9MCZpcHRj/PTA',
            ])
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isVisitStory = !isVisitStory;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(i.toString()))),
                        height: 120,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: isVisitStory == true
                                      ? Colors.grey
                                      : Colors.blue,
                                  width: 3),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?s=612x612&w=0&k=20&c=kPvoBm6qCYzQXMAn9JUtqLREXe9-PlZyMl9i-ibaVuY='),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
