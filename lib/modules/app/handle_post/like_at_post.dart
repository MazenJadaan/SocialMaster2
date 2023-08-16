import 'package:http/http.dart' as http;
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';



Future likePost({required int postId})async{
  var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.likeAtPost}$postId");
  var response = await http.post(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});
  if (response.statusCode == 200) {
    print('like');
  }}

Future dislikePost({required int postId})async{
  var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.dislikeAtPost}$postId");
  var response = await http.delete(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});
  if (response.statusCode == 200) {
    print('dislike');
  }}
