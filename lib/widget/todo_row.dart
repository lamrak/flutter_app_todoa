import 'package:flutter/material.dart';

class ToDoRow extends StatelessWidget {
  final String title;

  ToDoRow({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool value) {},
        ),
        Container(
          margin: const EdgeInsets.all(12.0),
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 4.0),
                blurRadius: 6.0,
              ),
            ],
          ),
        ),
        Flexible(
          child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              child: Text(
                title,
                // overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontSize: 24),
              )),
        )
      ],
    );
  }
}
