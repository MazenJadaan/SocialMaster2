<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class showStories extends JsonResource
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
            'story_body'=>$this->story_body,
            'story_date'=>$this->story_date,
            'story_time'=>$this->story_time,
            'story_date_expire'=>$this->story_date_expire,
            'media'=>$this->media,
            'created_at'=>$this->created_at->diffForHumans(),
            'profile'=>$this->userProfile->toArray(),
        ];
    }
}
