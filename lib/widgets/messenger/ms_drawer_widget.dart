import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_drawer_action_widget.dart';

class MessengerDrawerWidget extends StatelessWidget {
  const MessengerDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero
        )
      ),
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      child: Container(

        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage('https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/434056217_122166962690032993_6311323901949295455_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFNii-hKL4Hj8b-HmQhLQqiJhb4pS9FJvImFvilL0Um8vz7gtINLIjnK4NlXOTm4SZTX1-C_k05oG_jvrERSW0V&_nc_ohc=-fyCyuGTmmwAX9KKToC&_nc_ht=scontent.fhan5-10.fna&oh=00_AfCcMfDSIjn7KkD3aLdg0BgzpusELfaT0RiT4jgGr2PwDQ&oe=66034B61'),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text("Trịnh Hiếu", style: TextStyle(color: title_ms_color, fontSize: 15, fontWeight: FontWeight.w600),)
                  ],
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.settings, color: Colors.white,)
                )


              ],
            ),
             const Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(height: 15,),
                     MessengerDrawerActionWidget(isChecked: true,),
                     MessengerDrawerActionWidget(isChecked: false,),
                     MessengerDrawerActionWidget(isChecked: false),
                     MessengerDrawerActionWidget(isChecked: false,),
                     SizedBox(height:10),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Cộng đồng", style: TextStyle(fontSize: 11, color: Colors.grey ),),
                         Text("Chỉnh sửa", style: TextStyle(color: action_appbar_ms_color, fontSize: 11),)
                       ],
                     ),

               
               
                   ],
               
                 ),
               
               ),
             )

          ],
        ),


        
      ),

    );
  }
}
