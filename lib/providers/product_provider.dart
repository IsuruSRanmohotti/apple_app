import 'dart:io';

import 'package:apple/controllers/product_controler.dart';
import 'package:apple/controllers/storage_controller.dart';
import 'package:apple/models/product_model.dart';
import 'package:apple/utils/custom_dialog.dart';
import 'package:apple/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;

  final TextEditingController _quantityController = TextEditingController();
  TextEditingController get quantityController => _quantityController;

  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> pickProductImage() async {
    _pickedImage = await CustomImagePicker().pickImage();
    notifyListeners();
  }

  Future<void> startAddProduct(BuildContext context) async {
    if (_pickedImage == null) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please select your product image');
    } else if (_nameController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please insert your product name');
    } else if (_descriptionController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please insert your product description');
    } else if (_priceController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again', content: 'Please insert price');
    } else if (_quantityController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again', content: 'Please insert product quantity');
    } else if (_selectedCategory == null) {
      CustomDialog.showDialog(context,
          title: 'Please try again', content: 'Please select product category');
    } else {
      CustomDialog.showLoader();
      String imageUrl = await StorageController.uploadImage(
          _pickedImage!, 'Product Images/$_selectedCategory');
      Product product = Product(
          image: imageUrl,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          name: _nameController.text,
          quantity: int.parse(_quantityController.text),
          category: _selectedCategory!);

      if (context.mounted) {
        ProductController().addProduct(product, context);
      }
    }
  }

  void clearProductData() {
    _pickedImage = null;
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _quantityController.clear();
    _selectedCategory = null;
    notifyListeners();
  }
}
