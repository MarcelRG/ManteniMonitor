import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/car.dart';
import '../providers/cars.dart';

class EditCarScreen extends StatefulWidget {
  static const routeName = '/edit-car';

  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen>{
  final _makerFocusNode = FocusNode();
  final _modelFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _editedCar = Car(
    id: null,
    plate: '',
    maker: '',
    model: '',
    description: '',
    imageUrl: '',
  );

  var _initValues = {
    'plate': '',
    'maker': '',
    'model': '',
    'description': '',
    'imageUrl': '',
  };

  var _isInit = true;
  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(_isInit){
      final productId = ModalRoute.of(context).settings.arguments as String;
      if(productId!=null){
        _editedCar = Provider.of<Cars>(context, listen: false).findById(productId);
        _initValues = {
          'plate': _editedCar.plate,
          'maker': _editedCar.maker,
          'model': _editedCar.model,
          'description': _editedCar.description,
          'imageUrl': '',
        };
        _imageUrlController.text = _editedCar.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    _imageFocusNode.removeListener(_updateImageUrl);
    _makerFocusNode.dispose();
    _modelFocusNode.dispose();
    _imageFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl(){
    if(!_imageFocusNode.hasFocus){
      setState(() {});
    }
  }

  void _saveForm(){
    final isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    if(_editedCar.id != null){
      Provider.of<Cars>(context, listen: false).updateCar(_editedCar.id, _editedCar);
    }else {
      Provider.of<Cars>(context, listen: false).addCar(_editedCar);
    }
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar camion'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
            TextFormField(
              initialValue: _initValues['plate'],
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(labelText: 'Matricula',),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_makerFocusNode);
              },
              validator: (value){
                if(value.isEmpty){
                  return 'Introduce la matricula.';
                }
                return null;
              },
              onSaved: (value){
                _editedCar = Car(
                  id: _editedCar.id,
                  isDriving: _editedCar.isDriving,
                  plate: value,
                  maker: _editedCar.maker,
                  model: _editedCar.model,
                  description: _editedCar.description,
                  imageUrl: _editedCar.imageUrl,
                );
              },
            ),
            TextFormField(
              initialValue: _initValues['maker'],
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Marca',),
              textInputAction: TextInputAction.next,
              focusNode: _makerFocusNode,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_modelFocusNode);
              },
              validator: (value){
                if(value.isEmpty){
                  return 'Ingresa la marca.';
                }
                return null;
              },
              onSaved: (value){
                _editedCar = Car(
                  id: _editedCar.id,
                  isDriving: _editedCar.isDriving,
                  plate: _editedCar.plate,
                  maker: value,
                  model: _editedCar.model,
                  description: _editedCar.description,
                  imageUrl: _editedCar.imageUrl,
                );
              },
            ),
            TextFormField(
              initialValue: _initValues['model'],
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Modelo',),
              textInputAction: TextInputAction.next,
              focusNode: _modelFocusNode,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_imageFocusNode);
              },
              validator: (value){
                if(value.isEmpty){
                  return 'Ingresa el modelo.';
                }
                return null;
              },
              onSaved: (value){
                _editedCar = Car(
                  id: _editedCar.id,
                  isDriving: _editedCar.isDriving,
                  plate: _editedCar.plate,
                  maker: _editedCar.maker,
                  model: value,
                  description: _editedCar.description,
                  imageUrl: _editedCar.imageUrl,
                );
              },
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(
                top: 8,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                )
              ),
              child: _imageUrlController.text.isEmpty
                ? Text('Ingresa el link de la imagen')
                : FittedBox(
                  child: Image.network(
                  _imageUrlController.text,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'URL de imagen'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                focusNode: _imageFocusNode,
                controller: _imageUrlController,
                onFieldSubmitted: (_){
                  _saveForm();
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Ingresa el link de la imagen.';
                  }
                  return null;
                },
                onSaved: (value){
                  _editedCar = Car(
                    id: _editedCar.id,
                    isDriving: _editedCar.isDriving,
                    plate: _editedCar.plate,
                    maker: _editedCar.maker,
                    model: _editedCar.model,
                    description: _editedCar.description,
                    imageUrl: value,
                  );
                },
                ),
            ),
            ],
          ),
        ],)),
      ),
    );
  }
}