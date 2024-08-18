// import 'package:connection_demo/connection_demo.dart' as connection_demo;

// void main(List<String> arguments) {
//   print('Hello world: ${connection_demo.calculate()}!');
// }

//------------Exercise 1: Get a remote JSON.-----------------//

// for json decode
// import 'dart:convert';
// // for http connection
// import 'package:http/http.dart' as http;
// void main() async {
//   // Observe async and await
//   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
//   final response = await http.get(url);
//   if (response.statusCode != 200) {
//     print('Connection failed');
//     return;
//   }
//   final jsonResult = json.decode(response.body) as Map;
//   print("Title: ${jsonResult['title']}");
//   print("Body: ${jsonResult['body']}");
// }


// ------------Exercise 2: Get a remote JSON array.-------------//
// import 'dart:convert';
// import 'package:http/http.dart' as http;


// void main() async {
//   final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
//   final response = await http.get(url);
//   if (response.statusCode != 200) {
//     print('Connection failed');
//     return;
//   }
//   final jsonResult = json.decode(response.body) as List;
//   print(jsonResult[0]['name']);
//   print(jsonResult[0]['address']['city']);
// }


// // for json decode
// import 'dart:convert';
// // for http connection
// import 'package:http/http.dart' as http;
// void main() async {
//   final url = Uri.parse('http://localhost:3000/expenses');
//   final response = await http.get(url);
//   if (response.statusCode != 200) {
//     print('Failed to retrieve the http package!');
//     return;
//   }
//   // the body is JSON string
//   final jsonResult = json.decode(response.body) as List;


//   print("------------- All expenses ----------");
//   for (var exp in jsonResult) {
//     print("${exp['id']}. ${exp['item']} : ${exp['paid']}฿");
//   }
// }



// https://api.dart.dev/stable/3.4.4/dart-core/DateTime-class.html


// for json decode
import 'dart:convert';
// for http connection
import 'package:http/http.dart' as http;


void main() async {
  final url = Uri.parse('http://localhost:3000/expense');
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  // the body is JSON string
  final jsonResult = json.decode(response.body) as List;


  int total = 0;
  print("------------- All expenses ----------");
  for (var exp in jsonResult) {
    // print(exp['id'].runtimeType);
    // print(exp['item'].runtimeType);
    // print(exp['paid'].runtimeType);
    // print(exp['date'].runtimeType);


    // get datetime and convert to local time zone
    // cast by ‘as DateTime’ should also work
    final dt = DateTime.parse(exp['date']);
    final dtLocal = dt.toLocal();
    // print('${dtLocal.day}/${dtLocal.month}/${dtLocal.year}');
    // print('${dtLocal.hour}:${dtLocal.minute}');


    print(
        "${exp['id']}. ${exp['item']} : ${exp['paid']}฿ @ ${dtLocal.toString()}");
    // exp['paid'] is considered type of 'num' in dart, need to cast to 'int'
    total += exp['paid'] as int;
  }
  print("Total expenses = $total฿");
}







