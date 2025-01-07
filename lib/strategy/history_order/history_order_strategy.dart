import 'package:flutter/cupertino.dart';

import '../../presenter/history_order_presenter.dart';

abstract class HistoryOrderBuildListStrategy {
  HistoryOrderPresenter? presenter;

  List<Widget> execute();
}