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
            top: -40,
            left: -120,
            child: SvgPicture.asset(""
              "assets/images/Payment Information-bro.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            bottom: -95,
            right: -50,
            child: SvgPicture.asset(
              "assets/images/Analytics-bro.svg",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}