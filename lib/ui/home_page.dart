import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  late Future<List> _search;

  @override
  void initState() {
    super.initState();
    _search = _getSearch(
        'https://api.giphy.com/v1/gifs/trending?api_key=BF4RLvvSgkrzt3OXnfTFZgAKfTyx2lIJ&limit=25&rating=g');
  }

  // late String _search;

  // int _offset = 0;

  // Future<Map> _getGifs() async {
  //   http.Response response;

  //   if (_search == null) {
  //     response = await http.get(
  //         "https://api.giphy.com/v1/gifs/trending?api_key=BF4RLvvSgkrzt3OXnfTFZgAKfTyx2lIJ&limit=25&rating=g");
  //   } else {
  //     response = await http.get(
  //         "https://api.giphy.com/v1/gifs/search?api_key=BF4RLvvSgkrzt3OXnfTFZgAKfTyx2lIJ&q=$_search&limit=25&offset=$_offset&rating=g&lang=en");
  //   }

  //   return json.decode(response.body);
  // }

  // @override
  // void iniState() {
  //   super.initState();

  //   _getGifs().then((map) {
  //     print(map);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<List> _getSearch(String url) async {
    List list = [];

    Dio dio = Dio();
    await dio.get(url).then((response) {
      if (response.statusCode == 200) {
        list = response.data;
      } else {}
    });

    return list;
  }
}
