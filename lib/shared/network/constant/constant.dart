
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
  static String showProfileApi = 'api/showProfile/';
  static String createPostApi = 'api/create_post';
  static String editPostApi = 'api/updatePost/';
  static String forYouPageApi ='api/allWorld';
  static String followingPost ='api/MyfollowingPage';
  static String seeVideosApi='api/see_videos';
  static String deletePost ='api/deletePosts/';
  static String likeAtPost='api/Like/';
  static String dislikeAtPost='api/removeLike/';
  static String savePost= 'api/savePosts/';
  static String unSavePost='api/cancelSavePost/';
  static String followApi='api/followProfile/';
  static String unfollowApi='api/unFollow/';
  static String savedPosts='api/showSavedPosts';


  // unfinished APIs
  static String createStory ='api/addStories';






  //other constants
  static bool darkMode =false;
}