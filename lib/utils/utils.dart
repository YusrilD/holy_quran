import 'package:url_launcher/url_launcher.dart';

String greetings() {
  var hour = DateTime.now().hour;
  if (hour > 4 && hour < 11) {
    return 'pagi';
  }
  if (hour >= 11 && hour < 15) {
    return 'siang';
  }
  if (hour >= 15 && hour < 18) {
    return 'sore';
  }
  return 'malam';
}

Future<bool> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    return false;
  }
}
