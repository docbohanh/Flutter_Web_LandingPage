import 'package:flutter/material.dart';
import 'package:helloweb/entities/product_entity.dart';
import 'package:helloweb/screens/base/base_screen.dart';
import 'package:helloweb/widgets/product_view/product_view.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends BaseScreenLayout<ProductsScreen> {
  List<ProductEntity> _arrProduct = [
    ProductEntity("Click", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/fullsize/click.jpg"),
    ProductEntity("iFind", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/fullsize/6.jpg"),
    ProductEntity("Vietlott", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/fullsize/1.jpg"),
    ProductEntity("Click web", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/fullsize/2.png"),
    ProductEntity("Soccer session", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/thumbnails/soccer_sessions.png"),
    ProductEntity("Blockchain", Color(0xFF12b897),
        "http://iceteastudio.click/img/portfolio/fullsize/5.png"),
  ];

  @override
  Widget buildLargeLayout(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.network("assets/graphics/image_02.png", scale: .85),
          ),
          FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: .6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text("Products",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GoogleSans",
                              color: Color(0xFF12b897))),
                      Container(
                        width: 80,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xFF12b897),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _buildGridProduct(2),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget buildSmallLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text("Products",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoogleSans",
                    color: Color(0xFF12b897))),
            Container(
              width: 80,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFF12b897),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _buildGridProduct(1),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/graphics/image_02.png", scale: 1,
                // scale: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridProduct(int numColumn) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: numColumn,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 16 / 9,
      ),
      itemBuilder: (ctx, index) => ProductView(
        data: _arrProduct[index],
      ),
      itemCount: _arrProduct.length,
    );
  }
}
