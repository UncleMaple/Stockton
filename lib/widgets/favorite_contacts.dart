import 'package:flutter/material.dart';
import 'package:stockton/mock_data/message_model.dart';
import 'package:stockton/screens/chat_screen.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/theme.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colorDeepBlack,
      child: Column(
        children: [
         Padding(
           padding: EdgeInsets.fromLTRB(20.0, 10.0,20.0,5.0),
           child: Center(
             child: Text(
               'STATUS',
               style: TextStyle(
                 color: AppTheme.colorClassicBlue,
                 fontSize: 22.0,
                 fontWeight: FontWeight.w600,
                 letterSpacing: 5.0,
               ),
             ),
           ),
         ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: favorites[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            color: whiteDark,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
