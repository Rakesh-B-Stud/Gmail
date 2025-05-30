import 'package:flutter/material.dart';

class DraftsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => Divider(height: 0),
      itemBuilder: (context, index) {
        String sender = 'you@example.com';

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange[700],
            child: Text(
              sender[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Draft #$index',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                '10:${index}5 AM',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To: recipient$index@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Draft email content preview...',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          isThreeLine: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opened draft #$index')),
            );
          },
        );
      },
    );
  }
}
