import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/network/network_request.dart';
import 'model/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListViewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ListViewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}
class _ListViewPageState extends State<ListViewPage>{
  List<Post> postData = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromServer){
      setState(() {
        postData =dataFromServer;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Http request"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: postData.length,
              itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${postData[index].title}",style: TextStyle(fontSize: 16, color: Colors.black45),),
                        SizedBox(height: 5),
                        Text("${postData[index].body}", style: TextStyle(fontSize: 14, color: Colors.green),)
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
