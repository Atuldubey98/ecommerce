class GroceryModel {
  final String title;
  final String type;
  final String description;
  final String filename;
  final String height;
  final String width;
  final String price;
  final int rating;
  int qty = 0;

  GroceryModel(
      {this.title,
      this.type,
      this.description,
      this.filename,
      this.height,
      this.width,
      this.price,
      this.rating,
      qty});
}
