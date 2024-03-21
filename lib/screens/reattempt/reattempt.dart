import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/Update_status/update_status.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/fetch_order/fetch_order_controller/fetch_order_controller.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/screens/reattempt/controller/controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
class Reattempt extends StatelessWidget {
  final ReattemptController reattemptController =
      Get.put(ReattemptController());
  final OrderController _controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.accent,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Reattempt",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: RColor.secondary,
                )),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewD()),
                );
              },
              child: Image.asset(
                RImage.Menu,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          return RefreshIndicator(
            onRefresh: _controller.fetchData,
            child: _controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 12),
                      child: Column(
                        children: reattemptController.bodyList.map((body)  {
                          return Card(
                            surfaceTintColor: RColor.grayinput,
                            color: RColor.grayinput,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Order No: ${body.shipmentNo}',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: RColor.secondary,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Sheet No: ${body.deliverySheet}',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: RColor.secondary,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    'Consignee Name',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Center(
                                  child: Text(
                                    '${body.consigneeName}',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    'Consignee Address',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Center(
                                  child: Text(
                                    '${body.consigneeAddress}',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Karachi',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    'Delivery Sheet',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Center(
                                  child: Text(
                                    '${body.deliverySheet}',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    'COD Amount',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: RColor.secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width < 600
                                            ? 155
                                            : 200,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Reattempt',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: RColor.pink,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

//new//
                              ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        onTabSelected: Get.find<NavigationController>().changePage,
        selectedIndex: Get.find<NavigationController>().selectedIndex.value,
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
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
