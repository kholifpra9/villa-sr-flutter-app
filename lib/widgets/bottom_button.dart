import 'package:flutter/material.dart';
import 'package:villa_sr_app/widgets/QButton.dart';

class QActionButton extends StatelessWidget {
  const QActionButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.color,
    this.enabled = true,
  });
  final String label;
  final Function onPressed;
  final Color? color;
  final IconData? icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    const padding = 12.0;

    return Container(
      padding: const EdgeInsets.all(padding),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        children: [
          QButton(
            label: label,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
