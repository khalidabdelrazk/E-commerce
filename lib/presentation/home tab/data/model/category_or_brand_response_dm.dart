import 'package:ecommerce/presentation/home%20tab/domain/entity/category_or_brand_response_entity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusCode,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusCode = json['statusCode'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDm.fromJson(v));
      });
    }
  }

  String? message;
  num? statusCode;
}

class DataDm extends DataEntity {
  DataDm({
    super.id,
    super.name,
    this.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  DataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? slug;
  String? createdAt;
  String? updatedAt;
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.prevPage,
    super.nextPage,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
