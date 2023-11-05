import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:sizer/sizer.dart';
import '../../../../app_data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/competition_controller.dart';

//List<DateTime> competitionDateTime = [];

class CompetitionView extends GetView<CompetitionController> {
  const CompetitionView({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       // appBar: AppBar(
  //       //   leading: IconButton(
  //       //     onPressed: () => Get.offAllNamed(Routes.LOGIN),
  //       //     icon: const Icon(Icons.arrow_back),
  //       //   ),
  //       //   title: const Text('Competitions'),
  //       // ),
  //       body: Row(
  //           children: [
  //             // Expanded(
  //             //     flex: 1,
  //             //     child: Container(
  //             //         color: Colors.black,
  //             //         child: Padding(
  //             //           padding: const EdgeInsets.only(top : 30.0, left : 5.0 , right : 5.0),
  //             //           child: Column(
  //             //             mainAxisAlignment : MainAxisAlignment.spaceBetween,
  //             //             crossAxisAlignment : CrossAxisAlignment.center,
  //             //             children: [
  //             //               Column(
  //             //                 children: [
  //             //                   Padding(
  //             //                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //             //                     child: Image.asset(
  //             //                       'assets/images/logo.png',
  //             //                       width: 300,
  //             //                     ),
  //             //                   ),
  //             //                   const SizedBox(
  //             //                     height: 30,
  //             //                   ),
  //             //                   Column(
  //             //                     crossAxisAlignment : CrossAxisAlignment.start,
  //             //                     children: [
  //             //                       Column(
  //             //                           children :[
  //             //
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                   Get.offAllNamed(Routes.PROFILE);
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.local_fire_department,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'Profile',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.group,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'Tournaments',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.local_library,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'Learn',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.image,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'Watch',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.newspaper,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'News',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.diversity_3,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'Social',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                             const SizedBox(
  //             //                               height: 2,
  //             //                             ),
  //             //                             Padding(
  //             //                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                               child: GestureDetector(
  //             //                                 onTap: () {
  //             //                                 },
  //             //                                 child: HoverContainer(
  //             //                                   hoverDecoration: const BoxDecoration(
  //             //                                     border: Border(
  //             //                                       bottom: BorderSide( //                   <--- left side
  //             //                                         color: Color(0xFFE86E80),
  //             //                                         width: 5.0,
  //             //                                       ),
  //             //                                     ),
  //             //                                   ),
  //             //                                   child: const Row(
  //             //                                     children: [
  //             //                                       Icon(
  //             //                                         Icons.more_horiz,
  //             //                                         size : 30,
  //             //                                       ), // widget
  //             //                                       Padding(
  //             //                                         padding: EdgeInsets.all(3.0),
  //             //                                         child: Text(
  //             //                                           'More',
  //             //                                           style: TextStyle(
  //             //                                             color: Colors.white,
  //             //                                             fontSize: 30,
  //             //                                           ),
  //             //                                         ),
  //             //                                       ),
  //             //                                     ],
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ),
  //             //                           ]
  //             //                       ),
  //             //                     ],
  //             //                   ),
  //             //                 ],
  //             //               ),
  //             //               Column(
  //             //                   children :[
  //             //                     Padding(
  //             //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                       child: GestureDetector(
  //             //                         onTap: () {
  //             //                         },
  //             //                         child: HoverContainer(
  //             //                           hoverDecoration: const BoxDecoration(
  //             //                             border: Border(
  //             //                               bottom: BorderSide( //                   <--- left side
  //             //                                 color: Colors.grey,
  //             //                                 width: 2.0,
  //             //                               ),
  //             //                             ),
  //             //                           ),
  //             //                           child: const Row(
  //             //                             children: [
  //             //                               Icon(
  //             //                                 Icons.light_mode,
  //             //                                 size : 20,
  //             //                                 color :Colors.grey,
  //             //                               ), // widget
  //             //                               Padding(
  //             //                                 padding: EdgeInsets.all(3.0),
  //             //                                 child: Text(
  //             //                                   'Light UI',
  //             //                                   style: TextStyle(
  //             //                                     color: Colors.grey,
  //             //                                     fontSize: 20,
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ],
  //             //                           ),
  //             //                         ),
  //             //                       ),
  //             //                     ),
  //             //                     const SizedBox(
  //             //                       height: 2,
  //             //                     ),
  //             //                     Padding(
  //             //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                       child: GestureDetector(
  //             //                         onTap: () {
  //             //                         },
  //             //                         child: HoverContainer(
  //             //                           hoverDecoration: const BoxDecoration(
  //             //                             border: Border(
  //             //                               bottom: BorderSide( //                   <--- left side
  //             //                                 color: Colors.grey,
  //             //                                 width: 2.0,
  //             //                               ),
  //             //                             ),
  //             //                           ),
  //             //                           child: const Row(
  //             //                             children: [
  //             //                               Icon(
  //             //                                 Icons.close_fullscreen,
  //             //                                 size : 20,
  //             //                                 color :Colors.grey,
  //             //                               ), // widget
  //             //                               Padding(
  //             //                                 padding: EdgeInsets.all(3.0),
  //             //                                 child: Text(
  //             //                                   'Collapse',
  //             //                                   style: TextStyle(
  //             //                                     color: Colors.grey,
  //             //                                     fontSize: 20,
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ],
  //             //                           ),
  //             //                         ),
  //             //                       ),
  //             //                     ),
  //             //                     const SizedBox(
  //             //                       height: 2,
  //             //                     ),
  //             //                     Padding(
  //             //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                       child: GestureDetector(
  //             //                         onTap: () {
  //             //                         },
  //             //                         child: HoverContainer(
  //             //                           hoverDecoration: const BoxDecoration(
  //             //                             border: Border(
  //             //                               bottom: BorderSide( //                   <--- left side
  //             //                                 color: Colors.grey,
  //             //                                 width: 2.0,
  //             //                               ),
  //             //                             ),
  //             //                           ),
  //             //                           child: const Row(
  //             //                             children: [
  //             //                               Icon(
  //             //                                 Icons.settings,
  //             //                                 size : 20,
  //             //                                 color :Colors.grey,
  //             //                               ), // widget
  //             //                               Padding(
  //             //                                 padding: EdgeInsets.all(3.0),
  //             //                                 child: Text(
  //             //                                   'Settings',
  //             //                                   style: TextStyle(
  //             //                                     color: Colors.grey,
  //             //                                     fontSize: 20,
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ],
  //             //                           ),
  //             //                         ),
  //             //                       ),
  //             //                     ),
  //             //                     const SizedBox(
  //             //                       height: 2,
  //             //                     ),
  //             //                     Padding(
  //             //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             //                       child: GestureDetector(
  //             //                         onTap: () {
  //             //                         },
  //             //                         child: HoverContainer(
  //             //                           hoverDecoration: const BoxDecoration(
  //             //                             border: Border(
  //             //                               bottom: BorderSide( //                   <--- left side
  //             //                                 color: Colors.grey,
  //             //                                 width: 2.0,
  //             //                               ),
  //             //                             ),
  //             //                           ),
  //             //                           child: const Row(
  //             //                             children: [
  //             //                               Icon(
  //             //                                 Icons.help,
  //             //                                 size : 20,
  //             //                                 color :Colors.grey,
  //             //                               ), // widget
  //             //                               Padding(
  //             //                                 padding: EdgeInsets.all(3.0),
  //             //                                 child: Text(
  //             //                                   'Help',
  //             //                                   style: TextStyle(
  //             //                                     color: Colors.grey,
  //             //                                     fontSize: 20,
  //             //                                   ),
  //             //                                 ),
  //             //                               ),
  //             //                             ],
  //             //                           ),
  //             //                         ),
  //             //                       ),
  //             //                     ),
  //             //                     const SizedBox(
  //             //                       height: 10,
  //             //                     ),
  //             //                   ]
  //             //               ),
  //             //
  //             //             ],
  //             //           ),
  //             //         )
  //             //     )
  //             // ),
  //             // Expanded(
  //             //   flex: 5,
  //             //   child:
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal : 30.0, vertical : 20),
  //                 child: Obx(
  //                       () => controller.isLoading.isFalse
  //                       ? Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                     child: SingleChildScrollView(
  //                       physics: const ScrollPhysics(),
  //                       child: Column(
  //                         children: [
  //                           FutureBuilder(
  //                               future: controller.getCompetitionData(),
  //                               builder: (context, snapshot) {
  //                                 return ListView.builder(
  //                                     padding: const EdgeInsets.symmetric(
  //                                         horizontal: 100),
  //                                     shrinkWrap: true,
  //                                     physics: const ScrollPhysics(),
  //                                     itemCount: controller.competitions.length,
  //                                     itemBuilder: (context, index) {
  //                                       // competitionDateTime[index] =
  //                                       //   controller.competitions[index].time! as DateTime;
  //                                       return Card(
  //                                         color: Colors.white,
  //                                         child: SizedBox(
  //                                           height: 150,
  //                                           child: Column(
  //                                             mainAxisAlignment:
  //                                             MainAxisAlignment.center,
  //                                             children: [
  //                                               Text(
  //                                                   controller.competitions[index]
  //                                                       .competition
  //                                                       .toString(),
  //                                                   style: const TextStyle(
  //                                                       fontSize: 30,
  //                                                       fontWeight:
  //                                                       FontWeight.bold)),
  //                                               const SizedBox(
  //                                                 height: 20,
  //                                               ),
  //                                               Row(
  //                                                 crossAxisAlignment:
  //                                                 CrossAxisAlignment.center,
  //                                                 mainAxisAlignment:
  //                                                 MainAxisAlignment.center,
  //                                                 children: [
  //                                                   const Text(
  //                                                     "Competition will start at : ",
  //                                                     style: TextStyle(
  //                                                         fontSize: 20,
  //                                                         fontWeight:
  //                                                         FontWeight.bold),
  //                                                   ),
  //
  //                                                   Text(
  //                                                     controller.competitions[index].time
  //                                                         .toString(),
  //                                                     style: const TextStyle(
  //                                                         fontSize: 20,
  //                                                         fontWeight:
  //                                                         FontWeight.bold),
  //                                                   ),
  //                                                 ],
  //                                               ),
  //                                               const SizedBox(
  //                                                 height: 20,
  //                                               ),
  //                                               ElevatedButton(
  //                                                 onPressed: () async {
  //                                                   if(DateTime.parse(controller.competitions[index].time!).isAfter(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes: controller.competitions[index].roomTime!)).isBefore(DateTime.now()))){
  //                                                     Get.showSnackbar(const GetSnackBar(
  //                                                       message: "Competition not started yet",
  //                                                       duration: Duration(seconds: 2),
  //                                                     ));
  //                                                     return;
  //                                                   }
  //                                                   else if(DateTime.parse(controller.competitions[index].time!).isBefore(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now()))) {
  //                                                     await controller.registerParticipant( controller.competitions[index].competitionId!) ;
  //                                                     controller.competitionTime(DateTime.parse(controller.competitions[index].time!) , controller.competitions[index].roomTime! );
  //                                                     Get.toNamed(Routes.DASHBOARD, arguments: controller.competitions[index].roomTime);
  //                                                     controller.onClose();
  //                                                     return;
  //                                                   }
  //                                                   else if(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now())){
  //                                                     Get.showSnackbar(const GetSnackBar(
  //                                                       message: "Competition has begun....",
  //                                                       duration: Duration(seconds: 2),
  //                                                     ));
  //                                                     return;
  //                                                   }
  //                                                 },
  //                                                 style: ElevatedButton
  //                                                     .styleFrom(
  //                                                     backgroundColor:
  //                                                     Colors.green),
  //                                                 child: const Padding(
  //                                                   padding: EdgeInsets.all(
  //                                                       10.0),
  //                                                   child: Text("Join"),
  //                                                 ),
  //                                               )
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       );
  //                                     });
  //                               })
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                       : const Center(
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         CircularProgressIndicator(),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         Text(
  //                           "Loading Competitions",
  //                           style: TextStyle(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             // ),
  //           ]
  //       ),);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.offAllNamed(Routes.LOGIN),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Competitions'),
        ),
        body: Obx(
              () => controller.isLoading.isFalse
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  MediaQuery.of(context).size.width < 600 ?
                  FutureBuilder(
                      future: controller.getCompetitionData(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w),
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.competitions.length,
                            itemBuilder: (context, index) {
                              // competitionDateTime[index] =
                              //   controller.competitions[index].time! as DateTime;
                              competitionName = controller.competitions[index].competition.toString();
                             // print(competitionName);
                              return Card(
                                color: Colors.white,
                                child: SizedBox(
                                 // height: 150,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical : 1.w),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            controller.competitions[index]
                                                .competition
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 6.w,
                                                fontWeight:
                                                FontWeight.bold)),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                             Text(
                                              "Competition will start at : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 4.w,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),

                                            Text(
                                              controller.competitions[index].time
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 4.w,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if(DateTime.parse(controller.competitions[index].time!).isAfter(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes: controller.competitions[index].roomTime!)).isBefore(DateTime.now()))){
                                              Get.showSnackbar(const GetSnackBar(
                                                message: "Competition not started yet",
                                                duration: Duration(seconds: 2),
                                              ));
                                              return;
                                            }
                                            else if(DateTime.parse(controller.competitions[index].time!).isBefore(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now()))) {
                                              await controller.registerParticipant( controller.competitions[index].competitionId!) ;
                                              controller.competitionTime(DateTime.parse(controller.competitions[index].time!) , controller.competitions[index].roomTime! );
                                              Get.toNamed(Routes.DASHBOARD, arguments: controller.competitions[index].roomTime);
                                              controller.onClose();
                                              return;
                                            }
                                            else if(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now())){
                                              Get.showSnackbar(const GetSnackBar(
                                                message: "Competition has begun....",
                                                duration: Duration(seconds: 2),
                                              ));
                                              return;
                                            }
                                          },
                                          style: ElevatedButton
                                              .styleFrom(
                                              backgroundColor:
                                              Colors.green),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                10.0),
                                            child: Text("Join" , style: TextStyle(fontSize: 4.w),),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      })
                      :
                  FutureBuilder(
                      future: controller.getCompetitionData(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w),
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.competitions.length,
                            itemBuilder: (context, index) {
                              // competitionDateTime[index] =
                              //   controller.competitions[index].time! as DateTime;
                              competitionName = controller.competitions[index].competition.toString();
                              print(competitionName);
                              return Card(
                                color: Colors.white,
                                child: SizedBox(
                                  //height: 150,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical : 2.h),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            controller.competitions[index]
                                                .competition
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 4.w,
                                                fontWeight:
                                                FontWeight.bold)),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Competition will start at : ",
                                              style: TextStyle(
                                                  fontSize: 2.w,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),

                                            Text(
                                              controller.competitions[index].time
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 2.w,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if(DateTime.parse(controller.competitions[index].time!).isAfter(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes: controller.competitions[index].roomTime!)).isBefore(DateTime.now()))){
                                              Get.showSnackbar(const GetSnackBar(
                                                message: "Competition not started yet",
                                                duration: Duration(seconds: 2),
                                              ));
                                              return;
                                            }
                                            else if(DateTime.parse(controller.competitions[index].time!).isBefore(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now()))) {
                                              await controller.registerParticipant( controller.competitions[index].competitionId!) ;
                                              controller.competitionTime(DateTime.parse(controller.competitions[index].time!) , controller.competitions[index].roomTime! );
                                              Get.toNamed(Routes.DASHBOARD, arguments: controller.competitions[index].roomTime);
                                              controller.onClose();
                                              return;
                                            }
                                            else if(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now())){
                                              Get.showSnackbar(const GetSnackBar(
                                                message: "Competition has begun....",
                                                duration: Duration(seconds: 2),
                                              ));
                                              return;
                                            }
                                          },
                                          style: ElevatedButton
                                              .styleFrom(
                                              backgroundColor:
                                              Colors.green),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                10.0),
                                            child: Text("Join" , style: TextStyle(fontSize: 2.w),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      })
                ],
              ),
            ),
          )
              : const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading Competitions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }



}
