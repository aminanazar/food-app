import 'package:flutter/material.dart';
import 'package:foodlist/string_resource.dart';

import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                title: 'FOOD LIST',
      theme:ThemeData(primarySwatch: Colors.red),
      home: MyHome(),
    );
  }
}
class MyHome extends StatelessWidget{
        @override
  Widget build(BuildContext context){
          return Scaffold(
            appBar:AppBar(title:Text('${StringResource.app_name }'),
            ),
            body:_listView(context),
          );
        }
}
ListView _listView(BuildContext context)
{
  return ListView.builder(
            itemCount:StringResource.items.length,
            itemBuilder:(_, index){
               return Card(
                 child: ListTile(
                   title: Text('${StringResource.items[index]}',style:TextStyle(color:Colors.red,),),
                     subtitle: Text('price : ''${StringResource.price[index]}',style:TextStyle(color:Colors.blue),),
                   leading: Icon(Icons.shopping_cart,color:Colors.green,),
                   trailing:IconButton(icon:Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                   onPressed: (){
                     print("button pressed");
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>
                       Info(StringResource.items[index],StringResource.price[index]),
                       ),
                     );
                   },
                   ),
                   ),
               );
            },
  );
}