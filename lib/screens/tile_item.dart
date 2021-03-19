import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  final bool isChecked;
  final String image;
  final String title;

  TileItem({
    this.isChecked = false,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(image == null || image.isEmpty);
    bool checked = false;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: CheckboxListTile(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 24),
        ),
        value: checked,
        onChanged: (bool value) {
          checked = value;
        },
        activeColor: Colors.green,
        checkColor: Colors.green,
        //ld: Row(

        //     Container(
        //       margin: EdgeInsets.all(12.0),
        //       width: isImageExists ? 60.0 : 10.0,
        //       height: 60.0,
        //       decoration: isImageExists
        //           ? BoxDecoration(
        //               color: const Color(0xff7c94b6),
        //               image: DecorationImage(
        //                 image: AssetImage(image),
        //                 fit: BoxFit.cover,
        //               ),
        //               borderRadius: BorderRadius.all(Radius.circular(50.0)),
        //               border: Border.all(
        //                 color: Colors.white,
        //                 width: 4.0,
        //               ),
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey,
        //                   offset: Offset(0.0, 4.0), //(x,y)
        //                   blurRadius: 6.0,
        //                 ),
        //               ],
        //             )
        //           : null,
        //     ),
        //     Expanded(
        //       child: Text(
        //         title,
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //         style: TextStyle(fontSize: 24),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
