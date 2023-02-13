class ItemsModel {
  double? price;
  int? quantity;
  int? id;

  ItemsModel({
    this.id,
    this.quantity,
    this.price,
  });

  Map toJson() => {
        'id': id,
        'quantity': quantity,
        'price': price,
      };
}
