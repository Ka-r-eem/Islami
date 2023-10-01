import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  int tasbeehNum = 0;
  double RotateAngle = 0;
  bool reset = false;

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int index = 0;

  List<String> Doaa = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
    "لا اله الا الله"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: const Image(
                        image: AssetImage("assets/images/head_sebha_logo.png"))),
                Container(
                    margin: const EdgeInsets.only(top: 75),
                    child: Transform.rotate(
                      angle: widget.RotateAngle,
                      child: const Image(
                          image: AssetImage("assets/images/body_sebha_logo.png")),
                    )),
              ],
            ),
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFBEA584)),
            width: 70,
            height: 80,
            child: Center(
                child: Text(
              "${widget.tasbeehNum}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: ElevatedButton(
                onPressed: () {
                  widget.reset = true;
                  if (index > 4) {
                    index = 0;
                  } else {
                    widget.tasbeehNum++;
                    DoaaChange(widget.tasbeehNum);
                    widget.RotateAngle += 2;
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB7935F),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text(
                  Doaa[index],
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                )),
          ),
          Visibility(
            visible: widget.reset ,
            child: ElevatedButton(
                onPressed: () {
                  widget.tasbeehNum = 0;
                  index = 0;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB7935F),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "RESET",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  void DoaaChange(num) {
    if (num % 33 == 0) {
      index++;
    }
  }
}
