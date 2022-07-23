import 'package:flutter/material.dart';
import 'package:shop_app/screens/brands/brands_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Category",
            press: () {},
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Category(
                image: "assets/images/Image Banner 2.png",
                category: "Smart Phones",
                numOfBrands: 16,
                press: () {
                  Navigator.pushNamed(context, BrandsScreen.routeName);
                },
              ),
              SizedBox(height: 10),
              Category(
                image: "https://m.media-amazon.com/images/G/01/FireTV/Inline/1_InlineBannerPreview._CB666803979_._TTW_.jpg",
                //"assets/images/Image Banner 3.png",
                category: "TVs",
                numOfBrands: 24,
                press: () {
                  Navigator.pushNamed(context, BrandsScreen.routeName);
                },
              ),
              SizedBox(height: 10),
              Category(
                image: "https://live.staticflickr.com/65535/50456524316_e66b5e2ea0_w.jpg",
                //"assets/images/Image Banner 2.png",
                category: "Headphones",
                numOfBrands: 6,
                press: () {},
              ),
              SizedBox(height: 10),
              Category(
                image:"https://thumbs.dreamstime.com/b/laptop-computer-banner-background-above-black-wood-37921311.jpg",
                // "assets/images/Image Banner 2.png",
                category: "Laptops",
                numOfBrands: 3,
                press: () {},
              ),
              SizedBox(height: 10),
              Category(
                image:"https://thumbs.dreamstime.com/b/summer-banner-template-straw-hat-fashion-sunglasses-vintage-camera-top-view-summer-background-traveler-accessories-179073692.jpg",
                //"assets/images/Image Banner 2.png",
                category: "Cameras",
                numOfBrands: 5,
                press: () {},
              ),
              SizedBox(height: 10),
              Category(
                image:"https://t3.ftcdn.net/jpg/02/39/40/08/360_F_239400826_YQExbFZM7u7yesAAnEyZb8QauJu22MWQ.jpg",
                // "assets/images/Image Banner 2.png",
                category: "Games",
                numOfBrands: 3,
                press: () {},
              ),
              SizedBox(height: 10),
              Category(
                image: "assets/images/Image Banner 2.png",
                category: "controllers",
                numOfBrands: 2,
                press: () {},
              ),
              SizedBox(height: 10),
              Category(
                image: "assets/images/Image Banner 2.png",
                category: "Smartwatches",
                numOfBrands: 3,
                press: () {},
              ),     SizedBox(height: 10),
              Category(
                image: "assets/images/Image Banner 2.png",
                category: "Accessories",
                numOfBrands: 13,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.category,
    required this.image,
    this.numOfBrands = 0,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
