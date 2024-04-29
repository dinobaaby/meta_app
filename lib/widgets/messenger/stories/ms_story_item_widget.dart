import 'package:flutter/material.dart';

class MessengerStoryItemWidget extends StatelessWidget {
  const MessengerStoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 240,
         decoration: BoxDecoration(
           image: const DecorationImage(
             image: NetworkImage("https://scontent.fhan2-3.fna.fbcdn.net/v/t39.30808-6/434456362_3599157587061574_725943163596973995_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFaqCZZlywSvvMPIPytAvkea0CgE5wjBvlrQKATnCMG-c6UNElMcOgTjcfFfHxYpMLpmb0jCb7m2Czp7bSq5os1&_nc_ohc=8seVWxjSd6IAX8oZN5w&_nc_ht=scontent.fhan2-3.fna&oh=00_AfDnZdaBOQSyIEuPhz3Jd3xa4tYzI3FEmVRHW0af6e0VuQ&oe=6611506E"),
             fit: BoxFit.cover
           ),
           borderRadius: BorderRadius.circular(15)
         ),
        ),
        Positioned(
            top: 15,
            left: 15,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage("https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/433105848_122134816658123903_123825777986155079_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGrSft4alyIM3OHGrQ5K-V5xRl5t9elgz3FGXm316WDPZc7bbfSfoKlFn4ewkJgCEYRo7L4H2qFDMooEjjFAnHk&_nc_ohc=O3_QjdosShoAX9PK5rA&_nc_ht=scontent.fhan20-1.fna&oh=00_AfBdxJs_ZzhHjiBge9poVCx9srv4YN2uuYGEi8jQiYqm0w&oe=6611434A"),
                  fit: BoxFit.cover
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.blue
                )
              ),

            )
        ),
        Positioned(
            top: 15,
            right: 10,
            child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)
                ),
            child: const Text("1", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
        )),
        Positioned(
            bottom: 15,
            left: 15,
            child: Text("Chu minh duc", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),)
        )
      ],
    );
  }
}
