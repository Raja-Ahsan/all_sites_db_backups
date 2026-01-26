<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Smartisan\Settings\Facades\Settings;
use PragmaRX\Countries\Package\Countries;

class ValidPhone implements Rule
{
    public $message = '';
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct() {}

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value): bool
    {
        $countryCode = Settings::group('company')->get('company_country_code');
        $country = Countries::where('cca3', $countryCode)->first();

        if ($country->dialling['national_number_lengths'][0] !== strlen($value)) {
            $this->message = 'The :attribute number should be ' . $country->dialling['national_number_lengths'][0] . ' digits long.';
            return false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message(): string
    {
        return $this->message;
    }
}