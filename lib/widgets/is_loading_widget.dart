import 'package:flutter/material.dart';

class IsLoadingWidget extends StatelessWidget {
  const IsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
