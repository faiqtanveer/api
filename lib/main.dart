import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Color(0xff22343c);
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  List users = [];
  var data;
  bool isLoaded = false;



  getApiData() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://api.preview.platform.athenahealth.com/v1/1128700/providers"),
        headers: {
          "Accept": 'application/json',
          'Authorization': 'Bearer ISHOANw8cJ5B7DIKIJ1ae916yCpo',
        }
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("sucess");
      data = jsonDecode(response.body)['providers'];

      ///final firstname =data[0]['firstname'];
      //firstname =data['providers'][0]['firstname'];
      //specialty =data['providers'][0]['specialty'];
      //providerid =data['providers'][0]['providerid'];
      //final firstname =data['totalcount'];
      //print(firstname);
      setState(() {
        users = data;
        isLoaded = true;
      });
    } else {
      print("sexy error hai bhaii");
      isLoaded = false;
    }
  }


  @override
  void initState() {
    //getData();
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider list'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) {
            return getCard(users[i]);
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),


    );
  }

  Widget getCard(item) {
    var fullName = item['firstname'];
    var specialty = item['specialty'];
    var specialtyid = item['specialtyid'];
    var schedulingname = item['schedulingname'];
    var providertypeid = item['providertypeid'];
    var billable = item['billable'];
    var scheduleresourcetype = item['scheduleresourcetype'];
    var lastname = item['lastname'];
    var providerid = item['providerid'];
    var providerusername = item['providerusername'];
    var hideinportal = item['hideinportal'];
    var entitytype = item['entitytype'];
    var providertype = item['providertype'];
    var createencounteroncheckin = item['createencounteroncheckin'];

    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("fullName: ${fullName==null?"no name":fullName}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("specialty : ${specialty == null ? "no specialty" : specialty}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("specialtyid : ${specialtyid == null ? "no specialtyid" : specialtyid}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("schedulingname : ${schedulingname == null ? "no schedulingname" : schedulingname}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("providertypeid : ${providertypeid == null ? "no providertypeid" : providertypeid}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("billable : ${billable == null ? "no billable" : billable}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("scheduleresourcetype : ${scheduleresourcetype == null ? "no scheduleresourcetype" : scheduleresourcetype}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("lastname : ${lastname == null ? "no lastname" : lastname}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("providerid : ${providerid == null ? "no providerid" : providerid}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("providerusername : ${specialty == null ? "no providerusername" : providerusername}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("hideinportal : ${hideinportal == null ? "no hideinportal" : hideinportal}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("entitytype : ${entitytype == null ? "no entitytype" : entitytype}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("providertype : ${providertype == null ? "no providertype" : providertype}", style: TextStyle(fontSize: 14),)),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 140,
                      child: Text("createencounteroncheckin : ${createencounteroncheckin == null ? "no createencounteroncheckin" : createencounteroncheckin}", style: TextStyle(fontSize: 14),)),


                  SizedBox(height: 10,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}














/*
class User{
   var totalcount;
  User(this.totalcount);
}
*/
/*
  var totalcount;

   Future getUserData()async{
     http.Response response;
     response =await http.get(
         Uri.parse("https://api.preview.platform.athenahealth.com/eolcQkKsfGiHbin8q8WKjKf85NOX/v1/:practiceid/providers"),
         headers:{
           "Accept":'application/json',
           "Authorization": "eolcQkKsfGiHbin8q8WKjKf85NOX"
         }
     );
     Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(response));
     //var jsonData = jsonDecode(response.body);
     //List users=[];

     *//*for(var u in jsonData){
       User user=User(u["totalcount"]);
       users.add(user);
     }*//*
*//*     users.add(data);
     print(data.length);*//*
     print(data);
     print(data.length);
     return data;
   }*/