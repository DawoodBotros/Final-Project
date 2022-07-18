class News{
  late String _imagePath, _text;
  News({required String imagePath,required String text}):_imagePath=imagePath,_text=text;
  String get image {
    return _imagePath;
  }
  String get text {
    return _text;
  }
}
