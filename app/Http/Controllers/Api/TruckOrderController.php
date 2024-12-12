<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTruckOrderRequest;
use App\Http\Requests\UpdateTruckOrderRequest;
use App\Models\TruckOrder;
use Illuminate\Support\Facades\Auth;

class TruckOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $userId = Auth::id();
            $orders = TruckOrder::where('user_id', $userId)->get();
            
            return response()->json([
                'status'=> true,
                'message'=> 'Orders fetched successfully',
                'data'=> $orders
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTruckOrderRequest $request)
    {
        try {
            $data = $request->validated();
            $data['user_id'] = Auth::id();

            $order = TruckOrder::create($data);
            
            return response()->json([
                'status'=> true,
                'message'=> 'Order has been created successfully',
                'data'=> $order
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(TruckOrder $req, $order)
    {
        try {
            $userId = Auth::id();
            
            $data = TruckOrder::where([
                'id'=> $order, 
                'user_id'=> $userId
            ])->first();
            
            return response()->json([
                'status'=> true,
                'message'=> 'Order has been fetched successfully',
                'data'=> $data
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status'=> false,
                'message'=> $th->getMessage()
            ]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTruckOrderRequest $request, TruckOrder $truckOrder)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TruckOrder $truckOrder)
    {
        //
    }
}
