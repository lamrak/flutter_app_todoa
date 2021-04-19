import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  final bool isChecked;
  final String? image;
  final String title;

  final Function onCheckedChanges;

  TileItem({
    this.isChecked = false,
    required this.title,
    this.image,
    required this.onCheckedChanges,
  });

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(image == null);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              onCheckedChanges(value ?? false);
            },
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            width: isImageExists ? 60.0 : 10.0,
            height: 60.0,
            decoration: isImageExists
                ? BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage((image == null
                          ? 'assets/avatar_holder.png'
                          : image)!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  )
                : null,
          ),
          Expanded(
            child: isChecked ? showStrokedText() : showNormalText(),
          )
        ],
      ),
    );
  }

  showStrokedText() => Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 24,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough),
      );

  showNormalText() => Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 24),
      );
}
