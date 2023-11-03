import 'dart:convert';

import 'package:assignment_11/models/model.dart';
import 'package:assignment_11/services/api_services.dart';
import 'package:assignment_11/views/screens/photo_details_screen.dart';
import 'package:flutter/material.dart';

class PhotoGalleryHomeScreen extends StatefulWidget {
  const PhotoGalleryHomeScreen({super.key});

  @override
  State<PhotoGalleryHomeScreen> createState() => _PhotoGalleryHomeScreenState();
}

class _PhotoGalleryHomeScreenState extends State<PhotoGalleryHomeScreen> {
  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    fetchPhotoGallery();
    super.initState();
  }

  List<PhotoGalleryModel> photoList = [];
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: photoList.length,
              itemBuilder: (_, index) {
                return ListTile(
                    leading: GestureDetector(
                      child: Image.network(photoList[index].thumbnailUrl),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PhotoDetailsScreen(photoList[index])));
                      },
                    ),
                    title: Text(photoList[index].title));
              }),
    );
  }

  fetchPhotoGallery() async {
    isLoading = true;
    setState(() {});
    final response = await apiServices.getPhotoList();
    if (response.request == null) {
      // ignore: avoid_print
      print(response.body);
    } else {
      final resultBody = jsonDecode(response.body);
      for (Map<String, dynamic> element in resultBody) {
        photoList.add(PhotoGalleryModel.fromJson(element));
      }
      isLoading = false;
      setState(() {});
    }
  }
}
