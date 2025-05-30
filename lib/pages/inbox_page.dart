import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => Divider(height: 0),
      itemBuilder: (context, index) {
        bool isUnread = index % 2 == 0; // Example condition

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red[400],
            child: Text(
              'E${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sender ${index + 1}',
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                '12:${index}0 PM',
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subject line of email #$index',
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'This is the preview of the email content number $index. It gives a short idea of the mail body content.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          isThreeLine: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opened email #$index')),
            );
          },
        );
      },
    );
  }
}
