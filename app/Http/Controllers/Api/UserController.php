<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Register new user.
     */
    public function register(Request $request)
    {
        try {
            $validateUser = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'email' => 'required|string|lowercase|email|max:255|unique:'.User::class,
                'password' => 'required'
            ]);
    
            if($validateUser->fails()){
                return response()->json([
                    'status'=> false,
                    'message'=> 'Error validate request',
                    'errors'=> $validateUser->errors()
                ], 401);
            }
    
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'role'=> 'user'
            ]);
    
            // event(new Registered($user));
    
            return response()->json([
                'status'=> true,
                'message'=> 'User registered successfully',
                'data'=> [
                    "access_token"=> $user->createToken("API_TOKEN")->plainTextToken
                ]
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ], 500);
        }
    }

    /**
     * Login user.
     */
    public function login(Request $request)
    {
        try {
            $validateUser = Validator::make($request->all(), [
                'email' => 'required|string|lowercase|email|max:255',
                'password' => 'required'
            ]);
    
            // Return error if request is not validated
            if($validateUser->fails()){
                return response()->json([
                    'status'=> false,
                    'message'=> 'Error validate request',
                    'errors'=> $validateUser->errors()
                ], 401);
            }

            // Return error if input email or password doesn't matched
            if(!Auth::attempt($request->only(['email', 'password']))){
                return response()->json([
                    'status'=> false,
                    'message'=> 'Email or password does not exist on our records.'
                ], 401);
            }

            $user = User::where('email', $request-> email)->first();
    
            return response()->json([
                'status'=> true,
                'message'=> 'User login successfully',
                'data'=> [
                    "access_token"=> $user->createToken("API_TOKEN")->plainTextToken
                ]
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ], 500);
        }
    }

    /**
     * Login user.
     */
    public function logout(Request $request)
    {
        try {
            $user = $request->user();

            if($user->tokens()->delete()){
                return response()->json([
                    'status'=> true,
                    'message'=> 'User logout successfully'
                ], 200);
            }

            return response()->json([
                'status'=> true,
                'message'=> 'Error logout user'
            ], 500);

        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ], 500);
        }
    }
}
