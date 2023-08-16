import 'package:http/http.dart' as http;
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';


Future savePost({required int postId})async{
  var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.savePost}$postId");
  var response = await http.post(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});
  if (response.statusCode == 201) {
    print('saved');
  }}

Future unSavePost({required int postId})async{
  var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.unSavePost}$postId");
  var response = await http.delete(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});
  if (response.statusCode == 200) {
    print('unsaved');
  }else{
  print('error');
  }
}
