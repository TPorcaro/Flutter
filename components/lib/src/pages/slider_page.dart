import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
              Expanded(
                child: _createImg(),
              )
            ],
          )),
    );
  }

  _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Size of image ${_sliderValue.toInt()}',
      divisions: 20,
      onChanged: _checkboxValue
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
      value: _sliderValue,
      max: 300.0,
      min: 10.0,
    );
  }

  _createImg() {
    return Image(
      image: NetworkImage(
          'https://pps.whatsapp.net/v/t61.24694-24/239688832_679225669966752_1090630107997629394_n.jpg?ccb=11-4&oh=01_AVyIafSuKPS3OrO2BD8TXGx53P7xSXpCwfK4x1hOzs0BEw&oe=631D8B76'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  _createCheckbox() {
    return CheckboxListTile(
      value: _checkboxValue,
      onChanged: (value) {
        setState(() {
          _checkboxValue = value!;
        });
      },
      title: Text('Block Slider'),
    );
  }

  _createSwitch() {
    return SwitchListTile(
      value: _checkboxValue,
      onChanged: (value) {
        setState(() {
          _checkboxValue = value!;
        });
      },
      title: Text('Block Slider'),
    );
  }
}
