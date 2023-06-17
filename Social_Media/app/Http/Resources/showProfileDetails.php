<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class showProfileDetails extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->id,
            'first_name'=>$this->first_name,
            'last_name'=>$this->last_name,
            'gender'=>$this->gender,
            'birthdate'=>$this->birthdate,  
            'profile'=>$this->user_profile->toArray(),
            // 'job'=>$this->job,
            // 'study_place'=>$this->study_place,
            // 'place_stay'=>$this->place_stay,
            // 'place_born'=>$this->place_born,
            // 'bio'=>$this->bio,
            // 'cover_photo'=>$this->cover_photo,
            // 'profile_photo'=>$this->profile_photo,
            // 'followers_number'=>$this->followers_number,
            // 'state'=>$this->state,
            // 'user_id'=>$this->user_id,
        ];
    }

}
