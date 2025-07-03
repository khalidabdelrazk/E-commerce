import '../../domain/entity/product_response_entity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.message,
  });

  factory ProductResponseDm.fromJson(dynamic json) {
    return ProductResponseDm(
      results: json['results'],
      metadata: json['metadata'] != null
          ? MetadataDm.fromJson(json['metadata'])
          : null,
      message: json['message'],
      data: json['data'] != null
          ? List<DataDm>.from(json['data'].map((v) => DataDm.fromJson(v)))
          : [],
    );
  }
  String? message;
}

class DataDm extends DataEntity {
  DataDm({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
  });

  factory DataDm.fromJson(dynamic json) {
    return DataDm(
      sold: json['sold'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      subcategory: json['subcategory'] != null
          ? List<SubcategoryDm>.from(
          json['subcategory'].map((v) => SubcategoryDm.fromJson(v)))
          : [],
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      category: json['category'] != null
          ? CategoryDm.fromJson(json['category'])
          : null,
      brand: json['brand'] != null ? BrandDm.fromJson(json['brand']) : null,
      ratingsAverage: json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class BrandDm extends BrandEntity {
  BrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  factory BrandDm.fromJson(dynamic json) {
    return BrandDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class CategoryDm extends CategoryEntity {
  CategoryDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  factory CategoryDm.fromJson(dynamic json) {
    return CategoryDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class SubcategoryDm extends SubcategoryEntity {
  SubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  factory SubcategoryDm.fromJson(dynamic json) {
    return SubcategoryDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  factory MetadataDm.fromJson(dynamic json) {
    return MetadataDm(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }
}
