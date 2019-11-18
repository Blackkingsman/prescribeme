import 'package:flutter/material.dart';

class MedicalPage extends StatelessWidget {
  List<String> data = ["Asthma", "Mumps"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Medical Info', style: TextStyle(color: Colors.black),),
        centerTitle: true,
         backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
            String item=data[i];
            return Dismissible(
              key: Key(item),
              onDismissed: (DismissDirection dir){
                //setState(()=>this.data.removeAt(i));
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Text(dir==DismissDirection.startToEnd?"Item removed":"Item Liked"),
                    action: SnackBarAction(
                        label: "UNDO",
                        onPressed: (){
                          //setState(()=>this.data.insert(i, item));
                        }
                    ),
                  ),
                );

              },
              background: Container(
                child: Icon(Icons.delete),
                color: Colors.red,
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: Container(
                child: Icon(Icons.thumb_up),
                color: Colors.green,
                alignment: Alignment.centerRight,
              ),
              child: ListTile(
                title: Text("${data[i]}"),
              ),
            );
          }
      ),
    );
  }
}
