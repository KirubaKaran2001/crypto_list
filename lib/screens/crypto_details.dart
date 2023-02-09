import 'package:flutter/material.dart';

class CryptoDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? details;

  const CryptoDetailsScreen({
    super.key,
    required this.details,
  });

  @override
  State<CryptoDetailsScreen> createState() => _CryptoDetailsScreenState();
}

class _CryptoDetailsScreenState extends State<CryptoDetailsScreen> {
  Map<String, dynamic>? details;
  @override
  void initState() {
    super.initState();
    details = widget.details;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.network(
            details!['image'],
          ),
        ),
      ),
    );
  }
}
