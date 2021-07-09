import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _numberController = TextEditingController();
  var _val;
  List<String> _result = [];

  _methodA(int flag){
    setState(() {
      _result.clear();
    });
    _val = int.parse(_numberController.text);
    for(int i=1; i<=_val; i++){
      if(flag == 0 || flag == 2){
        setState(() {
          _result.add(i.toString());
        });
      }
      else{
        if(i%5 == 0){
          setState(() {
            _result.add("LIMA");
          });
        }
        else if(i%7 == 0){
          setState(() {
            _result.add("TUJUH");
          });
        }
        else{
          setState(() {
            _result.add(i.toString());
          });
        }
      }
    }
    if(flag == 2){
      print("tes");
      _methodB();
    }
  }

  _methodB(){
    _val = int.parse(_numberController.text);
    for(int i=_val-1; i>=1; i--){
      setState(() {
        _result.add(i.toString());
      });
    }
  }

  _methodC(){
    var _temp;
    setState(() {
      _result.clear();
    });
    _val = int.parse(_numberController.text);
    for(int i=0; i<_val; i++){
      if(i==0){
        setState(() {
          _result.add((_val*2).toString());
          _temp = _val*2;
        });
      }
      else{
        setState(() {
          _result.add((_temp+11).toString());
          _temp = _temp+11;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("1"),
                      onPressed: (){
                        _methodA(0);
                      },
                    ),
                    RaisedButton(
                      child: Text("2"),
                      onPressed: (){
                        _methodA(2);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("3"),
                      onPressed: (){
                        _methodC();
                      },
                    ),
                    RaisedButton(
                      child: Text("4"),
                      onPressed: (){
                        _methodA(1);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text("Result : "),
                Text(_result.isNotEmpty ? _result.toString() : "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
