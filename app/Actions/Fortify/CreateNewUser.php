<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Laravel\Fortify\Contracts\CreatesNewUsers;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array<string, string>  $input
     */
    public function create(array $input): User
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique(User::class),
            ],
            'password' => $this->passwordRules(),
            'profile_img' => ['nullable', 'image', 'mimes:jpeg,png,jpg,webp', 'max:2048'],
        ])->validate();

        $profile_img = null;
        if (isset($input['profile_img']) && $input['profile_img'] instanceof \Illuminate\Http\UploadedFile) {
            $profile_img = $input['profile_img']->store('profiles', 'public');
        }

        $user = User::create([
            'name' => $input['name'],
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
            'profile_img' => $profile_img,
        ]);
        $user->assignRole(config('roles.user'));
        return $user;
    }
}
