import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController password=TextEditingController();
  bool show=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
            const  Text("UserName",style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),),
          const   SizedBox(height: 10,),
            TextFormField(
              style:const  TextStyle(color: Colors.orange),
            decoration:const  InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),

              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),

              )
            ),

            ),
            const   SizedBox(height: 20,),
            const  Text("Password",style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),),
            const   SizedBox(height: 10,),
            Stack(
              children: [
                TextFormField(
                  onChanged: (val){
                    setState(() {

                    });
                  },
                  maxLength: 10,
                  controller: password,
                  obscureText: true,
                  style:const  TextStyle(color: Colors.orange),
                  decoration:  InputDecoration(

                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          show=!show;
                        });
                      },
                        child: const Icon(Icons.visibility,color: Colors.white,)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:   BorderSide(color: Colors.orange),

                      ),

                      enabledBorder:const  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),

                      )
                  ),

                ),
                show?ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(right: 30),
                    height: 60,
                   width: double.infinity,
                   decoration:const  BoxDecoration(
                     color: Colors.white,
                   ),
                    alignment: Alignment.centerLeft,
                    child: Text(

                      password.text,style: const TextStyle(color:Colors.black,fontSize: 20),
                    maxLines: 1,
                    ),
                  ),
                ):Container()
              ],
            ),
            const   SizedBox(height: 30,),
            InkWell(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text(
                  "Login",
                  style:  TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path=Path();
    // path ,lineTo is used to create the stright line from x to y
    path.lineTo(0,0 );
    path.lineTo(0, size.height);
    path.lineTo(size.width,size.height/2);
    path.close();

    return path;


  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

