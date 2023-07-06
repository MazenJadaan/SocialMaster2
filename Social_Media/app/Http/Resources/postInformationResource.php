<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class postInformationResource extends JsonResource
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
            'user_id'=>$this->user_id,
            'post_body'=>$this->post_body,
            'user_profile_id'=>$this->user_profile_id,
            'post_time'=>$this->post_time,
            'post_date'=>$this->post_date,
            'created_at'=>$this->created_at->diffForHumans()
        ];
    }
}
