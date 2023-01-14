import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/controllers/data_controller.dart';
import 'package:payment_app/custom_widgets/circular_button.dart';
import 'package:payment_app/custom_widgets/main_button.dart';
import 'package:payment_app/screens/receipt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: screenHeight,
        child: Stack(
          children: [
            _setUpperSection(),
            _setBills(),
            _getMainButton(),
          ],
        ),
      ),
    );
  }

  _setUpperSection() {
    return Container(
      height: 310,
      color: Colors.black26,
      child: Stack(
        children: [
          _getBackground(),
          _getCurve(),
          _getListButton(),
          _showMainText(),
        ],
      ),
    );
  }

  _getBackground() {
    return Positioned(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.png'),
          ),
        ),
      ),
    );
  }

  _getCurve() {
    return Positioned(
      right: 0,
      bottom: 0,
      left: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/curve.png'),
          ),
        ),
      ),
    );
  }

  _showList() {
    return showModalBottomSheet<dynamic>(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height - 240,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 310,
                    color: AppColor.backGroundColor.withOpacity(0.5),
                  ),
                ),
                Positioned(
                    right: 58,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      width: 60,
                      height: 260,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 4, color: Colors.white)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularButton(
                            iconColor: AppColor.mainColor,
                            backgroundColor: AppColor.backGroundColor,
                            icon: Icons.close,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          CircularButton(
                            iconColor: AppColor.mainColor,
                            backgroundColor: AppColor.backGroundColor,
                            icon: Icons.history,
                            onTap: () {},
                            text: "History",
                          ),
                          CircularButton(
                            iconColor: AppColor.mainColor,
                            backgroundColor: AppColor.backGroundColor,
                            icon: Icons.add,
                            onTap: () {},
                            text: 'Add Bill',
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
  }

  _getListButton() {
    return Positioned(
      right: 58,
      bottom: 5,
      child: GestureDetector(
        onTap: _showList,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/lines.png'),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(0, 1),
                  color: Colors.blueGrey,
                )
              ]),
        ),
      ),
    );
  }

  _getSingleBill(
    int index,
  ) {
    return Container(
      padding: const EdgeInsets.only(right: 14),
      margin: const EdgeInsets.only(top: 20, bottom: 10, right: 20),
      height: 120,
      width: MediaQuery.of(context).size.width - 20,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              blurRadius: 6,
              spreadRadius: 7)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(width: 3, color: Colors.orange),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(_controller.list[index]["img"]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller.list[index]["brand"],
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ID: 12883910',
                          style: TextStyle(
                              color: AppColor.idColor,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  children: const [
                    Text(
                      'Auto pay on 24th May 2022',
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() => _controller.list[index]["isSelected"] =
                        !_controller.list[index]["isSelected"]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 9.5),
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: _controller.list[index]["isSelected"] == true
                            ? Colors.green
                            : AppColor.backGroundColor),
                    child: Center(
                      child: Text(
                        'Select',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _controller.list[index]["isSelected"] == true
                                ? Colors.white
                                : AppColor.selectColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28.5,
                ),
                Text(
                  _controller.list[index]["price"] + ' \TL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.mainColor,
                      fontSize: 17),
                ),
                Text(
                  _controller.list[index]["message"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.selectColor,
                      fontSize: 13),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _setBills() {
    return Positioned(
      top: 330,
      right: 0,
      left: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (_, idx) {
            return _getSingleBill(idx);
          },
        ),
      ),
    );
  }

  _getMainButton() {
    return Positioned(
      bottom: 40,
      child: Container(
        margin: const EdgeInsets.only(left: 127, right: 127),
        child: MainButton(
          text: 'Pay all bills',
          backgroundColor: AppColor.mainColor,
          textColor: Colors.white,
          onTap: () {
            Get.to(() => const ReceiptScreen());
          },
        ),
      ),
    );
  }

  _showMainText() {
    return const Positioned(
      left: 40,
      top: 70,
      child: Text(
        'Bills',
        style: TextStyle(
            fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
