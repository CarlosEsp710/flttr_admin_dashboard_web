import 'package:flutter/material.dart';

class LinkTextWidget extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const LinkTextWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  State<LinkTextWidget> createState() => _LinkTextWidgetState();
}

class _LinkTextWidgetState extends State<LinkTextWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: 16,
              decoration:
                  _isHovered ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
