import 'package:http/http.dart' as http;
import 'dart:convert';

class TimeZone {
  String url;

  TimeZone(this.url);

  Future getTimeData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String timezone = data['results'][0]['annotations']['timezone']['name'];
      response = await http.get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$timezone"),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    }
  }
}
