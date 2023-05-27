<meta name="csrf-token" content="{{ csrf_token() }}">
<button id="rzp-button1" style="display : none">Pay with Razorpay</button>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_5KA16SMvOg9G8m", // Enter the Key ID generated from the Dashboard
    "amount": "<?php echo $order['total_amount'];?>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "<?php echo $order['first_name'];?>",
    "description": "Transaction",
    "image": "https://example.com/your_logo",
    "callback_url": "{{ route('razorpay.payment.store',$order->order_number) }}",
    "prefill": {
        "name": "<?php echo $order['first_name'];?>",
        "email": "<?php echo $order['email'];?>",
        "contact": "<?php echo $order['phone'];?>"
    },
    "notes": {
        "address": "<?php echo $order['address1'];?>"
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
document.getElementById('rzp-button1').click();
</script>