import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/Update_status/undelevired_controller.dart/undelevired_controller.dart';
import 'package:rider/screens/all_widgets/circle_progressindicator.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/circular_progress_controller/circular_progress_controller.dart';
import 'package:rider/screens/home/circular_progress_modal/circular_progress_modal.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/screens/home/select_date_widget.dart';
import 'package:rider/screens/reattempt/controller/controller.dart';
import 'package:rider/screens/reattempt/reattempt.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  final NavigationController _controller = Get.put(NavigationController());
    final ReattemptController reattemptController = Get.put(ReattemptController());
  final UndeleviredController undeleviredController = Get.put(UndeleviredController());
  final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
      reattemptController.fetchData();
      undeleviredController.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              RImage.Vector,
              height: 40,
            ),
            SizedBox(width: 10),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(NewD());
              },
              child: Image.asset(
                RImage.Menu,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 35),
                child: Image.asset(
                  RImage.Banner,
                  height: 160,
                  width: 350,
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<NavigationController>(
                builder: (controller) => Container(
                  width: 350,
                  height: 60,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        controller.isOffRoute.toggle();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isOffRoute.isTrue
                            ? RColor.pink
                            : RColor.graish,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Obx(
                          () => Text(
                            controller.isOffRoute.isTrue
                                ? 'On Route'
                                : 'OFF Route',
                            style: controller.isOffRoute.isTrue
                                ? GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  )
                                : GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: RColor.secondary,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Shipment Status',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: RColor.secondary,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SelectDateModal();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RColor.graish,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: RColor.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Obx(() {
                return homeController.progressIndicator.value == null
                    ? Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CustomCircularProgressIndicator(
                            progress1: "",
                            progress2: "",
                            progress3: "",
                            progress4: '',
                            progress5: '',
                            progress6: '',
                            progress7: '',
                            color1: Colors.red,
                            color2: RColor.circle2,
                            color3: Colors.blue,
                            text1: '',
                            text2: '',
                            text3: '',
                            text4: '',
                            text5: '',
                            text6: '',
                            text7: '',
                            color4: Colors.purple,
                            color5: RColor.circle2,
                            color6: Colors.yellow,
                            color7: Colors.orange,
                          ),
                        ),
                      )
                    : Column(
                        children: homeController
                            .progressIndicator.value!.data!.body!
                            .map((body) {
                          return CustomCircularProgressIndicator(
                            progress1: "25",
                            progress2: "10",
                            progress3: "32",
                            progress4: '${body.totalCn}',
                            progress5: '${body.deliveredCn}',
                            progress6: '${body.returnedCn}',
                            progress7: '${body.pendingCn}',
                            color1: Colors.purple,
                            color2: RColor.circle2,
                            color3: RColor.circle2,
                            color4: Colors.orange,
                            color5: Colors.yellow,
                            color6: Colors.yellow,
                            color7: Colors.yellow,
                            text1: 'Remaining',
                            text2: 'Deleviered',
                            text3: 'Other',
                            text4: 'Total cn',
                            text5: 'Delivered cn',
                            text6: 'Returned cn',
                            text7: 'Pending cn',
                          );
                        }).toList(),
                      );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        onTabSelected: _controller.changePage,
        selectedIndex: _controller.selectedIndex.value,
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(100.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRScreen()));
            },
            child: Image.asset(
              RImage.QR,
              cacheHeight: 70,
              cacheWidth: 70,
            ),
            shape: CircleBorder(),
            backgroundColor: RColor.pink,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


