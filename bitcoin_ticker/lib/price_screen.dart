import 'dart:io';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

String Url = 'https://v6.exchangerate-api.com/v6/c3efe10bf6f814d8f8a8b53e/latest/USD';

class _PriceScreenState extends State<PriceScreen> {

  DropdownButton<String> AndroidPicker(){

    List<DropdownMenuItem<String>> dropdownitems = [];
    for(String i in currenciesList)
    {
      var currency = i;
      var newitem = DropdownMenuItem(
          child: Text(currency),
          value:currency);
      dropdownitems.add(newitem);
    }
    return DropdownButton<String>(
value: selecteditem,
items: dropdownitems,
onChanged: (String? value) {
setState(() {
selecteditem = value!;
print(selecteditem);
});
},);
  }
  CupertinoPicker IOSPicker()
  {
    List<Text> pickerItems = [];

    for(String currency in currenciesList)
    {
      pickerItems.add(Text(currency));

    }
    return CupertinoPicker(itemExtent: 32.0, onSelectedItemChanged: (selecteditem)
    {
      setState(() {
        print(selecteditem);
      });
    }, children:pickerItems,

    );

  }
  String selecteditem = "USD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isIOS?IOSPicker():AndroidPicker(),
          ),
        ],

      ),
    );
  }
}



