import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/custom_widgets/main_button.dart';
import 'package:payment_app/screens/home.dart';

import '../custom_widgets/circular_button.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/paymentbackground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              height: height * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/success.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Text(
              'Paid successfully',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ), //paid success
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 160,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, idx) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 0, left: 20),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    'ID: 1288963',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.idColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Bogazici Elektrik',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '890 TL',
                                    style: TextStyle(
                                        height: 4,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              children: [
                Text(
                  'Total amount',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.idColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '1780 TL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppColor.mainColor),
                ),
                SizedBox(
                  height: height * 0.19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularButton(
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      icon: Icons.share,
                      text: "Share",
                      textColor: AppColor.mainColor,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    CircularButton(
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      icon: Icons.print,
                      onTap: () {},
                      text: "Print",
                      textColor: AppColor.mainColor,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                MainButton(
                  text: 'Done',
                  textColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  onTap: () {
                    Get.to(() => const HomeScreen());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
