
class AppSetting{

  // user token
  static String token = "";

  // baseurl of the server
  static String baseUrl ="http://192.168.1.6:8000/";

  // finished APIs
  static String showMyProfileApi = 'api/showMyProfile';
  static String updateProfileCoverApi ='api/updateProfileCover';
  static String updateProfilePictureApi ='api/updateProfilePicture';
  static String loginApi = 'api/login';
  static String signupApi ='api/register';
  static String completeRegisterApi = 'api/complete_register';
  static String forgotPasswordApi = 'api/forget-password';
  static String passwordCodeCheckApi ='api/code-check';
  static String updatePasswordApi = 'api/update-password';

  // unfinished APIs
  static String showProfileApi = 'api/showProfile/';
  static String createPostApi = 'api/create_post';

  //other constants
  static bool darkMode =false;
}