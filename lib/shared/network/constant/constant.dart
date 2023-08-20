class AppSetting{
  // user token
  static String token = "";

  // baseurl of the server
  static String baseUrl ="http://192.168.4.21:8000/";

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
  static String deletePostApi ='api/deletePosts/';
  static String likeAtPostApi='api/Like/';
  static String dislikeAtPostApi='api/removeLike/';
  static String savePostApi= 'api/savePosts/';
  static String unSavePostApi='api/cancelSavePost/';
  static String followApi='api/followProfile/';
  static String unfollowApi='api/unFollow/';
  static String savedPostsApi='api/showSavedPosts';
  static String sharePostApi='api/sharePost/';
  static String createStoryApi='api/addStories';
  static String searchUsers='api/searchUsers';
  static String showReactsApi='api/showAllReacts/';
  static String storyArchiveApi='api/showOldestStory';
  static String showFollwingStoryApi='api/showFollwingStory';
  static String deleteStoryApi='api/deleteStory/';
  static String sowMyStoryApi='api/showCurrentStory';
  static String writeComment ='api/writeComment/';
  static String showAllComments ='api/showAllComments/';
  static String deleteComment ='api/deleteComment/';
  static String myStoryApi='api/showCurrentStory';
  static String allShares='api/showShares/';

  // unfinished APIs

  static String editProfileInfoApi='api/addProfileInformations';






  //other constants
  static bool darkMode =false;
}