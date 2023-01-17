<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\support\Facades\Validator;


class AuthenticationController extends Controller
{
    //

    public function signup(Request $request): \Illuminate\Http\JsonResponse
    {

        $constraints = [
            'first_name'=>'required|string',
            'last_name'=>'required|string',
            'email'=>'required|string',
            'password'=>'required|string|min:8',
        ];

        $validator = Validator::make($request->all(), $constraints);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([
            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'email'=>$request->email,
            'password'=>Hash::make($request->password)
        ]);

        $token = $user->createToken('Personal Access Token')-> plainTextToken;
        $response = ['user'=>$user, 'token'=> $token];
        return response()->json($response, 200);

    }

    public function signin(Request $request): \Illuminate\Http\JsonResponse
    {
        $rules = [
            'email' => 'required',
            'password' => 'required|string'
        ];
        $request->validate($rules);
        $user = User::where('email', $request->email)->first();
        if ($user && Hash::check($request->password, $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['user' => $user, 'token' => $token];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Wrong credentials.'];
        return response()->json($response, 400);
    }
}
