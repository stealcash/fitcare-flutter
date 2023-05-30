import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Option1';
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Good Morning',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Fitness App',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: const badges.Badge(
                              badgeContent: Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                              child: Icon(Icons.notification_add),
                            )),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.green),
                  iconSize: 24,
                  hint: const Text('Choose one option '),
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: ['Option1', 'Option2', 'Option3'].map((String value) {
                    return DropdownMenuItem(child: Text(value), value: value);
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'selct location ',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('serach anything '),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff529A69),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Search Result',
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              Text(
                                'see All',
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        PostBox(postname: 'first post'),
                        PostBox(postname: 'Second post'),
                        PostBox(postname: 'Third post'),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline), label: 'Job Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ]),
    );
  }
}

class PostBox extends StatelessWidget {
  String? postname;
  PostBox({
    Key? key,
    this.postname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/travel-world.jpeg',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        Text(
                          postname!,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(children: [
                            Text('this is post'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('this is description ')
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Category'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFEAE6),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Painter',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Pay per day'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xffD3F8E7),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        '\$24.00',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(''),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 7),
                      decoration: BoxDecoration(
                          color: const Color(0xff529A69),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Apply now',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
