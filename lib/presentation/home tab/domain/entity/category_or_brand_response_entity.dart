class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});


  num? results;
  MetadataEntity? metadata;
  List<DataEntity>? data;

}

class DataEntity {
  DataEntity({
      this.id, 
      this.name, 
      this.image,});

  String? id;
  String? name;
  String? image;

}

class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.nextPage,
      this.prevPage,
      this.limit,});


  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
  num? prevPage;


}