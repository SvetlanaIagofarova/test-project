import 'package:flutter/material.dart';
import 'package:test_project/domain/api_client/api_client.dart';
import 'package:test_project/domain/const/const.dart';
import 'package:test_project/domain/entity/comments.dart';
import 'package:test_project/domain/entity/photos.dart';

class MainScreenViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final String insideImage = Const.insideImage;
  final String buttonOne = Const.buttonOne;
  final String buttonTwo = Const.buttonTwo;
  final String buttonThree = Const.buttonThree;

  var _comments = const <Comments>[];
  List<Comments> get comments => _comments;

  var _photos = const <Photos>[];
  List<Photos> get photos => _photos;

  Future<void> loadComments() async {
    _comments = await _apiClient.getComments();
    notifyListeners();
  }

  Future<void> loadPhotos() async {
    _photos = await _apiClient.getPhotos();
    notifyListeners();
  }
}
