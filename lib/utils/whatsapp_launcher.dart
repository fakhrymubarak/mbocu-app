import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

launchWhatsApp(String phoneNumber, String msg) async {
  final link = WhatsAppUnilink(
    phoneNumber: phoneNumber,
    text: msg,
  );
  await launch('$link');
}