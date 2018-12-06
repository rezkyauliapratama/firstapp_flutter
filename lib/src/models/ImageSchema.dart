class ImageSchema {

  int id;
  String url;
  String title;

  ImageSchema(this.id, this.url, this.title);


  ImageSchema.fromJson(Map<String, dynamic> parsedJson)
      :
    id = parsedJson['id'],
    url = parsedJson['url'],
    title = parsedJson['title'];



}