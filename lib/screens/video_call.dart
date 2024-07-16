import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meeting.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../widgets/meeting_options.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

  late TextEditingController meetingsIDController;
  late TextEditingController nameController;
  bool isAudioMute = true;
  bool isVideoMute = true;
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetings _jitsiMeetings = JitsiMeetings();

  @override
  void initState() {
    // TODO: implement initState
    meetingsIDController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingsIDController.dispose();
    nameController.dispose();
  }

  _onJoiningMeet() {
    _jitsiMeetings.createMeeting(roomName: meetingsIDController.text, isAudioMuted: isAudioMute, isVideoMuted: isVideoMute, userName: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join Meeting', style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingsIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID'
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name'
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: _onJoiningMeet,
            child: const Padding(padding: EdgeInsets.all(12), child: Text('Join', style: TextStyle(
              fontSize: 16
            ),),),
          ),
          SizedBox(
            height: 20,
          ),
          MettindOptions(text: 'Mute Audio', isMute: isAudioMute, onChange: onAudioMute ,),
          MettindOptions(text: 'Turn off Video', isMute: isVideoMute, onChange: onVideoMute ,),
        ],
      ),
    );
  }

  onAudioMute(bool val) {
    setState(() {
      isAudioMute = val;
    });
  }

  onVideoMute(bool val) {
    setState(() {
      isVideoMute = val;
    });
  }

}

