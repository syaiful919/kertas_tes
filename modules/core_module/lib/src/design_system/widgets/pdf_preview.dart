import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:third_parties_module/flutter_cached_pdfview.dart';

class PdfPreview {
  const PdfPreview._();

  static show({
    required BuildContext context,
    required String url,
    String title = '',
  }) {
    BaseNav.push(
      context: context,
      page: _PdfPreview(
        url: url,
        title: '',
      ),
    );
  }
}

class _PdfPreview extends StatelessWidget {
  final String title;
  final String url;

  const _PdfPreview({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return DSScaffold(
      appBar: PlainAppbar(
        context: context,
        title: title,
      ),
      body: const PDF(
        pageSnap: false,
      ).fromUrl(
        url,
        placeholder: (_) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        },
        errorWidget: (dynamic error) {
          return DefaultErrorView(
            message: error.toString(),
          );
        },
      ),
    );
  }
}
