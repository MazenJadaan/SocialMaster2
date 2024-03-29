<?php

namespace App\Traits;

use App\Models\User;

trait PostsTrait {
   public function getProfilePosts($id){
       $posts = User::select('id', 'first_name', 'last_name')->where('id', $id)
           ->with(['post' => function ($query) {
               $query->orderBy('created_at', 'desc')->with('photo')->withCount('like')->withCount('comment')->withCount('sharePost');
           }])
           ->with(['Sharepost'=>function($q){
               $q->orderBy('created_at', 'desc')->with(['post'=>function($q2){
                   $q2->withCount(['like','comment','sharePost'])->with(['user'=>function($q3){
                       $q3->select('id','first_name','last_name')
                       ->with('user_profile',function ($q4){
                           $q4->select('user_id','profile_photo');
                       });
                   }])->with('photo');
               }]);
           }])->get();
       return $posts;
   }
}
