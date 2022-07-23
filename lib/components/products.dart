class Products{
  Products({

    required this.product_name,

});

  final String product_name;
  factory Products.fromjson(Map<String ,dynamic>json){
    return Products(product_name : json['product_name'] );
  }
}
class Stars{
  final double stars;
  Stars.fromjson(Map<String ,dynamic>json)
  :stars =json['avgstars']??0.0;
}
class Images{
  final String path;
  Images.fromjson(Map<String ,dynamic>json)
      :path =json['avgstars']??'';
}
class Productss{
  final int id;
  final String product_name;
   final double avgstars;
   final String description;
   final int category_id;
   final int brand_id;
   final String path;
  Productss.fromjson(Map<String ,dynamic>json)
      :product_name =json['product_name']??'',
      id =json['id']??0,
      avgstars =json['avgstars']??0.0,
      description =json['description']??0.0,
        category_id =json['category_id']??0,
        brand_id =json['brand_id']??0,
        path =json['path']??'';
}
