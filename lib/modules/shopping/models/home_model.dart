class HomeModel {
  bool? status;
  String? message;
  HomeData? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
  @override
  String toString() {
    return 'HomeModel{status: $status, message: $message, data: $data}';
  }
}

class HomeData {
  List<Banner>? banners;
  List<Product>? products;
  String? ad;

  HomeData({
    this.banners,
    this.products,
    this.ad,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    List<Banner>? _banners = List.empty(growable: true);
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        _banners.add(Banner.fromJson(element));
      });
    }
    List<Product>? product = List.empty(growable: true);
    if (json['products'] != null) {
      json['products'].forEach((element) {
        product.add(Product.fromJson(element));
      });
    }
    String? ad = json['ad'];
    return HomeData(
      banners: _banners,
      products: product,
      ad: ad,
    );
  }
  @override
  String toString() {
    return 'HomeData{banners: $banners, product: $products, ad: $ad}';
  }
}

class Banner {
  int? id;
  String? image;

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
  @override
  String toString() {
    return 'Banner{id: $id, image: $image}';
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = List.empty(growable: true);
      json['images'].forEach((element) {
        images!.add(element);
      });
    }
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
  @override
  String toString() {
    return 'Product{id: $id, price: $price, oldPrice: $oldPrice, discount: $discount, image: $image, name: $name, description: $description, images: $images, inFavorites: $inFavorites, inCart: $inCart}';
  }
}
