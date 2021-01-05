class Item {
  String itemName, brandName, category, detail, date, image;
  int price, qty;
  Item(
      {this.itemName,
      this.brandName,
      this.category,
      this.price,
      this.qty,
      this.detail,
      this.image});
}

List<String> Categories = ["Male", "Female", "Kids", "All"];

Item item1 = Item();
Item item2 = Item();
List<Item> loadItem() {
  item1.itemName = 'Balckky';
  item1.brandName = 'Nike';
  item1.category = 'Male';
  item1.price = 1000;
  item1.qty = 2;
  item1.detail = 'fkjfkjfkjd fjkjf jfkf';
  item1.date = 'Nov 2';
  item1.image = null;
  item2.itemName = 'Malckky';
  item2.brandName = 'Nike';
  item2.category = 'Female';
  item2.price = 1000;
  item2.qty = 12;
  item2.detail = 'fkjfkjfkjd fjkjf jfkf';
  item2.date = 'Oct 26';
  item2.image = null;
  List<Item> items = [item1, item2];
  return items;
}
