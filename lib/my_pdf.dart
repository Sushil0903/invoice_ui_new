import 'package:flutter/material.dart';
import 'package:invoice_ui/pdf_data.dart';
import 'package:printing/printing.dart';

class Mypdf extends StatefulWidget {
  const Mypdf({super.key});

  @override
  State<Mypdf> createState() => _MypdfState();
}

class _MypdfState extends State<Mypdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfData().getPdfPreview(),
    );
  }
}
