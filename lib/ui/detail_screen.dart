import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:main_project/data/models/airline_model.dart';
import 'package:main_project/data/models/data_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.dataModel, required this.index});
  final DataModel dataModel;
  final int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataModel.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: widget.dataModel.airline[0].logo,
            imageBuilder: (context, imageProvider){
              return ClipRRect(
                borderRadius: BorderRadius.circular(32),
              );
            },
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 16,),
          RichText(text:  TextSpan(
            text: "Passenger name: ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            children: [
              TextSpan(
                text: widget.dataModel.name,
                style: const TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
              )
            ]
          )),
          const SizedBox(height: 8,),
          RichText(text:  TextSpan(
            text: "Company name: ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            children: [
              TextSpan(
                text: widget.dataModel.airline[0].name,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
              )
            ]
          )),
          const SizedBox(height: 8,),
          RichText(text:  TextSpan(
            text: "Website: ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            children: [
              TextSpan(
                text: widget.dataModel.airline[0].website,
                style: const TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
              )
            ]
          )),
          const SizedBox(height: 8,),
          RichText(text:  TextSpan(
            text: "Country: ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            children: [
              TextSpan(
                text: widget.dataModel.airline[0].country,
                style: const TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),
              )
            ]
          )),
        ],
      ),
    );
  }
}
