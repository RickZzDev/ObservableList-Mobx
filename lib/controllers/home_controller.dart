import 'package:mobx/mobx.dart';
import 'package:observableListMobx/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item1", check: true),
    ItemModel(title: "Item2", check: false),
    ItemModel(title: "Item3", check: true),
  ].asObservable();

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return listItems;
    } else {
      return listItems
          .where((element) => element.title.contains(filter))
          .toList();
    }
  }

  @observable
  String filter = "";

  @action
  setFilter(String value) => filter = value;

  @action
  addItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  removeItem(ItemModel item) {
    listItems.removeWhere((element) => element.title == item.title);
  }
}
