import 'package:flutter/material.dart';
import 'package:pcplus/contract/history_order_contract.dart';
import 'package:pcplus/presenter/history_order_presenter.dart';
import 'package:pcplus/strategy/history_order/history_order_strategy.dart';
import 'package:pcplus/themes/text_decor.dart';

class HistoryOrder extends StatefulWidget {
  final String orderType;
  const HistoryOrder({
    super.key,
    required this.orderType
  });
  static const String routeName = 'history_order';

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> implements HistoryOrderContract {
  HistoryOrderPresenter? _presenter;

  late HistoryOrderBuildListStrategy _buildListStrategy;

  List<Widget> orders = [];

  @override
  void initState() {
    _presenter = HistoryOrderPresenter(this, orderType: widget.orderType);
    _buildListStrategy = _presenter!.createBuildOrderStrategy()!;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History Order',
          style: TextDecor.robo24Medi.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
        ),
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return null;
            },
          ),
        ),
      ),
    );
  }

  @override
  void onItemPressed() {
    // TODO: implement onItemPressed
  }

  @override
  void onLoadDataSucceeded() {
    if (!context.mounted) {
      return;
    }
    setState(() {
      orders = _buildListStrategy.execute();
    });
  }

  @override
  void onPopContext() {
    // TODO: implement onPopContext
  }

  @override
  void onWaitingProgressBar() {
    // TODO: implement onWaitingProgressBar
  }
}
