import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const api = "https://api.dofhunt.200lab.io";
// const userToken =
//     "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJlbWFpbCI6ImRhb2Jha2hhbmgxMTAyQGdtYWlsLmNvbSIsImV4cCI6MTY2NDExNjE2OSwiaWF0IjoxNjYxNTI0MTY5LCJpc3MiOiIiLCJqdGkiOiIzNDMzMjFmMi1mODc3LTRlMjUtOTY2OC1jNmIwYmU3OGEyZTgiLCJuYmYiOjE2NjE1MjQxNjksInNjcCI6WyJvZmZsaW5lIl0sInN1YiI6IjcyMTciLCJ1c2VyX2lkIjoiNzIxNyJ9.tt3Y2imC596zaH4ssVOXBI1haTE6-BGWv4J_eysfvPGBqaApD2RmzWHkAJbQ977Vny83dbfQ_vt_HvbkO9AV4dR5TZyi8mtIGUeh-x6jC5gPcCJ9DQKQNM119kLa9MEw24yeKWdW5VX2fbs3o6QCe2cxBiNzns5ermXZDh_d2M8";

// const userToken =
//     "eiOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJlbWFpbCI6ImRhb2Jha2hhbmgxMTAyQGdtYWlsLmNvbSIsImV4cCI6MTY2NDExNjE2OSwiaWF0IjoxNjYxNTI0MTY5LCJpc3MiOiIiLCJqdGkiOiIzNDMzMjFmMi1mODc3LTRlMjUtOTY2OC1jNmIwYmU3OGEyZTgiLCJuYmYiOjE2NjE1MjQxNjksInNjcCI6WyJvZmZsaW5lIl0sInN1YiI6IjcyMTciLCJ1c2VyX2lkIjoiNzIxNyJ9.tt3Y2imC596zaH4ssVOXBI1haTE6-BGWv4J_eysfvPGBqaApD2RmzWHkAJbQ977Vny83dbfQ_vt_HvbkO9AV4dR5TZyi8mtIGUeh-x6jC5gPcCJ9DQKQNM119kLa9MEw24yeKWdW5VX2fbs3o6QCe2cxBiNzns5ermXZDh_d2M8";

Future<String> getUserTokenKeyFromStorage() async {
// Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the 'action' key. If it doesn't exist, returns null.
  final String userToken = prefs.getString('googleAccessToken') ?? '';
  debugPrint('userToken read from storage: $userToken');

  return userToken;
}

Future<void> readTokenToLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();

  final String userToken = prefs.getString('googleAccessToken') ?? '';
  debugPrint('userToken read from storage: $userToken');
}

final String userToken = getUserTokenKeyFromStorage().toString();
