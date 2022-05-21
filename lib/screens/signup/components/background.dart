import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget{
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 80,
          //   right: -210,
          //   child: SvgPicture.asset(""
          //       "assets/images/Spreadsheets-bro.svg",
          //     width: size.width,
          //   ),
          // ),
          Positioned(
            top: 150,
            right: -80,
            child: SvgPicture.asset(
              "assets/images/Savings-bro.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            top: -80,
            left: -60,
            child: SvgPicture.asset(
              "assets/images/Analytics-bro.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            bottom: -25,
            left: -15,
            child: SvgPicture.asset(
              "assets/images/Revenue-pana.svg",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}