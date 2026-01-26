<?php

namespace App\Http\Requests;

use App\Rules\IniAmount;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ItemRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'name'            => [
                'required',
                'string',
                'max:190',
                Rule::unique("items", "name")->whereNull('deleted_at')->ignore($this->route('item.id'))
            ],
            'item_category_id' => ['required', 'numeric', 'not_in:0'],
            'tax_id'           => ['nullable', 'numeric', 'not_in:0'],
            'item_type'        => ['required', 'numeric', 'not_in:0'],
            'price'            => ['required', 'numeric', 'min:0'],
            'is_featured'      => ['required', 'numeric', 'not_in:0'],
            'is_variable'      => ['required', 'numeric', 'not_in:0'],
            'description'      => ['nullable', 'string', 'max:5000'],
            'caution'          => ['nullable', 'string', 'max:5000'],
            'status'           => ['required', 'numeric', 'max:24'],
            'order'            => ['required', 'numeric'],
            'variations'       => ['nullable', 'json'],
            'image'            => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:2048'],
        ];
    }

    /**
     * Configure the validator instance.
     */
    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $isVariable = $this->input('is_variable');
            $price = $this->input('price');
            
            // If product is not variable, price must be greater than 0
            if ($isVariable != 5 && $price <= 0) {
                $validator->errors()->add('price', 'This price must be greater than 0 for non-variable products.');
            }
            
            // Additional validation for price format
            if (!is_numeric($price)) {
                $validator->errors()->add('price', 'This price must be a number.');
                return;
            }
            
            if ($price < 0) {
                $validator->errors()->add('price', 'This price negative amount not allow.');
                return;
            }
            
            $replaceValue = str_replace('.', '', $price);
            if (strlen($replaceValue) > 12) {
                $validator->errors()->add('price', 'This price length can\'t be greater than 12 digit.');
                return;
            }
            
            if (!preg_match("/^\d{1,10}(\.\d{1,6})?$/", $price)) {
                $validator->errors()->add('price', 'This price amount provide invalid.');
                return;
            }
        });
    }

    public function attributes()
    {
        return [
            'item_category_id' => strtolower(trans('all.label.item_category_id')),
            'tax_id'           => strtolower(trans('all.label.tax_id')),
        ];
    }
}
