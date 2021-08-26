import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:myapi/Models/catalog.dart';

import 'package:myapi/utils/routes.dart';
// import 'package:my_app/utils/them.dart';
// import 'package:my_app/widgets/Home_widgets/Catalog_Header.dart';
// import 'package:my_app/widgets/Home_widgets/Catalog_List.dart';

import 'dart:convert';
import "package:velocity_x/velocity_x.dart";

//to UI

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2)); // 2 sc dely displying loding
    var CatlogJson = await rootBundle.loadString("assets/Files/Catalog.json");
    var decodedData = jsonDecode(CatlogJson);
    print(CatlogJson);
    var productdata = decodedData["products"];

    // List<Item> list =
    //     List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    CaltelogModels.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    print(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // backgroundColor: Color:,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.CarRoute),
          // backgroundColor: Mythemes.darkbluishcolor,
          // backgroundColor: context.theme.backgroundColor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              children: [
                //  Vx.hexToColor(code),
                CatalogHeader(),
                //

                // if (CaltelogModels.items != null &&
                //     CaltelogModels.items.isNotEmpty)
                //   CatalogList().expand(),

                //refre to expand use

                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ));
  }
}

// catalog header
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Vx.hexToColor(code)
        // "APP".text.xl5.bold.color(Mythemes.darkbluishcolor).make(),
        "APP".text.xl5.bold.color(context.theme.accentColor).make(),
      ],
    );
  }
}

// CatalogList

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .py16 //padding
        // .color(Mythemes.creamColor)
        .make()
        .py16() //padding
        .w40(context); //wodth of image inside padding
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CaltelogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CaltelogModels.items[index];
              return InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeDetailPage(catalog: catalog),
                  //   ),
                  // ),
                  // child: CatalogItem(catalog: catalog),
                  );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CaltelogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CaltelogModels.items[index];
              return InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeDetailPage(catalog: catalog),
                  //   ),
                  // ),
                  // child: CatalogItem(catalog: catalog),
                  );
            },
          );
  }
}

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({Key key, @required this.catalog})
//       : assert(catalog != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var children2 = [
//       Hero(
//         tag: Key(catalog.id.toString()),
//         child: CatalogImage(
//           image: catalog.image,
//         ),
//       ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name.text.lg.color(context.accentColor).bold.make(),
//             catalog.desc.text.textStyle(context.captionStyle).make(),
//             10.heightBox,
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               buttonPadding: EdgeInsets.zero,
//               children: [
//                 "\$${catalog.price}".text.bold.xl.make(),
//                 AddToCart(catalog: catalog)
//               ],
//             ).pOnly(right: 8.0)
//           ],
//         ).p(context.isMobile ? 0 : 16),
//       )
//     ];
//     return VxBox(
//       child: context.isMobile
//           ? Row(
//               children: children2,
//             )
//           : Column(
//               children: children2,
//             ),
//     ).color(context.cardColor).rounded.square(150).make().py16();
//   }
// }
