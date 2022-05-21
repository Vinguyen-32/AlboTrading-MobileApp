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
          Positioned(
            top: -100,
            left: -230,
            child: SvgPicture.asset(""
                "assets/images/Analytics-bro.svg",
              width: size.width,
            ),
          ),
          Positioned(
            bottom: -25,
            right: -15,
            child: SvgPicture.asset(
              "assets/images/Savings-bro.svg",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}