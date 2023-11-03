import 'package:assignment_11/models/model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhotoDetailsScreen extends StatelessWidget {
  PhotoDetailsScreen(this.photoDetails, {super.key});
  PhotoGalleryModel photoDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              photoDetails.url,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text("Error Image");
              },
            ),

            const SizedBox(
              height: 10,
            ),
            Text("Title : ${photoDetails.title}"),
            Text("ID : ${photoDetails.id.toString()}")
          ],
        ),
      ),
    );
  }
}
