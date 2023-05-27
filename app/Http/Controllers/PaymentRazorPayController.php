<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Razorpay\Api\Api;
use Session;
use Exception; 
use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\User;
class PaymentRazorPayController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        //
    }

    public function store(Request $request,$id)
    {
        //dump($id);
        $input = $request->all();
  
        $api = new Api(env('RAZORPAY_KEY'), env('RAZORPAY_SECRET'));
  
        $payment = $api->payment->fetch($input['razorpay_payment_id']);

        if(count($input)  && !empty($input['razorpay_payment_id'])) {
            try {
                $response = $api->payment->fetch($input['razorpay_payment_id'])->capture(array('amount'=>$payment['amount']));
                //$orderID = $api->payment->fetch($input['razorpay_payment_id'])->capture(array('order_id'=>$payment['order_id']));

               
                //$order->Order::where('user_id', auth()->user()->id)->where('order_number', $id); 
                //dump($response);  
                $order = Order::all();
                foreach($order as $orders){
                    if ($orders->order_number == $id) {
                        $orders->payment_status = 'paid';
                        $orders->save();
                    }
                }
                $cart = Cart::all();
                foreach($cart as $carts){
                    $carts->delete();
                }
                
                session()->forget('cart');
                session()->forget('coupon');
                request()->session()->flash('success','You successfully pay from Razorpay! Thank You');

            } catch (Exception $e) {
                return  $e->getMessage();
                Session::put('error',$e->getMessage());
                return redirect()->back();
            }
        }
        return redirect()->route('home');
    }
}


