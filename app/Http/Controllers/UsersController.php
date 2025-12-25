<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UsersController extends Controller
{
    public function index()
    {
        $authUser = current_user();

        $users = User::with('roles')
            ->where('id', '!=', $authUser->id)
            ->paginate(10);
        return view('screens.admin.users.index', compact('users'));
    }

    public function create()
    {
        return view('screens.admin.users.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create($request->all());
        if ($user->hasRole(config('roles.user'))) {
            return redirect()->route('users.index')->with('success', 'User created successfully');
        }
    }
}
