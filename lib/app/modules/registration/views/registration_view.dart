import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () => Get.offAllNamed(Routes.HOME),
        //     icon: const Icon(Icons.arrow_back),
        //   ),
        //   title: const Text('Registration'),
        // ),
        body: MediaQuery.of(context).size.width > 600
            ?
            Row(
              children :[
                 Container(
                   width : Get.width * 0.6,
                   color: Colors.white,
                   child: Padding(
                     padding: EdgeInsets.symmetric(horizontal : 5.w),
                     child: Form(
                       key: controller.formKey1,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children :[
                          Text(
                            "WELCOME !!!",
                            style : GoogleFonts.spaceMono(
                              fontSize: 3.w,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            )
                          ),
                          SizedBox(
                            height: 2.h
                          ),
                          TextFormField(
                            style: TextStyle(
                              height: 2,
                              color: Colors.black54,
                              fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                              hintStyle: TextStyle(
                                color: Colors.grey,),),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.isLoading.value = false;
                                return 'Please enter a user name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.userName = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                              height: 2,
                              color: Colors.black54,
                              fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                              hintText: ' Email',
                              hintStyle: TextStyle(
                                color: Colors.grey,),),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.isLoading.value = false;
                                return 'Please enter a user name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.email = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                              height: 2,
                              color: Colors.black54,
                              fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                              hintText: ' Password',
                              hintStyle: TextStyle(
                                color: Colors.grey,),),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.isLoading.value = false;
                                return 'Please enter unique password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.password = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                              height: 2,
                              color: Colors.black54,
                              fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                              hintText: ' Confirm Password',
                              hintStyle: TextStyle(
                                color: Colors.grey,),),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.isLoading.value = false;
                                return 'Please enter your password again';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // controller.userName = value!;
                            },
                          ),
                          SizedBox(
                            height : 5.h
                          ),
                          Obx(
                                () => !controller.isLoading.value
                                ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 2.h),
                                  child: InkWell(
                                    onTap: () {
                                      controller.callRegApi();
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
                                            "Register",
                                            style: GoogleFonts.spaceMono(
                                              fontSize: 1.8.w,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                                : const SizedBox(
                              height: 30,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        ]
                ),
                     ),
                   ),
                 ),
                Image.asset(
                  'assets/images/registration_Image.png',
                  fit : BoxFit.fill,
                  width: Get.width * 0.4,
                ),
              ]
            )
            :
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Center(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width < 600 ? Get.width * 0.9 : Get.width / 2,
            child: Form(
              key: controller.formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    style: TextStyle(
                      height: 2,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                      border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        gapPadding: 10
                      ),
                      hintText: ' UserName',
                      hintStyle: TextStyle(
                        color: Colors.grey,),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
                        return 'Please enter a user name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.userName = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      height: 2,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                      border : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          gapPadding: 10
                      ),
                      hintText: ' Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.email = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      height: 2,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
                        return 'Please enter unique password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.password = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      height: 2,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.spaceMono().fontFamily,
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
                      border : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          gapPadding: 10
                      ),
                      hintText: ' Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
                        return 'Please enter your password again';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // controller.userName = value!;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
