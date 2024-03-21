import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/home/circular_progress_controller/circular_progress_controller.dart';
import 'package:rider/utils/color.dart';
class CustomCircularProgressIndicator extends StatelessWidget {
   final HomeController homeController = Get.put(HomeController());
  final String progress1;
  final String progress2;
  final String progress3;
  final String progress4;
  final String progress5;
  final String progress6;
  final String progress7;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;
  final Color color7;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
   CustomCircularProgressIndicator({
    Key? key,
    required this.progress1,
    required this.progress2,
    required this.progress3,
    required this.progress4,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4, required this.progress5, required this.progress6, required this.progress7, required this.color5, required this.color6, required this.color7, required this.text5, required this.text6, required this.text7,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      // height: 224,
      decoration: BoxDecoration(
        color: RColor.box, // Set the desired color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 27,
            ),
            Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIndicatorWithText(progress1, color1, text1),
                    _buildIndicatorWithText(progress2, color2, text2),
                    _buildIndicatorWithText(progress3, color3, text3),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIndicatorWithText(progress4, color4, text4),
                    _buildIndicatorWithText(progress5, color5, text5),
                  ],
                ),
                                SizedBox(height: 10,),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIndicatorWithText(progress6, color6, text6),
                    _buildIndicatorWithText(progress7, color7, text7),

                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
           Obx(() {
              return homeController.progressIndicator.value == null
                  ? Center(child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2,))
                  : Column(
                      children: homeController
                          .progressIndicator.value!.data!.body!
                          .map((body) {
                        return Column(
                          children: [
                            SizedBox(height: 15,),
                            Center(
                              child: Text(
                                'Total Amount',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'PKR ${body.totalAmount}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: RColor.secondary,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Delivered Amount',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'PKR ${body.deliveredAmount}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: RColor.secondary,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Returned Amount',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'PKR ${body.returnedAmount}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: RColor.secondary,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Pending Amount',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'PKR ${body.pendingAmount}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: RColor.secondary,
                                ),
                              ),
                            ),
                            SizedBox(height: 40,)
                          ],
                        );
                      }).toList(),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorWithText(String progress, Color color, String text) {
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: color,
          ),
        ),
        SizedBox(height: 10),
        _buildCircularProgressIndicator(progress, color),
      ],
    );
  }
  Widget _buildCircularProgressIndicator(String progress, Color color) {
    final double numberprogress = double.tryParse(progress) ?? 0.0;
    return SizedBox(
      // width: screenHeight * 0.1, // Adjusted using media query
      // height: screenHeight * 0.1, // Adjusted using media query
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 74,
            height: 74,
            child: CircularProgressIndicator(
              value: numberprogress / 100,
              backgroundColor: RColor.circle4,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: 5,
            ),
          ),
          Text(
            '$progress',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}