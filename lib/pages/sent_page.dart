import 'package:flutter/material.dart';

class SentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => Divider(height: 0),
      itemBuilder: (context, index) {
        String recipient = 'example$index@gmail.com';

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[400],
            child: Text(
              recipient[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'To: $recipient',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '11:${index}0 AM',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subject: Sent Mail #$index',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Your message has been sent successfully.',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          isThreeLine: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opened sent mail #$index')),
            );
          },
        );
      },
    );
  }
}
