import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/video_call.dart';

import '../resources/jitsi_meeting.dart';
import '../widgets/buttons.dart';

class Meetings extends StatelessWidget {
  Meetings({super.key});

  final JitsiMeetings _jitsiMeetings = JitsiMeetings();
  createNewMeetings() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetings.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeetings(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCall()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeScreenButtons(onPressed: createNewMeetings, icon: Icons.videocam, text: 'New Meetings', color: Colors.blue,),
            HomeScreenButtons(onPressed: () => joinMeetings(context), icon: Icons.add_box_rounded, text: 'Join Meetings',color: Colors.orange,),
            HomeScreenButtons(onPressed: () {}, icon: Icons.calendar_today, text: 'Schedule',color: Colors.orange,),
            HomeScreenButtons(onPressed: () {}, icon: Icons.arrow_upward_rounded, text: 'Share Screen',color: Colors.orange,),
          ],
        ),
        const Expanded(child: Center(child: Text('Create or join meetings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),),
      ],
    );
  }
}