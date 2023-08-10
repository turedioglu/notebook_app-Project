import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class NoteApp {
  showGeneralDialog(
    BuildContext context, {
    String? title,
    bool? dismissible,
    required Widget body,
    Widget? icon,
  }) {
    return showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(barrierDismissible: dismissible ?? true),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    title != null
                        ? Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const SizedBox(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: icon ??
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.close),
                            ),
                          ),
                    ),
                  ],
                ),
                body
              ],
            ),
          ),
        );
      },
    );
  }
}