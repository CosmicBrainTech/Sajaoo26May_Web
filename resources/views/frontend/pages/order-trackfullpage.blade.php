@extends('frontend.layouts.master')

@section('title','SAJAOO || Order Track Page')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">Home<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">Order Track</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

<section class="h-100 h-custom" style="background-color: #eee;">
<style>
@media (min-width: 1025px) {
.h-custom {
height: 100vh !important;
}
}

.horizontal-timeline .items {
border-top: 2px solid #ddd;
}

.horizontal-timeline .items .items-list {
position: relative;
margin-right: 0;
}

.horizontal-timeline .items .items-list:before {
content: "";
position: absolute;
height: 8px;
width: 8px;
border-radius: 50%;
background-color: #ddd;
top: 0;
margin-top: -5px;
}

.horizontal-timeline .items .items-list {
padding-top: 15px;
}

</style>
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card border-top border-bottom border-3" style="border-color: #f37a27 !important;">
          <div class="card-body p-5">

            <p class="lead fw-bold mb-5" style="color: #f37a27;">Purchase Reciept</p>

            <div class="row">
              <div class="col mb-3">
                <p class="small text-muted mb-1">Date</p>
                <p>{{$order->created_at}}</p>
              </div>
              <div class="col mb-3">
                <p class="small text-muted mb-1">Order No.</p>
                <p>{{$order->order_number}}</p>
              </div>
            </div>

            <div class="mx-n5 px-5 py-4" style="background-color: #f2f2f2;">
              <div class="row">
                <div class="col-md-8 col-lg-9">
                  <p>Price</p>
                </div>
                <div class="col-md-4 col-lg-3">
                  <p>{{$order->sub_total}}</p>
                </div>
              </div>
             
              <div class="row">
                <div class="col-md-8 col-lg-9">
                  <p class="mb-0">Payment Method</p>
                </div>
                <div class="col-md-4 col-lg-3">
                  <p class="mb-0">{{$order->payment_method}}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-md-8 col-lg-9">
                  <p class="mb-0">Payment Status</p>
                </div>
                <div class="col-md-4 col-lg-3">
                  <p class="mb-0">{{$order->payment_status}}</p>
                </div>
              </div>
            </div>

            <div class="row my-4">
              <div class="col-md-4 offset-md-7 col-lg-7 offset-lg-9">
                <p class="lead fw-bold mb-0" style="color: #f37a27;">Total : {{$order->sub_total}}</p>
              </div>
            </div>

            <p class="lead fw-bold mb-4 pb-2" style="color: #f37a27;">Tracking Order</p>

            <div class="row">
              <div class="col-lg-12">

                <div class="horizontal-timeline">

                  <ul class="list-inline items d-flex justify-content-between">
                    <li class="list-inline-item items-list">
                    @if($order->status=="new")
                    <p style="background-color: #f37a27;color:white;border-radius: 15px">Ordered</p>
					@else 
					<p>Ordered</p>
					@endif
                    </li>
                    <li class="list-inline-item items-list">
                    @if($order->status=="process")
                    <p style="background-color: #f37a27;color:white;border-radius: 15px">On the way</p>
					@else 
					<p>On the way </p>
					@endif
                    </li>
                    <li class="list-inline-item items-list text-end" style="margin-right: 8px;border-radius: 15px">
                    @if($order->status=="delivered")
                    <p style="margin-right: -8px; background-color: #f37a27;color:white;">Delivered</p>
					@else 
					<p style="margin-right: -8px;">Delivered</p>
					@endif
                      
                    </li>
                  </ul>

                </div>

              </div>
            </div>

            <p class="mt-4 pt-2 mb-0">Note : Estimated delivery time 4-5 days, Want any help? <a href="{{route('contact')}}" style="color: #f37a27;">Please contact
                us</a></p>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

@endsection

