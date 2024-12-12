<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreTruckOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name'=> ['required', 'max: 255'],
            'contact'=> ['required', 'max: 12'],
            'company_name'=> ['nullable'],
            'description'=> ['nullable'],
            'size'=> ['required'],
            'weight'=> ['required'],
            'status'=> ['required', Rule::in(['pending', 'in_progress', 'delivered'])],
            'pickup_name' => ['required'],
            'pickup_address'=> ['required'],
            'pickup_city'=> ['required'],
            'pickup_postal_code'=> ['required'],
            'pickup_contact'=> ['required'],
            'pickup_datetime'=> ['required'],
            'destination_name'=> ['required'],
            'destination_address'=> ['required'],
            'destination_city'=> ['required'],
            'destination_postal_code'=> ['required'],
            'destination_contact'=> ['required'],
            'destination_datetime'=> ['required']
        ];
    }
}
