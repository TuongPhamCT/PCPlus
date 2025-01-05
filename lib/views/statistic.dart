import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pcplus/themes/text_decor.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});
  static const String routeName = 'statistic';

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  String _selectedStatisticType = "Tháng"; // "Tháng" hoặc "Năm"
  String _selectedMonth = "1"; // Tháng mặc định
  String _selectedYear = "2020"; // Năm mặc định
  final List<String> _months =
      List.generate(12, (index) => "${index + 1}"); // Tháng 1–12
  final List<String> _years =
      List.generate(6, (index) => "${2020 + index}"); // Năm 2020–2025

  // Dữ liệu bán hàng (tháng và năm trong cùng một cấu trúc)
  final Map<String, Map<String, List<int>>> salesData = {
    "2020": {
      "1": [100, 120, 80],
      "2": [90, 140, 100],
      "Yearly": [1500, 1800, 1200],
    },
    "2021": {
      "1": [110, 130, 90],
      "Yearly": [1400, 1700, 1100],
    },
  };

  List<int> getSalesData() {
    if (salesData.containsKey(_selectedYear)) {
      if (_selectedStatisticType == "Tháng") {
        return salesData[_selectedYear]?[_selectedMonth] ?? [0, 0, 0];
      } else {
        return salesData[_selectedYear]?["Yearly"] ?? [0, 0, 0];
      }
    } else {
      return [0, 0, 0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'STATISTIC',
          style: TextDecor.robo24Medi.copyWith(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown chọn kiểu thống kê (Tháng/Năm)
            Row(
              children: [
                Text(
                  "Thống kê theo: ",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedStatisticType,
                  items: ["Tháng", "Năm"].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStatisticType = value!;
                      if (_selectedStatisticType == "Năm") {
                        _selectedMonth = "1"; // Reset tháng khi chọn Năm
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            // Dropdown chọn Tháng (chỉ hiển thị nếu chọn Tháng)
            if (_selectedStatisticType == "Tháng") ...[
              Row(
                children: [
                  Text(
                    "Chọn tháng: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedMonth,
                    items: _months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
            // Dropdown chọn Năm
            Row(
              children: [
                Text(
                  "Chọn năm: ",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedYear,
                  items: _years.map((String year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedYear = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Biểu đồ cột
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: getSalesData()
                      .asMap()
                      .entries
                      .map(
                        (entry) => BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              toY: entry.value.toDouble(),
                              color: Colors.blue,
                              width: 20,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Chú thích
            Wrap(
              spacing: 8,
              children: ["Sản phẩm A", "Sản phẩm B", "Sản phẩm C"]
                  .asMap()
                  .entries
                  .map((entry) => Chip(
                        label: Text(
                            "${entry.value}: ${getSalesData()[entry.key]} sản phẩm"),
                        backgroundColor: Colors.blue[100],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
