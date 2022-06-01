import 'package:http/http.dart' as http;

// Future<void> PostDownlink() async {
//   String url =
//       'https://loraiot.cattelecom.com/portal/iotapi/core/devices/343531314C378211/downlinkMessages';
//   Map<String, String> headers = {"Content-type": "application/json"};
//   // if you want to pass json along with it
//   String json = '{"payloadHex": "xxxxxx", "targetPorts": "xx"}';
//   // make POST request
//   Http.Response response = await Http.post(url, headers: headers, body: json);
//   // check the status code for the result
//   print('posted');
// }

Future<String> getToken() async {
  String url = 'https://loraiot.cattelecom.com/portal/iotapi/auth/token';
  String json = '{"username": "makelovepppp", "password": "Makelove123."}';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json);
  String token = response.body.substring(17, 44);
  //print(response.body);
  return token;
}

Future<void> postDownlink(String token,String payload) async {
  String url =
      'https://loraiot.cattelecom.com/portal/iotapi/core/devices/343531314C378211/downlinkMessages';
  String json = '{"payloadHex": "$payload", "targetPorts": "2"}';

  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json);

  print(response.body);
}
