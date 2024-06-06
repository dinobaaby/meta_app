import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacebookProfileScreen extends StatefulWidget {
  const FacebookProfileScreen({super.key});

  @override
  State<FacebookProfileScreen> createState() => _FacebookProfileScreenState();
}

class _FacebookProfileScreenState extends State<FacebookProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Trịnh Văn Hiếu", style: TextStyle(color: Colors.black, fontSize: 15),),
              Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text("5", style: TextStyle(color: Colors.white, fontSize: 10),),
              ),
              InkWell(
                child:  Container(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.arrow_drop_down),
                ),
              )
            ],
          ),
          iconTheme: const IconThemeData(
            color: Colors.black
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: const
            Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width*0.75,
                    ),
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width*0.6,
                        alignment: Alignment.topCenter,
                        decoration:const BoxDecoration(
                          color: Color.fromRGBO(206, 205, 205, 1.0)
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 75),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt,size: 16,),
                              SizedBox(width: 5,),
                              Text("Thêm ảnh bìa", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 70,
                        right: 10,
                        child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                            width: 2
                          )

                        ),
                        child: const Icon(Icons.camera_alt, size: 15,),
                      )
                    ),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.width*0.4,

                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                height: MediaQuery.of(context).size.width*0.4,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.4/2)
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: InkWell(
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white
                                        )
                                      ),
                                      child: Icon(Icons.camera_alt, size: 18,),
                                    ),
                              ))
                            ],
                          ),
                        )
                    )
                    

                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trinh Hieu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                        Text("Trang cá nhân - Người sáng tạo nội dung số", style: TextStyle(color: Colors.grey),)
                      ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
