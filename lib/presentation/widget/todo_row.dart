import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/domain/model/models.dart';
import 'package:flutter_app_todoa/domain/repository/todo_repository.dart';
import 'package:provider/provider.dart';

class ToDoRow extends StatelessWidget {
  final ItemData item;

  const ToDoRow({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: item.isChecked,
          onChanged: (bool isSelected) {
            Provider.of<TodoRepository>(context, listen: false)
                .updateTodo(item.id, isSelected);
          },
        ),
        Image.network(
          item.image,
          width: 35,
          height: 35,
        ),
        Flexible(
          child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontSize: 24),
              )),
        )
      ],
    );
  }
}
