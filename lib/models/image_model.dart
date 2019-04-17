class ImageModel{
  int id;
  String url;
  String title;

  ImageModel(this.id, this.title, this.url);
  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson["id"];
    title = parsedJson["title"];
    url = parsedJson["url"];
    //print('parsedJson[url] is ${parsedJson[url]} and url is $url');   
  }
}