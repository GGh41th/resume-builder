import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late String _pdfPath="";

  @override
  void initState() {
    super.initState();
     _initPdf();
  }

  Future<void> _initPdf() async {
    final ByteData data = await rootBundle.load('assets/RESUME.pdf');
    final List<int> bytes = data.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final pdfFile = File('${tempDir.path}/temp.pdf');
    await pdfFile.writeAsBytes(bytes);
    setState(() {
      _pdfPath = pdfFile.path;
    });
  }

  Future<void> _savePdf() async {
    if (await Permission.storage.request().isGranted) {
     // final downloadsDir = await getExternalStorageDirectory();
      final pdfDir = Directory('download/PDFs');
      await pdfDir.create(recursive: true);
      final pdfFile = File('${pdfDir.path}/saved.pdf');
      await pdfFile.writeAsBytes(await File(_pdfPath).readAsBytes());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF saved to ${pdfFile.path}'),
        ),
      );
    } else {
      // Handle the case where the user denied the permission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission denied to save PDF'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: _pdfPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SfPdfViewer.file(File(_pdfPath)),
      floatingActionButton: FloatingActionButton(
        onPressed: _pdfPath.isNotEmpty ? _savePdf : null,
        tooltip: 'Save PDF',
        child: Icon(Icons.save),
      ),
    );
  }
}
