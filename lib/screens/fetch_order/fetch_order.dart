import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/Update_status/update_status.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/fetch_order/fetch_order_controller/fetch_order_controller.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class FetchorderScreen extends StatelessWidget {
  final OrderController _controller = Get.put(OrderController());
  final NavigationController _controller2 = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.accent,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Fetch Orders",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: RColor.secondary,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewD()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                RImage.Menu,
                height: 40,
              ),
            ),
          ),
        ],
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
                        children: _controller.orders.map((order) {
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order No: ${order['shipment_no']}',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: RColor.secondary,
                                        ),
                                      ),
                                      Text(
                                        'Sheet No: ${order['master_no']}',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: RColor.secondary,
                                        ),
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
                                      order['consignee_name'],
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
                                  Text(
                                    order['consignee_address'],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: RColor.secondary,
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
                                      order['consignee_contact'],
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
                                  SizedBox(height: 6),
                                  Center(
                                    child: Text(
                                      order['cash_collect'],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: RColor.secondary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Call Customer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: RColor.secondary,
                                            fontSize: 15,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: RColor.graish,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Updatestatus()));
                                        },
                                        child: Text(
                                          'Updated Status',
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
                                    ],
                                  ),

//New//
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
        onTabSelected: _controller2.changePage,
        selectedIndex: _controller2.selectedIndex.value,
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
