import 'package:flutter/material.dart';

class AllBackers extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String image;
  final int itemCount;

  const AllBackers({
    Key? key,
    required this.onTap,
    required this.name,
    required this.image,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          title: Text(name),
          trailing: const Icon(Icons.navigate_next),
        );
      },
    );
  }
}
