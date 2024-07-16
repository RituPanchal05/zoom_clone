import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../resources/firestore_methods.dart'; // Import the intl package for formatting

class MeetingHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || (snapshot.data! as dynamic).docs.isEmpty) {
          return Center(child: Text("No meetings found."));
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            var meeting = (snapshot.data! as dynamic).docs[index];
            String meetingName = meeting['meetingName'];
            Timestamp createdAtTimestamp = meeting['createdAt'];

            // Convert the Timestamp to DateTime
            DateTime createdAt = createdAtTimestamp.toDate();

            // Format the DateTime object to a readable format
            String formattedDate = DateFormat.yMMMd().add_jm().format(createdAt);

            return ListTile(
              title: Text('Room Name: $meetingName'),
              subtitle: Text('Time: $formattedDate'),
            );
          },
        );
      },
    );
  }
}