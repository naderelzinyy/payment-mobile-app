<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BillInfo;

class BillInfoController extends Controller
{
    //
    public function index(){
        $info = BillInfo::get();
        return json_decode($info);
    }

    public function submit(Request $request): \Illuminate\Http\JsonResponse
    {
        $info = new BillInfo;
        $info->brand_name = $request->post("brand_name");
        $info->brand_id = $request->post("brand_id");
        $info->price = $request->post("price");
        $info->status = $request->post("status");
        $info->message = $request->post("message");
        $info->user_id = $request->post('payment_users_id');


        if($info->save()){
            return response()->json([
                "code" => 1,
                "msg" => "success",
            ]);
        }
        return response()->json([
            "code" => -1,
            "message" => "fail",
        ]);

    }
}
