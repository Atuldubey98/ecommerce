class GroceryModel {
  final String id;

  final String title;
  final String type;
  final String description;
  final String filename;
  final String height;
  final String width;
  final double price;
  final int rating;
  int qty = 0;

  GroceryModel(
      {this.id,
      this.title,
      this.type,
      this.description,
      this.filename,
      this.height,
      this.width,
      this.price,
      this.rating,
      qty});
}
