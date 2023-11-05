import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import '../../../../app_data.dart';

Random random = Random();

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(top : 30.0, left : 5.0 , right : 5.0),
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment : CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 400,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              Column(
                                  children :[

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.local_fire_department,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'Profile',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.offAllNamed(Routes.COMPETITION);
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.group,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'Tournaments',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.local_library,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'Learn',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'Watch',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.newspaper,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'News',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.diversity_3,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'Social',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                        },
                                        child: HoverContainer(
                                          hoverDecoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( //                   <--- left side
                                                color: Color(0xFFE86E80),
                                                width: 5.0,
                                              ),
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.more_horiz,
                                                size : 30,
                                              ), // widget
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  'More',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                          children :[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: HoverContainer(
                                  hoverDecoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide( //                   <--- left side
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.light_mode,
                                        size : 20,
                                        color :Colors.grey,
                                      ), // widget
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Text(
                                          'Light UI',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: HoverContainer(
                                  hoverDecoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide( //                   <--- left side
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.close_fullscreen,
                                        size : 20,
                                        color :Colors.grey,
                                      ), // widget
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Text(
                                          'Collapse',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: HoverContainer(
                                  hoverDecoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide( //                   <--- left side
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        size : 20,
                                        color :Colors.grey,
                                      ), // widget
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: HoverContainer(
                                  hoverDecoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide( //                   <--- left side
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.help,
                                        size : 20,
                                        color :Colors.grey,
                                      ), // widget
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Text(
                                          'Help',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                      ),

                    ],
                  ),
                )
              )
          ),
          Expanded(
              flex:5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal : 30.0, vertical : 20),
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children :[
                    Container(
                      height: 200,
                      width : 1000,
                      color : Colors.black,
                      child : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children : [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/participants/3.png',
                                //fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width : 20),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children : [
                                  Obx(() =>Text( controller.current_user.value, style : const TextStyle(color: Colors.white, fontSize : 30))),
                                  const Text("Field of study: Computer Science", style : TextStyle(color: Colors.grey, fontSize : 15)),
                                  const Text("Enter a status here ", style : TextStyle(color: Colors.grey, fontSize : 15)),
                                  const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize : MainAxisSize.max,
                                    children :[
                                      Column(
                                        children :[
                                          Icon(
                                            Icons.show_chart,
                                            size : 20,
                                            color :Colors.grey,
                                          ), // widget
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Text(
                                              'Online now',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                      SizedBox(width : 20),
                                      Column(
                                          children :[
                                            Icon(
                                              Icons.calendar_month,
                                              size : 20,
                                              color :Colors.grey,
                                            ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                '1 Sep 2023',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(width : 20),
                                      Column(
                                          children :[
                                            Icon(
                                              Icons.person_add,
                                              size : 20,
                                              color :Colors.grey,
                                            ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(width : 20),
                                      Column(
                                          children :[
                                            Icon(
                                              Icons.timer,
                                              size : 20,
                                              color :Colors.grey,
                                            ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ]
                                  ),
                                ]
                              ),
                            ),
                          ]
                        ),
                      )
                    ),
                    const SizedBox(
                      height : 30,
                    ),
                    Container(
                      height: 300,
                      width : 1000,
                      color : Colors.black,
                      child : Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 30.0, vertical : 15),
                        child: Column(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(

                                children :[
                                  Icon(
                                    Icons.equalizer,
                                    size : 30,
                                    color :Colors.grey,
                                  ), // widget
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      'Stats',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    size : 30,
                                    color :Colors.grey,
                                  ),
                                ]
                            ),
                            Row(
                                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children :[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                      },
                                      child: HoverContainer(
                                        hoverDecoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide( //                   <--- left side
                                              color: Color(0xFFE86E80),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            // Icon(
                                            //   Icons.light_mode,
                                            //   size : 20,
                                            //   color :Colors.grey,
                                            // ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                'First Semester',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                      },
                                      child: HoverContainer(
                                        hoverDecoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide( //                   <--- left side
                                              color: Color(0xFFE86E80),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            // Icon(
                                            //   Icons.close_fullscreen,
                                            //   size : 20,
                                            //   color :Colors.grey,
                                            // ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                'Second Semester',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                      },
                                      child: HoverContainer(
                                        hoverDecoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide( //                   <--- left side
                                              color: Color(0xFFE86E80),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            // Icon(
                                            //   Icons.settings,
                                            //   size : 20,
                                            //   color :Colors.grey,
                                            // ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                'Third Semester',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                      },
                                      child: HoverContainer(
                                        hoverDecoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide( //                   <--- left side
                                              color: Color(0xFFE86E80),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            // Icon(
                                            //   Icons.help,
                                            //   size : 20,
                                            //   color :Colors.grey,
                                            // ), // widget
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Text(
                                                'All Time',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide( //                   <--- left side
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical : 20.0),
                              child: Row(
                                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                children:[
                                  Column(
                                    children:[
                                      Icon(
                                        Icons.videogame_asset,
                                        size : 80,
                                        color :Colors.grey,
                                      ),
                                      Text("1", style : TextStyle(color: Colors.white, fontSize : 30)),
                                      Text("Tournaments", style : TextStyle(color: Color(0xFFE86E80), fontSize : 30)),
                                    ]
                                  ),
                                  Column(
                                      children:[
                                        Icon(
                                          Icons.extension,
                                          size : 80,
                                          color :Colors.grey,
                                        ),
                                        Text("0", style : TextStyle(color: Colors.white, fontSize : 30)),
                                        Text("Practice", style : TextStyle(color: Color(0xFFE86E80), fontSize : 30)),
                                      ]
                                  ),
                                ]
                              ),
                            ),

                          ]
                        ),
                      ),
                    ),
                  ]
                ),
              ),
          ),
        ]
      ),
    );
  }
}
