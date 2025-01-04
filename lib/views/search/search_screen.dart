import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/views/widgets/listItem/suggest_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool lienQuan = true;
  bool moiNhat = false;
  bool gia = false;
  bool giaTang = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 42,
                    width: size.width - 75,
                    child: TextField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {},
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Palette.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(top: 4),
                        prefixIcon: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          child: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 16,
                            //color: Palette.greenText,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        lienQuan = !lienQuan;
                        moiNhat = false;
                        giaTang = false;
                        gia = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: (size.width - 40) / 3,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          lienQuan ? Radius.circular(5) : Radius.circular(0),
                        ),
                        border: lienQuan
                            ? Border.all(
                                color: Palette.primaryColor,
                                width: 1,
                              )
                            : Border(
                                right: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                              ),
                      ),
                      child: Text(
                        'Liên quan',
                        style: TextStyle(
                          color: Palette.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        lienQuan = false;
                        moiNhat = !moiNhat;
                        giaTang = false;
                        gia = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: (size.width - 40) / 3,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          moiNhat ? Radius.circular(5) : Radius.circular(0),
                        ),
                        border: moiNhat
                            ? Border.all(
                                color: Palette.primaryColor,
                                width: 1,
                              )
                            : Border(
                                right: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                              ),
                      ),
                      child: Text(
                        'Mới nhất',
                        style: TextStyle(
                          color: Palette.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        giaTang = !giaTang;
                        gia = true;
                        lienQuan = false;
                        moiNhat = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: (size.width - 40) / 3,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          gia ? Radius.circular(5) : Radius.circular(0),
                        ),
                        border: gia
                            ? Border.all(
                                color: Palette.primaryColor,
                                width: 1,
                              )
                            : Border(
                                right: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                              ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Giá',
                            style: TextStyle(
                              color: Palette.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            !gia
                                ? FontAwesomeIcons.sort
                                : giaTang
                                    ? FontAwesomeIcons.arrowUp
                                    : FontAwesomeIcons.arrowDown,
                            size: 16,
                            color: Palette.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return SuggestItem(
                      itemName: 'itemName',
                      imagePath:
                          'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg',
                      description: 'description',
                      location: 'location',
                      rating: 3.5,
                      price: 3500,
                      sold: 32);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
