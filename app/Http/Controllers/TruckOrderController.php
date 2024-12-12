<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTruckOrderRequest;
use App\Http\Requests\UpdateTruckOrderRequest;
use App\Models\TruckOrder;
use App\Models\User;
use App\Notifications\ContactOrder as NotificationsContactOrder;
use App\Notifications\App as InAppNotifications;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Inertia\Inertia;

use function Ramsey\Uuid\v1;

class TruckOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders = TruckOrder::all();
        return Inertia::render('Orders/Index', [
            'orders'=> $orders,
            'success'=> session('success')
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Orders/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTruckOrderRequest $request)
    {
        $data = $request->validated();
        $data['user_id'] = Auth::id();
        $order = TruckOrder::create($data);

        $admin = User::where('role', 'admin')->first();

        $notificationData = [
            'order_id' => $order-> id,
            'name' => Auth::user()->name,
            'user_id'=> Auth::user()->id
        ];

        Notification::send($admin, 
            new InAppNotifications('order', 'order_created', $notificationData)
        );

        return to_route('orders.index')->with('success', 'Order has been created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(TruckOrder $order)
    {
        $order = TruckOrder::find($order->id);
        return Inertia::render('Orders/Create', [
            'readonly'=> true,
            'order'=>  $order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TruckOrder $order)
    {
        $order = TruckOrder::find($order->id);
        return Inertia::render('Orders/Create', [
            'order'=>  $order
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTruckOrderRequest $request, TruckOrder $order)
    {        
        $truckOrder = TruckOrder::find($order->id);
        $truckOrder-> name = $request->name;
        $truckOrder-> contact = $request->contact;
        $truckOrder-> company_name = $request->company_name;
        $truckOrder-> description = $request->description;
        $truckOrder-> size = $request->size;
        $truckOrder-> weight = $request->weight;
        $truckOrder-> status = $request->status;
        $truckOrder-> pickup_name = $request->pickup_name;
        $truckOrder-> pickup_address = $request->pickup_address;
        $truckOrder-> pickup_postal_code = $request->pickup_postal_code;
        $truckOrder-> pickup_city = $request->pickup_city;
        $truckOrder-> pickup_contact = $request->pickup_contact;
        $truckOrder-> pickup_datetime = $request->pickup_datetime;
        $truckOrder-> destination_name = $request->destination_name;
        $truckOrder-> destination_address = $request->destination_address;
        $truckOrder-> destination_postal_code = $request->destination_postal_code;
        $truckOrder-> destination_city = $request->destination_city;
        $truckOrder-> destination_contact = $request->destination_contact;
        $truckOrder-> destination_datetime = $request->destination_datetime;
        $truckOrder-> updated_at = new DateTime('now');

        $truckOrder->save();

        return to_route('orders.index')->with('success', 'Order has been updated successfully.');
    }

    public function message($id){
        $order = TruckOrder::find($id);

        return Inertia::render('Orders/Message', [
            'user'=> $order->user,
            'order'=> $order
        ]);
    }

    public function sendMessage(Request $request){
        $user = User::findOrFail($request->userId);
        $subject = $request->subject;
        $message = $request->message;

        $user->notify(new NotificationsContactOrder($user, $subject, $message));

        return to_route('orders.index')->with('success', 'Message has been sent successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TruckOrder $truckOrder)
    {
        //
    }
}
