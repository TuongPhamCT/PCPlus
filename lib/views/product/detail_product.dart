import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/bill/bill_product.dart';
import 'package:pcplus/views/widgets/listItem/review_item.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});
  static const String routeName = 'detail_product';

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final List<String> images = [
    'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg',
    'https://cdn.xtmobile.vn/vnt_upload/news/06_2024/21/tai-nghe-chup-tai-airpods-max-xtmobile.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/yealink-yhs34-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/311186/tai-nghe-bluetooth-chup-tai-havit-h662bt-den-tn-600x600.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/YHS36-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/327554/tai-nghe-bluetooth-true-wireless-samsung-galaxy-buds-3-pro-r630n-100724-082455-600x600-1-600x600.jpg',
  ];
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  bool _detailInfor = false;
  double rating = 3.5;
  int color = 1;
  int soluong = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _scrollToIndex(index);
    });
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 80.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Palette.borderBackBtn,
                            ),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Gap(30),

                      //list small Image view
                      SizedBox(
                        width: 50,
                        height: 270,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _pageController.jumpToPage(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _selectedIndex == index
                                        ? Palette.primaryColor
                                        : Palette.borderBackBtn,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //Big Image view
                SizedBox(
                  height: 430,
                  width: size.width - 110,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //Go to Full Screen Image View
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: InteractiveViewer(
                                    child: Image.network(
                                      images[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Palette.backgroundColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name Here Pham Thanh Tuong Pham Thanh Tuong',
                    style: TextDecor.robo24Bold,
                    maxLines: 2,
                  ),
                  Text(
                    '200.000 VNĐ',
                    style: TextDecor.robo18Semi.copyWith(
                      color: Colors.red,
                    ),
                    maxLines: 2,
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Palette.star,
                        size: 23,
                      ),
                      const Gap(3),
                      Text(
                        '4.9',
                        style: TextDecor.robo13Medi,
                      ),
                      Expanded(child: Container()),
                      Text(
                        '100,5k Sold',
                        style: TextDecor.robo13Medi,
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    'Wireless Over-ear Industry Leading Noise Canceling Headphones with Microphone',
                    style: TextDecor.robo15,
                    maxLines: 3,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Palette.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.document_scanner_outlined,
                          color: Palette.primaryColor,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'Product Specifications',
                        style: TextDecor.robo16,
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _detailInfor = !_detailInfor;
                          });
                        },
                        icon: Icon(
                          _detailInfor
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  if (_detailInfor)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Detail Information Here\n Detail Information Here\n Detail Information Here\n Detail Information Here\n Detail Information Here\n',
                        style: TextDecor.robo15.copyWith(wordSpacing: 1.5),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Palette.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.palette_outlined,
                          color: Palette.primaryColor,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'Color',
                        style: TextDecor.robo16,
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Palette.borderBackBtn, width: 2),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                      ),
                      const Gap(5),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Palette.borderBackBtn, width: 2),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(5),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Palette.borderBackBtn, width: 2),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                      const Gap(5),
                    ],
                  ),
                  const Gap(20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.borderBackBtn),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(
                              image: AssetImage(AssetHelper.shopAvt),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Gap(16),
                        SizedBox(
                          height: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width - 180,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'King Shop',
                                      style: TextDecor.robo18Semi,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //Go to Shop view
                                      },
                                      child: Container(
                                        height: 24,
                                        width: 85,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'View Shop',
                                          style: TextDecor.robo14.copyWith(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '0123456789',
                                style: TextDecor.robo16,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    'Thu Duc, Ho Chi Minh',
                                    style: TextDecor.robo16,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '50',
                                    style: TextDecor.robo16.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    'Products',
                                    style: TextDecor.robo16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(8),
                  Text("Product's Reviews", style: TextDecor.robo18Semi),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18,
                        unratedColor: const Color(0xffDADADA),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        onRatingUpdate: (value) {},
                        ignoreGestures: true,
                      ),
                      const Gap(6),
                      Text(
                        '$rating/5',
                        style: TextDecor.robo16.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        '(1000 Reviews)',
                        style: TextDecor.robo16.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ReviewItem();
                    },
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                //Add one product to Cart
              },
              child: Container(
                width: size.width / 2,
                height: 55,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    Text(
                      'Add to Cart',
                      style: TextDecor.robo16Semi.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //Buy now
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (BuildContext context,
                        StateSetter setBottomSheetState) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 350,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(images.first),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        //Go to Full Screen Image View
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: InteractiveViewer(
                                                  child: Image.network(
                                                    images.first,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.fullscreen,
                                          color: Palette.primaryColor,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '200.000 VND',
                                        style: TextDecor.robo18Semi
                                            .copyWith(color: Colors.red),
                                      ),
                                      const Gap(10),
                                      Text(
                                        'Stock: 100',
                                        style: TextDecor.robo17Medi,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //Divider Line 1
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width,
                                  ),
                                  Text('Colors:', style: TextDecor.robo16),
                                  const Gap(10),
                                  Row(
                                    children: [
                                      //Color Black Picker
                                      InkWell(
                                        onTap: () {
                                          setBottomSheetState(() {
                                            color = 1;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 100,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: color == 1
                                                  ? Palette.primaryColor
                                                  : Palette.borderBackBtn,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color == 1
                                                          ? Palette.primaryColor
                                                          : Palette
                                                              .borderBackBtn,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Gap(5),
                                              Text(
                                                'Black',
                                                style: TextDecor.robo16
                                                    .copyWith(
                                                        color: color == 1
                                                            ? Palette
                                                                .primaryColor
                                                            : Palette
                                                                .borderBackBtn),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      //Color Grey Picker
                                      InkWell(
                                        onTap: () {
                                          setBottomSheetState(() {
                                            color = 2;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 100,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: color == 2
                                                  ? Palette.primaryColor
                                                  : Palette.borderBackBtn,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color == 2
                                                          ? Palette.primaryColor
                                                          : Palette
                                                              .borderBackBtn,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Gap(5),
                                              Text(
                                                'Grey',
                                                style: TextDecor.robo16
                                                    .copyWith(
                                                        color: color == 2
                                                            ? Palette
                                                                .primaryColor
                                                            : Palette
                                                                .borderBackBtn),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      //Color White Picker
                                      InkWell(
                                        onTap: () {
                                          setBottomSheetState(() {
                                            color = 3;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 100,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: color == 3
                                                  ? Palette.primaryColor
                                                  : Palette.borderBackBtn,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color == 3
                                                          ? Palette.primaryColor
                                                          : Palette
                                                              .borderBackBtn,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Gap(5),
                                              Text(
                                                'White',
                                                style: TextDecor.robo16
                                                    .copyWith(
                                                        color: color == 3
                                                            ? Palette
                                                                .primaryColor
                                                            : Palette
                                                                .borderBackBtn),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //Divider Line 2
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Quantity:", style: TextDecor.robo16),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                    onTap: () {
                                      if (soluong > 1) {
                                        setBottomSheetState(() {
                                          soluong--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          bottomLeft: Radius.circular(3),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      '$soluong',
                                      textAlign: TextAlign.center,
                                      style: TextDecor.robo14.copyWith(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setBottomSheetState(() {
                                        soluong++;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(3),
                                          bottomRight: Radius.circular(3),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Divider Line 3
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 5),
                              child: Container(
                                height: 5,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: InkWell(
                                onTap: () {
                                  //Go to Payment View
                                  Navigator.of(context)
                                      .pushNamed(BillProduct.routeName);
                                },
                                child: Container(
                                  height: 45,
                                  width: size.width - 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Buy now',
                                    style: TextDecor.robo24Medi.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                );
              },
              child: Container(
                width: size.width / 2,
                height: 55,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  'Buy now',
                  style: TextDecor.robo24Medi.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
