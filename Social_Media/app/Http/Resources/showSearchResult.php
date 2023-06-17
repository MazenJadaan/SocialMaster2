<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class showSearchResult extends JsonResource
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
            'first_name'=>$this->first_name,
            'last_name'=>$this->last_name,
            'profile'=>$this->user_profile->toArray(),
        ];
    }
}
