import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; 
  final bool enabled;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, 
          disabledBackgroundColor: Colors.black.withValues(alpha: 0.5), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: enabled ? Colors.white : Colors.white.withValues(alpha: 0.7)
,
          ),
        ),
      ),
    );
  }
}
