class PhotoGalleryModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  PhotoGalleryModel(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory PhotoGalleryModel.fromJson(Map<String, dynamic> photoDetails) {
    return PhotoGalleryModel(
        photoDetails['albumId'],
        photoDetails['id'],
        photoDetails['title'],
        photoDetails['url'],
        photoDetails['thumbnailUrl']);
  }
}
