import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/custom_widgets/main_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          _getButton(),
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

  _getButton() {
    return Positioned(
      right: 58,
      bottom: 5,
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
    );
  }

  _getSingleBill() {
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/brand1.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bogazici Elektric',
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
                Container(
                  margin: const EdgeInsets.only(right: 9.5),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.selectBackground),
                  child: Center(
                    child: Text(
                      'Select',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColor.selectColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28.5,
                ),
                const Text(
                  '890 TL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.mainColor,
                      fontSize: 17),
                ),
                Text(
                  'Due in 3 days',
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
          itemCount: 3,
          itemBuilder: (_, idx) {
            return _getSingleBill();
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
        ),
      ),
    );
  }
}
