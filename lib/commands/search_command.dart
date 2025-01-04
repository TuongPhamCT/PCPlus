import 'package:pcplus/presenter/search_screen_presenter.dart';

import '../models/items/item_model.dart';
import 'command_interface.dart';

class SearchItemPressedCommand implements CommandInterface {
  final SearchScreenPresenter presenter;
  final ItemModel itemModel;

  SearchItemPressedCommand({
    required this.presenter,
    required this.itemModel
  });

  @override
  void execute() {
    presenter.handleItemPressed(itemModel);
  }
}