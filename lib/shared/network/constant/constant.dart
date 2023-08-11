
class AppSetting{
  // user token
  static String token = "";

  // baseurl of the server
  static String baseUrl ="http://10.0.2.2:8000/";

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
  static String showProfileApi = 'api/showProfile/';

  // unfinished APIs

  //other constants
  static bool darkMode =false;
}