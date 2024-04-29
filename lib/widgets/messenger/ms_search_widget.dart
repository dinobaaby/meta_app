import "package:flutter/material.dart";

class MessengerSearchWidget extends StatelessWidget {
  const MessengerSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(48, 48, 48, 1.0),
          borderRadius: BorderRadius.circular(20)
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed("/search"),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('Search', style: TextStyle(color: Colors.grey),),
            )
          ],
        ),
      ),
    );
  }
}


