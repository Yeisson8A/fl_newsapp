import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(BuildContext context, String url) async {

  // Abrir el sitio web
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
    throw Exception('Could not launch $url');
  }
}