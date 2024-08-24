import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateHash({
  required String key,
  required String txnid,
  required double amount,
  required String productinfo,
  required String firstname,
  required String email,
  required String salt,
}) {
  // Construct the string to be hashed
  String hashSequence =
      '$key|$txnid|$amount|$productinfo|$firstname|$email||||||||||$salt';

  // Generate the SHA-512 hash
  var bytes = utf8.encode(hashSequence);
  var digest = sha512.convert(bytes);

  // Return the hash as a hex string
  return digest.toString();
}
