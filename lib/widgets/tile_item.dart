import 'package:flutter/material.dart';

class TileItem extends StatefulWidget {
  final bool isChecked;
  final String? image;
  final String title;

  final Function onChanged;

  TileItem({
    this.isChecked = false,
    required this.title,
    this.image,
    required this.onChanged,
  });

  @override
  _TileItemState createState() => _TileItemState();
}

class _TileItemState extends State<TileItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(widget.image == null);

    offsetAnimation = Tween(begin: 0.0, end: 14.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    ;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: widget.isChecked,
            activeColor: widget.isChecked ? Colors.grey : Colors.black,
            onChanged: (bool? value) {
              print('$value');

              controller.forward(from: 0.0);
              widget.onChanged(value);
            },
          ),
          Expanded(
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget? child) {
                return Padding(
                  padding: EdgeInsets.only(left: offsetAnimation.value),
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      color: widget.isChecked ? Colors.grey : Colors.black,
                      decoration:
                          widget.isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                );
              },
              animation: controller,
            ),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            width: isImageExists ? 60.0 : 10.0,
            height: 60.0,
            decoration: isImageExists
                ? BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage((widget.image == null
                          ? 'assets/avatar_holder.png'
                          : widget.image)!),
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
        ],
      ),
    );
  }
}
