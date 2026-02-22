import 'package:flutter/material.dart';

class AppLoader {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    if (_overlayEntry != null) return; // Prevent multiple loaders

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background blur + block touch
          ModalBarrier(
            dismissible: false,
            color: Colors.transparent,
          ),

          // Loader
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
