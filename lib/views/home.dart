import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/builders/widget_builders/new_item_builder.dart';
import 'package:pcplus/builders/widget_builders/suggest_item_builder.dart';
import 'package:pcplus/builders/widget_builders/widget_builder_director.dart';
import 'package:pcplus/commands/home_command.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/contract/home_contract.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/services/utility.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';
import 'package:pcplus/views/widgets/listItem/new_item.dart';
import 'package:pcplus/views/widgets/listItem/suggest_item.dart';
import 'package:pcplus/views/widgets/util_widgets.dart';

import '../presenter/home_presenter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeContract {
  HomePresenter? _presenter;
  WidgetBuilderDirector director = WidgetBuilderDirector();
  bool isShop = false;
  bool isLoading = true;
  List<Widget> newProducts = [];
  List<Widget> recommendedProducts = [];

  @override
  void initState() {
    _presenter = HomePresenter(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  Future<void> loadData() async {
    await _presenter?.getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading ? UtilWidgets.getLoadingWidget() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 42,
                width: double.infinity,
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
              Container(
                height: 200,
                padding: const EdgeInsets.only(top: 12),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 145,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Palette.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Music and No more",
                            style: TextDecor.robo24Medi,
                          ),
                          const Gap(5),
                          Text(
                            "10% off for One of the best\nheadphones in the world",
                            style: TextDecor.robo12,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AssetHelper.sampleImage,
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Text('New Products', style: TextDecor.robo18Bold),
              const Gap(10),
              Container(
                height: 285,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newProducts.length,
                  itemBuilder: (context, index) {
                    return newProducts[index];
                  },
                ),
              ),
              const Gap(30),
              Text('Suggestions for you', style: TextDecor.robo18Bold),
              const Gap(10),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return recommendedProducts[index];
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarCustom(currentIndex: 0),
    );
  }

  @override
  Future<void> onLoadDataSucceed() async {
    NewItemBuilder newItemBuilder = NewItemBuilder();
    for (ItemModel item in _presenter!.newestItems) {
      await director.makeNewItem(
        builder: newItemBuilder,
        product: item,
        command: HomeItemPressedCommand(presenter: _presenter!, itemModel: item),
      );
      newProducts.add(newItemBuilder.createWidget()!);
    }

    SuggestItemBuilder suggestItemBuilder = SuggestItemBuilder();
    for (ItemModel item in _presenter!.recommendedItems) {
      await director.makeSuggestItem(
          builder: suggestItemBuilder,
          product: item,
          command: HomeItemPressedCommand(presenter: _presenter!, itemModel: item),
      );
      newProducts.add(newItemBuilder.createWidget()!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void onItemPressed() {
    // TODO: implement onItemPressed
  }
}
