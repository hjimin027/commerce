import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidgets {
  static Widget shortcut({required List<String> iconList}) {
    return GridView.count(crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(iconList.length, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {

            },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  maximumSize: Size(70, 70),
                  padding: EdgeInsets.all(16),
                  elevation: 0,
                  backgroundColor: Colors.yellow, //기본 배경색
                  foregroundColor: Colors.purple  //클릭했을 때 색
                ),
                child: Image.asset(iconList[index], fit: BoxFit.cover,)),
          ],
        );
      },),
    );
  }
}