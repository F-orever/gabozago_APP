import 'dart:convert';

extension ParseEmailFromJwt on String {
  String getEmail() {
    final parts = split('.');
    if (parts.length != 3) {
      throw Exception('invalid jwt token');
    }

    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);

    final String resp = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> payloadMap = json.decode(resp);

    return payloadMap['email'];
  }
}
