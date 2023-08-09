import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../style/style.dart';
import '../utility/utility.dart';

var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

Future<bool> loginRequest(formValue) async {
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValue);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  print(resultBody);
  print(resultCode);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    // await writeUserData(resultBody);
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> registrationRequest(formValues) async {
  var url = Uri.parse("$baseUrl/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> verifyEmailRequest(email) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> verifyOTPRequest(email, otp) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> setPasswordRequest(formValues) async {
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValues);

  var response = await http.post(url, headers: requestHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

// Future<List> TaskListRequest(Status) async {
//   var URL=Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return ResultBody['data'];
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return [];
//   }
// }

// Future<bool> TaskCreateRequest(FormValues) async {

//   var URL=Uri.parse("${BaseURL}/createTask");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};

//   var PostBody=json.encode(FormValues);

//   var response= await http.post(URL,headers:RequestHeaderWithToken,body: PostBody);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return true;
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return false;
//   }
// }


// Future<bool> TaskDeleteRequest(id) async {
//   var URL=Uri.parse("${BaseURL}/deleteTask/${id}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return true;
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return false;
//   }
// }


// Future<bool> TaskUpdateRequest(id,status) async {
//   var url=Uri.parse("${BaseURL}/updateTaskStatus/${id}/${status}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     successToast("Request Success");
//     return true;
//   }
//   else{
//     errorToast("Request fail ! try again");
//     return false;
//   }
// }
