import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BmiState();
      }
    }
    
class BmiState extends State<Bmi>{
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "ບໍ່ຖືກກໍານົດ";

  void calculateBMI(){
    setState(() {
          int age = int.parse(_ageController.text);
          double height = double.parse(_heightController.text);
          double weight = double.parse(_weightController.text);

          if((_ageController.text.isNotEmpty || age > 0)
            && ((_heightController.text.isNotEmpty || height > 0)
            && (_weightController.text.isNotEmpty || weight > 0))){
              result = weight /(height*height);

              // if(double.parse(result.toStringAsFixed(1)) < 18.5){
              if(result <= 18.5)
                _resultReading = "ນໍ້າໜັກຕໍ່າກວ່າມາດຕະຖານ";
              else if(result <= 24.9)
                _resultReading = "ສົມສ່ວນ";
              else if(result <= 29.9)
                _resultReading = "ນໍ້າໜັກເກີນມາດຕະຖານ";
              else if(result <= 34.9)
                _resultReading = "ໂລກຕຸ້ຍ";             
              else{
                _resultReading = "ໂລກຕຸ້ຍອັນຕະລາຍ";
              }
            }
          else{
            result = 0.0;
            _resultReading = "ບໍ່ຖືກກໍານົດ";
          }
        });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('BMI'),
       centerTitle: true,
       backgroundColor: Colors.pinkAccent,
     ),
     body: new Container(
       alignment: Alignment.topCenter,
       child: new ListView(
         padding: const EdgeInsets.all(2.0),
         children: <Widget>[
           new Image.asset('images/bmilogo.png', height: 85.0, width: 75.0,),

           new Container(
             margin: const EdgeInsets.all(3.0),
             height: 300.0,
             width: 290.0,
             color: Colors.grey.shade300,
             child: Column(
               children: <Widget>[
                 TextField(
                   controller: _ageController,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                     labelText: 'ອາຍຸ',
                     hintText: 'E.g: 34',
                     icon: new Icon(Icons.person_outline)
                   ),
                 ),
                 TextField(
                   controller: _heightController,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                     labelText: 'ລວງສູງ ແມັດ',
                     hintText: 'E.g: 1.75',
                     icon: new Icon(Icons.insert_chart)
                   ),
                 ),
                 TextField(
                   controller: _weightController,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                     labelText: 'ນໍ້າໜັກ Kg',
                     hintText: 'E.g: 75',
                     icon: new Icon(Icons.line_weight)
                   ),
                 ),

                  new Padding(padding: new EdgeInsets.all(10.6)),

                 FlatButton(
                   onPressed: () => calculateBMI(),
                   color: Colors.pinkAccent,
                   child: new Text('Calculate'),
                   textColor: Colors.white,       
                 )
               ],
             ),
           ),

           new Padding(padding: new EdgeInsets.all(10.6)),

           new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new Text("ຄ່າດັດສະນີ BMI: $result" ,
               style: new TextStyle(
                 color: Colors.blueAccent,
                 fontWeight: FontWeight.w500,
                 fontStyle: FontStyle.italic,
                 fontSize: 19.9
               )),

               new Padding(padding: new EdgeInsets.all(10.6)),

                new Text(_resultReading ,
                style: new TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                )),
             ],
           ),
         ],
       )
     ),
    );
  }
}