import 'dart:math';

import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/services/random_tool.dart';

import '../const/product_status.dart';

class TestTool {
  final RandomTool randomTool = RandomTool();

  final startDate = DateTime(2020, 1, 1);
  final endDate = DateTime(2024, 12, 31);

  final List<String> demoSellerID = [
    "KxA1Yn0DIePf4LGY2CAuxPHvydG2",
    "0bvUfVQoAlWK0Y5G1J5MGkQ0osb2",
    "vj7fC8S3TOhz7Ylgw72wTQmYIEw2"
  ];

  final List<String> testImages = [
    'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg',
    'https://cdn.xtmobile.vn/vnt_upload/news/06_2024/21/tai-nghe-chup-tai-airpods-max-xtmobile.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/yealink-yhs34-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/311186/tai-nghe-bluetooth-chup-tai-havit-h662bt-den-tn-600x600.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/YHS36-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/327554/tai-nghe-bluetooth-true-wireless-samsung-galaxy-buds-3-pro-r630n-100724-082455-600x600-1-600x600.jpg',
  ];

  final List<String> demoNameItem = [
    "Tai nghe Lenovo H3",
    "Chuột Logitech G2",
    "Bàn phím cơ Corsair K95",
    "Chuột Razer DeathAdder V2",
    "Tai nghe HyperX Cloud II",
    "Màn hình Dell UltraSharp U2723QE",
    "Ổ cứng SSD Samsung 870 EVO",
    "Card đồ họa NVIDIA GTX 1660 Super",
    "Bộ tản nhiệt nước Cooler Master ML240L",
    "Bộ nguồn EVGA SuperNOVA 750 G5",
    "Ổ cứng HDD Western Digital Black 2TB",
    "Bàn phím cơ Keychron K6",
    "Chuột gaming SteelSeries Rival 310",
    "Tai nghe SteelSeries Arctis 7",
    "Dock USB-C Anker PowerExpand",
    "Hub USB Orico 4 cổng",
    "Bộ giá đỡ màn hình NB North Bayou",
    "Loa máy tính Logitech Z407",
    "Tai nghe Razer Kraken X",
    "Bàn phím cơ Ducky One 2 Mini",
    "Chuột Logitech MX Master 3",
    "Bàn di chuột SteelSeries QcK",
    "Ổ cứng SSD Kingston A2000",
    "Quạt tản nhiệt Cooler Master MF120R",
    "Tai nghe ASUS ROG Delta",
    "Bàn phím cơ Akko 3068B",
    "Chuột Corsair Harpoon RGB",
    "Màn hình LG 24GN650-B",
    "Ổ cứng HDD Toshiba P300",
    "Card đồ họa AMD Radeon RX 6600",
    "Đèn LED RGB Govee Glide",
    "Bộ nguồn Seasonic Focus GX-650",
    "Bàn phím cơ Leopold FC750R",
    "Chuột gaming Zowie EC2",
    "Tai nghe Corsair HS60 Pro",
    "Loa máy tính Edifier R1280T",
    "Ổ cứng SSD Crucial MX500",
    "Hub sạc UGREEN 7 cổng",
    "Tai nghe Logitech G Pro X",
    "Bàn phím cơ SteelSeries Apex Pro",
    "Chuột ASUS ROG Gladius III",
    "Card đồ họa NVIDIA RTX 3060 Ti",
    "Bộ nguồn Thermaltake Toughpower GF1",
    "Đế tản nhiệt laptop Cooler Master Notepal X3",
    "Đế gắn ổ cứng Orico 2-Bay",
    "Tai nghe Bose QuietComfort 45",
    "Bàn phím cơ HyperX Alloy Origins",
    "Chuột Logitech G703 Lightspeed",
    "Màn hình BenQ EX2510S",
    "Ổ cứng HDD Seagate IronWolf 6TB",
    "Bộ nguồn Be Quiet! Straight Power 11",
    "Tai nghe Sony Inzone H7",
    "Loa Razer Nommo Chroma",
    "Bàn phím cơ Razer BlackWidow V3",
    "Chuột Glorious Model O",
    "Đế tản nhiệt laptop Deepcool N9",
    "Dock SSD NVMe Orico M.2",
    "Ổ cứng SSD WD Black SN850",
    "Quạt tản nhiệt Arctic F12 PWM",
    "Chuột gaming MSI Clutch GM41",
    "Tai nghe Audio-Technica ATH-G1",
    "Màn hình AOC 24G2",
    "Bàn phím cơ Logitech G915 TKL",
    "Loa máy tính Creative Pebble V3",
    "Card đồ họa NVIDIA RTX 4090",
    "Đèn LED Corsair iCUE LT100",
    "Ổ cứng SSD Patriot P300",
    "Bộ nguồn XPG Core Reactor 650W",
    "Bàn phím cơ iKBC CD87",
    "Tai nghe Roccat Elo 7.1 Air",
    "Chuột gaming ASUS TUF Gaming M3",
    "Đế tản nhiệt laptop HAVIT HV-F2056",
    "Bàn phím cơ Varmilo VA87M",
    "Loa máy tính Bose Companion 2 Series III",
    "Ổ cứng SSD TeamGroup T-Force Delta",
    "Card đồ họa AMD Radeon RX 6700 XT",
    "Tai nghe Cooler Master MH751",
    "Chuột Corsair Dark Core RGB Pro",
    "Màn hình Gigabyte M27Q",
    "Quạt tản nhiệt Thermaltake Riing Plus 12",
    "Dock sạc USB Baseus 8 cổng",
    "Bộ nguồn FSP Hydro G Pro 750W",
    "Tai nghe EPOS H3 Hybrid",
    "Bàn phím cơ Ajazz AK33",
    "Chuột gaming HyperX Pulsefire FPS Pro",
    "Loa Logitech G560 LIGHTSYNC",
    "Ổ cứng HDD Western Digital Elements 4TB",
    "Màn hình ViewSonic VX2758-2KP-MHD",
    "Bộ nguồn SilverStone SX750",
    "Đế tản nhiệt laptop Thermaltake Massive 20 RGB",
    "Bàn di chuột Razer Goliathus Extended",
    "Chuột Logitech G502 HERO",
    "Tai nghe Kingston HyperX Cloud Alpha",
    "Bàn phím cơ Anne Pro 2",
    "Ổ cứng SSD PNY CS3030",
    "Quạt tản nhiệt Phanteks T30-120",
    "Card đồ họa NVIDIA RTX 2070 Super",
    "Loa máy tính Harman Kardon SoundSticks III",
    "Dock ổ cứng Sabrent USB 3.0",
    "Tai nghe MSI Immerse GH61",
    "Bàn phím cơ Keychron K2 V2",
    "Chuột ASUS ROG Strix Impact II",
    "Đế tản nhiệt laptop Zalman ZM-NC3",
    "Đèn LED NZXT Hue 2 Ambient",
    "Ổ cứng HDD Toshiba X300 8TB",
    "Bộ nguồn Cooler Master V850",
    "Card đồ họa AMD Radeon RX 580",
    "Màn hình ASUS ProArt PA32UCX",
    "Bàn phím cơ Akko 3098B",
    "Chuột gaming Roccat Kone Pure Ultra",
    "Tai nghe Logitech G933 Artemis Spectrum",
    "Đèn LED Deepcool RGB 350",
    "Ổ cứng SSD ADATA XPG SX8200 Pro",
    "Hub USB-C Belkin 5 cổng",
    "Loa Edifier S350DB",
    "Quạt tản nhiệt Noctua NF-A14",
    "Bàn phím cơ Corsair K70 RGB MK.2",
    "Tai nghe Corsair Virtuoso RGB Wireless",
    "Dock chuyển HDMI UGREEN 6-in-1",
    "Chuột gaming Razer Basilisk V3",
    "Card đồ họa NVIDIA RTX 2080 Ti",
    "Màn hình Acer Predator X34",
    "Đế tản nhiệt laptop NEXSTAND K2",
    "Bộ nguồn Antec HCG Gold 750W",
    "Loa máy tính Audioengine A5+",
    "Chuột Razer Viper Ultimate",
    "Ổ cứng SSD Silicon Power A55",
    "Đèn LED Logitech Litra Glow",
    "Bàn phím cơ Durgod Taurus K320",
    "Tai nghe SteelSeries Siberia 840",
    "Bàn di chuột ASUS ROG Sheath",
    "Hub sạc AUKEY USB-C 4 cổng",
    "Ổ cứng HDD WD Blue 2TB",
    "Màn hình Philips 346E2CUAE",
    "Dock chuyển VGA Baseus",
    "Bàn phím cơ Fantech MAXFIT61",
    "Chuột gaming Logitech G203 Lightsync",
    "Tai nghe ASUS Cerberus V2",
    "Đế tản nhiệt Deepcool N80RGB",
    "Bàn phím cơ E-DRA EK387",
    "Quạt tản nhiệt ID-COOLING DF-12025",
  ];

  List<String> testColor = ["Black", "Grey", "White"];

  ItemModel getRandomItemModel() {
    return ItemModel(
        itemID: "PCP${randomTool.generateRandomNumberString(10)}",
        name: demoNameItem[
            randomTool.generateRandomNumber(0, demoNameItem.length - 1)],
        itemType: randomTool.generateRandomText(1, true),
        sellerID: demoSellerID[
            randomTool.generateRandomNumber(0, demoSellerID.length - 1)],
        addDate: randomTool.generateRandomDate(startDate, endDate),
        price: randomTool.generateRandomPrice(1, 100, 4),
        stock: randomTool.generateRandomNumber(100, 1000),
        status: ProductStatus.BUYABLE,
        detail: randomTool.generateRandomString(40),
        reviewImages: testImages,
        colors: testColor,
        description: randomTool.generateRandomString(20),
        sold: randomTool.generateRandomNumber(100, 1000));
  }

  List<ItemModel> getRandomItemModelList(int length) {
    List<ItemModel> result = [];
    for (int i = 0; i < length; i++) {
      result.add(getRandomItemModel());
    }
    return result;
  }

  Future<void> waitRandomDuration(
      int minMilliseconds, int maxMilliseconds) async {
    final random = Random();

    // Tạo thời gian ngẫu nhiên từ minMilliseconds đến maxMilliseconds
    int randomMilliseconds =
        random.nextInt(maxMilliseconds - minMilliseconds + 1) + minMilliseconds;

    // Chờ trong khoảng thời gian ngẫu nhiên
    await Future.delayed(Duration(milliseconds: randomMilliseconds));
  }
}
