import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetings {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({required String roomName, required bool isAudioMuted, required bool isVideoMuted, String userName = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      String name;
      if(userName.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: "jitsiIsAwesomeWithFlutter",
        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject" : "Jitsi with Flutter",
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false
        },
        userInfo: JitsiMeetUserInfo(
            displayName: name,
            email: _authMethods.user.email
        ),
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      var jistiMeet = JitsiMeet();
      await jistiMeet.join(options);
    } catch (error) {
      print("error: $error");
    }
  }
}