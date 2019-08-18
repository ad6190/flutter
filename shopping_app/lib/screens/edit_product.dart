import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imgUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  var _isInit = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  var isLoading = false;
  var _editedProduct =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');

  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    _imgUrlFocusNode.addListener(_updateImgUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imgUrlFocusNode.removeListener(_updateImgUrl);
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imgUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .products
            .firstWhere((product) => product.id == productId);

        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': ''
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _updateImgUrl() {
    if (!_imgUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void saveForm() {
    final isValid = _form.currentState.validate();
    if (isValid) {
      _form.currentState.save();

      setState(() {
        isLoading = true;
      });
      if (_editedProduct.id != null) {
        Provider.of<Products>(context)
            .updateProduct(_editedProduct.id, _editedProduct);
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      } else {
        Provider.of<Products>(context).addProduct(_editedProduct).then((_) {
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                saveForm();
              },
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _form,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        initialValue: _initValues['title'],
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: value,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                        initialValue: _initValues['price'],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _priceFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_descFocusNode);
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: double.parse(value),
                            imageUrl: _editedProduct.imageUrl,
                          );
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        initialValue: _initValues['description'],
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        focusNode: _descFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_descFocusNode);
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description: value,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                          );
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 8, right: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: _imageUrlController.text.isEmpty
                                ? Text('Enter a URL')
                                : FittedBox(
                                    child:
                                        Image.network(_imageUrlController.text),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Image URL'),
//                        initialValue: _initValues['imageUrl'],
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              focusNode: _imgUrlFocusNode,
                              onFieldSubmitted: (_) => saveForm(),
                              onSaved: (value) {
                                _editedProduct = Product(
                                  id: _editedProduct.id,
                                  title: _editedProduct.title,
                                  description: _editedProduct.description,
                                  price: _editedProduct.price,
                                  imageUrl: value,
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
