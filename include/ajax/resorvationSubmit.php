<?php

include ('../constant.php');
include (SERVER_INCLUDE_PATH.'db.php');
include (SERVER_INCLUDE_PATH.'function.php');
// pr($_POST);
$page = $_POST['page'];
global $hotelId;


$hotelDeatailArry = hotelDetail();
$bookingCode = getHotelServiceData('',$hotelId,'3')[0]['voucher'];
$slug = $hotelDeatailArry['slug'];
$hotelName = $hotelDeatailArry['hotelName'];

if(isset($_SESSION['reservatioId']) && $_SESSION['reservatioId'] !=''){
    $bookId = $_SESSION['reservatioId'];
}else{
    $code = ($bookingCode == '') ? $slug : $bookingCode;
    $bookId = $code.'-'.unique_id(6);
    $_SESSION['reservatioId'] = $bookId;
}

$checkInStr = safeData($_POST['checkIn']);
$checkInArr = explode('-',$checkInStr);

$checkIn = date('Y-m-d', strtotime($_POST['checkIn']));

$checkOut = date('Y-m-d', strtotime($_POST['checkOut']));

$nightCount = getNightCountByDay($checkIn, $checkOut);

$checkOut = (strtotime($checkIn) == strtotime($checkOut)) ? date('Y-m-d', strtotime('+1 day', strtotime($checkOut))) : $checkOut;

// $roomQuntity = safeData($_POST['roomQuntity']);
$reservationType = safeData($_POST['reservationType']);
$bookinSource = safeData($_POST['bookingSorcelist']);
$bsName = getBookingSource($bookinSource)[0]['name'];
$businessSource = (isset($_POST['businessSource'])) ? safeData($_POST['businessSource']) : 1;
$couponCode = safeData($_POST['couponCode']);
// $bookAvailable = safeData($_POST['bookAvailable']);

$selectRoom = $_POST['selectRoom'];
$selectRateType = $_POST['selectRateType'];
$selectAdult = $_POST['selectAdult'];
$selectChild = $_POST['selectChild'];
$roomNumArry = $_POST['roomNum'];

$guestName = safeData($_POST['guestName']);
$guestMobile = safeData($_POST['guestMobile']);
$guestEmail = safeData($_POST['guestEmail']);
$guestAddress = safeData($_POST['guestAddress']);

$paymentMethod = ($_POST['paymentMethod'] == '') ? 0: safeData($_POST['paymentMethod']);
$paidAmount = ($_POST['paidAmount'] == '')? 0 :safeData($_POST['paidAmount']);
$paymentRemark = safeData($_POST['paymentRemark']);
$reciptNo = generateRecipt();
$addBy =dataAddBy();


$retrodCom = hotelDetail()['commission'];

$billingMode = safeData($_POST['billingmode']);
$organisation = safeData($_POST['organisation']);
$companyname = safeData($_POST['companyname']);
$gstnumber = safeData($_POST['gstnumber']);
$traveltype  = safeData($_POST['traveltype']);
$bookingref = safeData($_POST['bookingref']);
$travelagent = (isset($_POST['travelagent'])) ? safeData($_POST['travelagent']) : '';
global $time;

mysqli_query($conDB, "insert into booking(bookinId,hotelId,reciptNo,payment_status,bookingSource,bussinessSource,paymethodId,userPay,couponCode,addBy,commission,billingMode,organisation,companynameid,gstno,traveltype,bookingref,travelagent,status,add_on) values('$bookId','$hotelId','$reciptNo','1','$bookinSource','$businessSource','$paymentMethod','$paidAmount','$couponCode','$addBy','$retrodCom','$billingMode','$organisation','$companyname','$gstnumber','$traveltype','$bookingref','$travelagent','$reservationType','$time')");

$lastId = mysqli_insert_id($conDB);
setPaymentTimeline($lastId,'',$lastId,$paidAmount,$paymentMethod,$paymentRemark,$addBy,'',$lastId);
$totalPrice = $_SESSION['reservationTotalPrice'];
setBookingFolio('',$guestName,$lastId,0,'',$paidAmount,'',$totalPrice,'','Booking','',$bsName);
if(isset($selectRoom)){
    foreach($selectRoom as $key=> $val){
        $room = $val;
        $rateType = $selectRateType[$key];
        $adult = $selectAdult[$key];
        $child = $selectChild[$key];
        $roomNum = $roomNumArry[$key];

        $roomPrice = getRoomPriceById($room,$rateType,$adult,$checkIn);
        $adultPrice = getAdultPriceByNoAdult($adult,$room,$rateType,$checkIn);
        $childPrice = getChildPriceByNoChild($child,$room,$rateType,$checkIn);

        $singleRoomPrice = SingleRoomPriceCalculator($room, $rateType, $adult, $child, 1, $nightCount, $roomPrice, $childPrice, $adultPrice, $couponCode)[0];
        $gstPerPrice = $singleRoomPrice['gstPer'];
        $totalPrice = $singleRoomPrice['total'];

            mysqli_query($conDB, "insert into bookingdetail(hotelId,bid,roomId,roomDId,adult,child,room_number,checkIn,checkOut,roomPrice,adultPrice,childPrice,gstPer,totalPrice,addOn) values('$hotelId','$lastId','$room','$rateType','$adult','$child','$roomNum','$checkIn','$checkOut','$roomPrice','$adultPrice','$childPrice','$gstPerPrice','$totalPrice','$time')");
            $lastBookingDetailId = mysqli_insert_id($conDB);
            
            mysqli_query($conDB, "insert into guestamenddetail(hotelId,bid,bdid) values('$hotelId','$lastId','$lastBookingDetailId')");
            mysqli_query($conDB, "insert into guest(hotelId,bookId,bookingdId,serial,name,email,phone,full_address,groupadmin,addOn) values('$hotelId','$lastId','$lastBookingDetailId','1','$guestName','$guestEmail','$guestMobile','$guestAddress',1,'$time')");
    }
}


$guestLastId = mysqli_insert_id($conDB);

$msg = generateInvoice('reservationGuest',$guestName,$lastId);
send_email($guestEmail, '', '', '', $msg, "Your Booking Confirmed : $hotelName");
$editLink = generateEditReservationLink($lastId);
$alert = 'Reservation <a class="pClr" target="_blank" href="'.$editLink.'">'.$bookId.'</a> has been created';
setActivityFeed('', 6, '', '', '', '', '', '', $alert);
unset($_SESSION['reservatioId']);
echo $page;


?>