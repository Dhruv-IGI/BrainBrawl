import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
//import '../../../routes/app_pages.dart';
import '../../../../app_data.dart';
import '../controllers/login_controller.dart';



class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Row(
          children :[
            Image.asset(
              'assets/images/registration_Image.png',
              fit : BoxFit.fill,
              width: Get.width * 0.4,
            ),
            Container(
              width : Get.width * 0.6,
              color: Colors.white,
              child : Padding(
                padding: EdgeInsets.symmetric(horizontal : 10.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "WELCOME BACK!!!",
                          style : GoogleFonts.spaceMono(
                            fontSize: 3.w,
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                          )
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'\s')),
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/images/suffix_icon.png', height: 20, width: 20,),
                          ),
                          focusedBorder : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),),
                          enabledBorder :OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),),
                          border : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              gapPadding: 10
                          ),
                          hintText: ' UserName',
                          hintStyle: const TextStyle(
                            color: Colors.grey,),),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Username';
                          }
                          // You can add more complex email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) async {
                          username = value!;
                          controller.username = value;
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('username_value',value);
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/images/suffix_icon.png', height: 20, width: 20,),
                          ),
                          focusedBorder : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),),
                          enabledBorder :OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),),
                          border : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              gapPadding: 10
                          ),
                          hintText: ' Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,),),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.password = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 2.h),
                        child: InkWell(
                          onTap: () {
                            controller.submitForm();
                          },
                          child: Container(
                              width: 20.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color : Colors.black,
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(154, 236, 140, 1),
                                      Color.fromARGB(221, 63, 243, 243),
                                      Color.fromARGB(120, 246, 77, 77),
                                      Color.fromARGB(44, 214, 48, 100)
                                    ]),
                                    width: 7,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.spaceMono(
                                    fontSize: 1.8.w,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )


          ]
        ),

        // body: Center(
        //   child: SizedBox(
        //     width: MediaQuery.of(context).size.width < 600 ?  Get.width * 0.9 : Get.width / 2,
        //     child: Form(
        //       key: controller.formKey,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           TextFormField(
        //             style: const TextStyle(
        //               color: Colors.black,
        //             ),
        //             inputFormatters: [
        //               FilteringTextInputFormatter.deny(
        //                   RegExp(r'\s')),
        //             ],
        //             decoration: const InputDecoration(
        //                 hintText: 'Username',
        //                 hintStyle: TextStyle(
        //                     color: Colors.grey,)
        //             ),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter an Username';
        //               }
        //               // You can add more complex email validation logic here if needed
        //               return null;
        //             },
        //             onSaved: (value) async {
        //               username = value!;
        //               controller.username = value;
        //               final prefs = await SharedPreferences.getInstance();
        //               await prefs.setString('username_value',value);
        //             },
        //           ),
        //           const SizedBox(height: 16),
        //           TextFormField(
        //             style: const TextStyle(
        //               color: Colors.black,
        //             ),
        //             decoration: const InputDecoration(
        //                 hintText: 'Password',
        //                 hintStyle: TextStyle(
        //                   color: Colors.grey,)
        //             ),
        //             obscureText: true,
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter a password';
        //               }
        //               return null;
        //             },
        //             onSaved: (value) {
        //               controller.password = value!;
        //             },
        //           ),
        //           const SizedBox(height: 16),
        //           const SizedBox(height: 16),
        //           MaterialButton(
        //             onPressed: () => controller.submitForm(),
        //             child: Container(
        //               width: 150,
        //               padding: const EdgeInsets.all(8),
        //               decoration: BoxDecoration(
        //                   color: Theme.of(context).primaryColorLight,
        //                   borderRadius: BorderRadius.circular(20)),
        //               child: const Center(
        //                 child: Text(
        //                   "Login",
        //                   style: TextStyle(
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
    );
  }
}
