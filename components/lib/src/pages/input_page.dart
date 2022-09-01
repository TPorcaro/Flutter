import 'package:flutter/material.dart';
import 'dart:convert';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _date = '';
  List<String> _powers = ['Fly', 'X Rays', 'Super Strength', 'Super Speed'];
  String _selectedPower = 'Fly';
  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Name',
        helperText: 'Only name',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Mi Nombre es: $_nombre'),
      subtitle: Text('Mi Email es: $_email'),
      trailing: Text(_selectedPower),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Email',
        helperText: 'Only Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _createPassword() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_password.length}'),
        hintText: 'Password',
        helperText: 'Only Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  _createDate(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.datetime,
      controller: _inputFieldDateController,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_password.length}'),
        hintText: 'Date',
        helperText: 'Pick Date',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_month),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(
        width: 30.0,
      ),
      Expanded(
        child: DropdownButton<dynamic>(
          value: _selectedPower,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _selectedPower = opt;
            });
          },
        ),
      ),
    ]);
  }
}
