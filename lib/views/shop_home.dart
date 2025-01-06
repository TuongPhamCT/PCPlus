import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/commands/shop_home_command.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/contract/shop_home_contract.dart';
import 'package:pcplus/presenter/shop_home_presenter.dart';
import 'package:pcplus/singleton/user_singleton.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/add_product.dart';
import 'package:pcplus/views/widgets/bottom/shop_bottom_bar.dart';
import 'package:pcplus/views/widgets/listItem/shop_item.dart';
import 'package:pcplus/views/widgets/listItem/suggest_item.dart';

import '../builders/widget_builders/shop_item_builder.dart';
import '../builders/widget_builders/widget_builder_director.dart';
import '../objects/suggest_item_data.dart';
import 'edit_product.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({super.key});
  static const String routeName = 'shop_home';

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> implements ShopHomeContract {
  ShopHomePresenter? _presenter;
  final UserSingleton _userSingleton = UserSingleton.getInstance();
  WidgetBuilderDirector director = WidgetBuilderDirector();
  bool init = true;
  bool isShop = true;

  List<Widget> productWidgets = [];

  @override
  void initState() {
    isShop = _userSingleton.isShop();
    _presenter = ShopHomePresenter(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (init) {
      loadData();
    } else {
      fetchData();
    }
  }

  Future<void> loadData() async {
    await _presenter?.getData();
  }

  Future<void> fetchData() async {

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: !isShop
          ? AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : null,
      body: Container(
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetHelper.shopBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isShop) const Gap(50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetHelper.shopAvt),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _userSingleton.currentUser!.name!,
                        style: TextDecor.robo24Bold.copyWith(
                          color: Palette.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 24,
                          ),
                          const Gap(10),
                          Text(
                            _userSingleton.currentUser!.phone!,
                            style: TextDecor.robo18.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 28,
                          ),
                          const Gap(5),
                          Text(
                            _userSingleton.currentUser!.getLocation(),
                            style: TextDecor.robo18.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Text('Danh mục sản phẩm', style: TextDecor.robo18Bold),
              const Gap(10),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ShopItem(
                      itemName: 'Tai nghe SONY 3',
                      imagePath:
                          'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg',
                      description: 'Tai nghe hiện đại nhất',
                      quantity: 10,
                      location: 'Hồ Chí Minh Thu Duc, Linh Xuan',
                      rating: 4.5,
                      price: 576000,
                      sold: 3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isShop ? FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProduct.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ) : null,
      bottomNavigationBar: isShop ? const ShopBottomBar(currentIndex: 0) : null,
    );
  }

  Future<void> buildItemList() async {
    ShopItemBuilder shopItemBuilder = ShopItemBuilder();
    for (ItemData item in _presenter!.itemsData) {
      director.makeShopItem(
        builder: shopItemBuilder,
        data: item,
        editCommand: ShopHomeItemEditCommand(presenter: _presenter!, item: item),
        deleteCommand: ShopHomeItemDeleteCommand(presenter: _presenter!, item: item)
      );
      productWidgets.add(shopItemBuilder.createWidget()!);
    }
    setState(() {});
  }

  @override
  void onItemEdit() {
    Navigator.of(context).pushNamed(EditProduct.routeName);
  }

  @override
  void onItemDelete() {
    setState(() {
      buildItemList();
    });
  }

  @override
  void onLoadDataSucceeded() {
    buildItemList();
  }

  @override
  void onPopContext() {
    // TODO: implement onPopContext
  }

  @override
  void onWaitingProgressBar() {
    // TODO: implement onWaitingProgressBar
  }

  @override
  void onFetchDataSucceeded() {
    setState(() {
      buildItemList();
    });
  }
}
