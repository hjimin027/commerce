import 'package:commerce/asset_path.dart';
import 'package:commerce/model/product_model.dart';
import 'package:commerce/screen/home/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    AssetPath.cloth1,
    AssetPath.cloth2,
    AssetPath.cloth3,
    AssetPath.cloth4,
  ];

  int currentIndex = 0;
  List<ProductModel> newProductList = [
    ProductModel(AssetPath.productJacketJean, "청자켓", 50000, 31, 4.8, false),
    ProductModel(AssetPath.productBag, "가방", 46000, 14, 3.5, false),
    ProductModel(AssetPath.productShoes, "신발", 30000, 213, 1.0, false),
    ProductModel(AssetPath.productManJacket, "남성 자켓", 80000, 42, 3.5, false),
    ProductModel(AssetPath.productWomen, "여성 옷", 32000, 4, 5.0, false)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              children: [
                ...List.generate(imageList.length, (index) {
                  return Image.asset(imageList[index], fit: BoxFit.cover);
                }),
              ],
            ),
          ), //좌우로 스크롤할 수 있는 위젯
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageList.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: currentIndex == index ? 20 : 10, //현재 선택된 인덱스는 20, 나머지는 10
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == index ? Colors.grey : Colors.grey.shade300
                ),
              );
            }),
          ),
          SizedBox(height: 24,),
          HomeWidgets.shortcut(iconList: [
            AssetPath.jacket,
            AssetPath.jumper,
            AssetPath.necklace,
            AssetPath.bag,
            AssetPath.cap,
            AssetPath.skirt,
            AssetPath.trousers,
            AssetPath.shirt,
          ]),
          
          SizedBox(height: 24,),
          HomeWidgets.subTitle("신제품"),
          HomeWidgets.productHorizontal(newProductList),

          SizedBox(height: 24,),
          HomeWidgets.subTitle("이벤트"),
          SizedBox( //사진 크기를 단순히 설정하지 말고, container 사용!(html의 div 느낌)
            height: 200, width: double.infinity,
            child: Image.asset(
              AssetPath.event,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
