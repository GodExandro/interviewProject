import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/domain.dart';

const String apiURL =
    "https://recruitment-task.futuremind.dev/recruitment-task";

class DataService {
  Future<List<DataModel>> fetchData() async {
    try {
      //  http.Response response = await http.get(Uri.parse(apiURL));
      http.Response response = await http.get(Uri.parse(apiURL));
      List<dynamic> apiData = jsonDecode(response.body);

      return apiData.map((json) => DataModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Something gone wrong,");
    }
  }
}
