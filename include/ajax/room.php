<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include "../constant.php";
include SERVER_INCLUDE_PATH . "db.php";
include SERVER_INCLUDE_PATH . "function.php";
include SERVER_INCLUDE_PATH . "add_to_room.php";
$obj = new add_to_room();
$site = SERVER_INCLUDE_PATH;

// pr($_POST);

if (isset($_POST["type"])) {
    $type = $_POST["type"];

    if ($type == "load_checkout_section") {
        if (isset($_SESSION["room"]) && !empty($_SESSION["room"])) {
            if (isset($_SESSION["room"])) { ?>

                <div class="booking-summary-box mobile-margin-top" style="overflow:hidden">
                    <div class="room-booking-summary"><br>

                        <?php
                        $count = 0;
                        $totalPrice = 0;
                        $active = "";
                        foreach ($_SESSION["room"] as $key => $val) {

                            $rdid = explode("-", $key)[0];
                            $count++;

                            if ($count == 1) {
                                $active = "active";
                            } else {
                                $active = "";
                            }

                            $total_price = 0;
                            $rid = $_SESSION["room"][$key]["roomId"];
                            $child = $_SESSION["room"][$key]["child"];
                            $adult = $_SESSION["room"][$key]["adult"];
                            $checkInTime = $_SESSION["room"][$key]["checkIn"];
                            $checkInOut = $_SESSION["room"][$key]["checkout"];
                            $noAdult = $_SESSION["room"][$key]["adult"];
                            $noRoom = $_SESSION["room"][$key]["room"];
                            $night = $_SESSION["room"][$key]["night"];

                            $percentage = settingValue()["PartialPaymentPrice"];

                            if (roomExist($rid, $checkInTime) == 0) {
                                $obj->removeroom($key);
                            }

                            $roomPrice = getRoomPriceById($rid, $rdid, $adult, $checkInTime);
                            $adultPrice = getAdultPriceByNoAdult($adult, $rid, $rdid, $checkInTime);
                            $childPrice = getChildPriceByNoChild($child, $rid, $rdid, $checkInTime);

                            if (isset($_SESSION["couponCode"])) {
                                $couponCode = $_SESSION["couponCode"];
                            } else {
                                $couponCode = "";
                            }

                            $singleRoomPriceCalculator = SingleRoomPriceCalculator($rid, $rdid, $adult, $child, $noRoom, $night, $roomPrice, $childPrice, $adultPrice, $couponCode);


                            if (isset($_SESSION["couponCode"])) {
                                $code = $_SESSION["couponCode"];
                                $value = "";
                                $couponHTML = "<li style='display: flex;'><div style='width: 100%;position: relative;justify-content: space-between;align-items: center;background: #f1f1f1;padding: 5px 10px;'><span>Coupon</span> <div style='position: relative;'> <small style='color: green;font-weight: 700;'>$code</small>  <span id='couponCloss' style='position: absolute;top: -35px;right: -20px;cursor: pointer;background: red;width: 20px;height: 20px;border-radius: 50%;display: flex;justify-content: center;align-items: center;color: white;font-weight: 700;'>X</span></div> </div></li>";
                            } else {
                                $couponHTML = '<li id="couponInputContent" style="display: flex;"><div class="content"><input id="couponValue" type="text" placeholder="Enter Coupon Code"> </div> <input type="submit" value="Add Coupon" id="add_coupon"> </li> <li style="display: block;padding: 0;height: auto; border-top: none !important"><span id="couponCodeError" style="padding: 5px 0;font-size: 12px;color: red;font-weight: 500;"></span></li>';
                            }

                            $totalPrice += $singleRoomPriceCalculator[0]["total"];
                        ?>


                            <div class="guestContent <?php echo $active; ?>">
                                <div class="closeGuestContent badge bg-gradient-danger shadow" data-key="<?php echo $key; ?>">X</div>
                                <?php if (
                                    isset($_SESSION["payByRoom"]) &&
                                    $_SESSION["payByRoom"] == "Yes"
                                ) {
                                    echo "<input class='payByRoom' name='payByRoom' type='checkbox' value='$key'>";
                                } ?>
                                <div class="box1">
                                    <div id="day-list">
                                        <div class="day-list" style="max-width: 300px;margin: 0 auto;">
                                            <div class="row">
                                                <div class="col-md-8 m4">
                                                    <ul style="text-align: left;">
                                                        <li style="display: inline-block;"><b>Check In:</b> <span class="roomCheckinDate"></span>
                                                            <?php echo formatingDate(
                                                                $checkInTime
                                                            ); ?>
                                                            </span>
                                                        </li>
                                                        <li style="display: inline-block;"><b>Check Out:</b> <span class="roomCheckoutDate <?php echo $key; ?>">
                                                                <?php echo formatingDate(
                                                                    $checkInOut
                                                                ); ?>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4 m4">

                                                    <div class="quantity">
                                                        <a data-key="<?php echo $key; ?>" data-rid="<?php echo $rid; ?>" href="#" class="quantity__minus"><span>-</span></a>
                                                        <input name="quantity" type="text" class="quantity__input noOfight <?php echo $key; ?>" value="<?php echo $night; ?>">
                                                        <a data-key="<?php echo $key; ?>" data-rid="<?php echo $rid; ?>" href="#" class="quantity__plus"><span>+</span></a>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="container-">
                                        <div id="room_summary">
                                            <div class="room_summary_box">
                                                <p><b>
                                                        <?php echo ucfirst(
                                                            getRoomHeaderById($rid)
                                                        ); ?>
                                                    </b></p>
                                                <ul>
                                                    <li><span>Room Price: </span> <span>Rs
                                                            <?php echo $singleRoomPriceCalculator[0]["room"]; ?>
                                                        </span></li>

                                                    <li>
                                                        <span>Adults:
                                                            <?php echo $singleRoomPriceCalculator[0]["adultPrint"]; ?>
                                                        </span>
                                                        <span>Rs
                                                            <?php echo $singleRoomPriceCalculator[0]["adult"]; ?>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span>Child:
                                                            <?php echo $singleRoomPriceCalculator[0]["childPrint"]; ?>
                                                        </span>
                                                        <span>Rs
                                                            <?php echo $singleRoomPriceCalculator[0]["child"]; ?>
                                                        </span>
                                                    </li>

                                                    <?php
                                                    if (
                                                        $singleRoomPriceCalculator[0]["couponCode"] != ""
                                                    ) {
                                                        $couponPer = $singleRoomPriceCalculator[0]["couponCode"];
                                                        $couponPrice = $singleRoomPriceCalculator[0]["couponPrice"];
                                                        echo '<li><span>Coupon ( ' . $couponPer . ' ):</span> <span id="gstPrint">- Rs ' . $couponPrice . '</span></li>';
                                                    }

                                                    $nightPrice =
                                                        $singleRoomPriceCalculator[0]["nightPrice"];

                                                    echo "<li>
                                                        <span>Night</span>
                                                        <span>Rs <strong class='roomNightUpdate $key'>$nightPrice</strong> </span>
                                                    </li>
                                                ";
                                                    ?>

                                                    <li>
                                                        <span>GST (
                                                            <?php echo $singleRoomPriceCalculator[0]["gstPer"]; ?>% ):
                                                        </span> <span id="gstPrint">Rs <strong class="updateRoomGst <?php echo $key; ?>">
                                                                <?php echo $singleRoomPriceCalculator[0]["gst"]; ?>
                                                            </strong></span>
                                                    </li>

                                                    <li>
                                                        <span>Total:</span> <span>Rs <strong class="updateRoomTotalPrice <?php echo $key; ?>">
                                                                <?php echo $singleRoomPriceCalculator[0]["total"]; ?>
                                                            </strong></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="box2">
                                    <div class="content">
                                        <div class="drow">
                                            <h4>
                                                <?php echo ucfirst(getRoomHeaderById($rid)); ?>
                                            </h4>
                                            <p class="shortDateUpdate <?php echo $key; ?>">
                                                <?php echo getDateFormatByTwoDate(
                                                    $checkInTime,
                                                    $checkInOut
                                                ); ?>
                                            </p>
                                        </div>
                                        <div class="drow">
                                            <ul>
                                                <li>
                                                    <img src="<?php echo FRONT_SITE_IMG; ?>icon/adult.png" alt="Adult Icon">
                                                    <p>
                                                        <?php echo $adult; ?>
                                                    </p>
                                                </li>
                                                <li>
                                                    <img src="<?php echo FRONT_SITE_IMG; ?>icon/child.png" alt="Child Icon">
                                                    <p>
                                                        <?php echo $child; ?>
                                                    </p>
                                                </li>
                                            </ul>
                                            <strong>Rs <span class="totalRoomPriceupdate <?php echo $key; ?>">
                                                    <?php echo $singleRoomPriceCalculator[0]["total"]; ?>
                                                </span>
                                            </strong>
                                        </div>
                                    </div>
                                </div>


                            </div>

                        <?php
                        }
                        ?>

                        <ul>
                            <li id="pickupContent" style="display:none"></li>
                            <?php
                            echo $couponHTML;

                            $_SESSION["gossCharge"] = $totalPrice;
                            ?>

                        </ul>

                        <div class="room-services"><br></div>
                        <?php $_SESSION["roomTotalPrice"] = $totalPrice; ?>
                        <div class="room_summary_box row" style="margin: 0;">
                            <div class="col-6">Total Amount</div>
                            <div class="col-6" style="display: flex;justify-content: end;"> <b>Rs <span id="totalPriceValue">
                                        <?php echo number_format(
                                            totalSessionPrice()["price"],
                                            2
                                        ); ?>
                                    </span></b>
                            </div>
                        </div>
                        <br />
                        <div style="display: inline-block;margin-bottom: 15px;">
                            <?php
                            $pickUp = settingValue()["pckupDropCaption"];
                            if (settingValue()["pckupDropStatus"] == 1) {
                                $select = "";
                                calculateTotalBookingPrice();
                                if (isset($_SESSION["pickUp"]) && $_SESSION["pickUp"] != "") {
                                    $select = "checked";
                                }
                                echo '<div class="pickup">
                                    <input ' . $select . ' type="checkbox" name="pickup" id="pickup">
                                    <label for="pickup">Pick & Drop <span class="tool" data-tooltip="' . $pickUp . '"><i class="far fa-question-circle"></i></span></label>
                                </div>';
                            }
                            ?>

                            <?php
                            $partial = settingValue()["partialPaymentCaption"];
                            if (settingValue()["partialPaymentStatus"] == 1) {
                                calculateTotalBookingPrice();
                                $select = "";
                                if (
                                    isset($_SESSION["partial"]) &&
                                    $_SESSION["partial"] == "Yes"
                                ) {
                                    $select = "checked";
                                }
                                echo '<div class="partial">
                                        <input ' . $select . ' type="checkbox" name="partial" id="partial">
                                        <label for="partial">Pay ' . $percentage . '% Now<span class="tool" data-tooltip="' . $partial . '"><i class="far fa-question-circle"></i></span></label>
                                </div>';
                            }
                            ?>

                            <?php
                            $payByRoom = settingValue()["payByRoom"];
                            if ($payByRoom == 1) {
                                $select = "";
                                if (
                                    isset($_SESSION["payByRoom"]) &&
                                    $_SESSION["payByRoom"] == "Yes"
                                ) {
                                    $select = "checked";
                                }
                                echo '  <div class="payByRoom">
                                        <input type="checkbox" name="payByRoom" ' . $select . ' id="payByRoom">
                                        <label for="payByRoom">Pay By Room<span class="tool" data-tooltip="' . $payByRoom . '"> <i class="far fa-question-circle"></i></span></label>
                                    </div>';
                            }
                            ?>


                        </div>
                        <div class="room_summary_box" style="display: flex;justify-content: space-between;align-items: self-start;">


                            <?php
                            $BookingSite = FRONT_BOOKING_SITE;
                            echo "<div> <a href='$BookingSite' class='btn btn-outline-info'><span class=''> Add Room</span></a></div>";

                            echo "<div class='btn btn-primary' id='continue_btn'> <span class=''> Continue</span></div>";
                            ?>

                        </div>
                    </div>
                </div>
        <?php } else {
                echo "<img src='admin/img/icon/spinner.gif' style='width: 128px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);'>";
            }
        }
    }

    if ($type == "add_room") {
        $slug = $_POST["slug"];

        $header = $_POST["header"];
        $bedType = $_POST["bedType"];
        $roomCapacity = $_POST["roomCapacity"];
        $amenities = $_POST["amenities"];
        $titlearr = $_POST["title"];
        $singleRoomPriceArr = $_POST["singleRoomPrice"];
        $doubleRoomPriceArr = $_POST["doubleRoomPrice"];
        $image = $_POST['imgFile'];
        $noAdult = $_POST["noAdult"];
        $noChild = $_POST["noChild"];
        $extraAdultArr = $_POST["extraAdult"];
        $extraChildArr = $_POST["extraChild"];
        $mrp = $_POST["mrp"];
        $roomNumber = array_filter(explode(",", $_POST["roomNumber"]));
        $roomdesc = "";
        $added_on = date("Y-m-d h:i:s");

        $hotelId = $_SESSION["HOTEL_ID"];
    
        mysqli_query($conDB, "insert into room(slug,hotelId,header,bedtype,roomcapacity,noAdult,noChild,description,add_on,status,mrp) values('$slug','$hotelId','$header','$bedType','$roomCapacity','$noAdult','$noChild','$roomdesc','$added_on','1','$mrp')");
        $rid = mysqli_insert_id($conDB);


        foreach($_SESSION['roomNumUpload'] as $item){
            $item = $item['roomNo'];
            mysqli_query($conDB, "update roomnumber set roomId = '$rid' where roomNo = '$item'");
        }

        unset($_SESSION['roomNumUpload']);

        foreach ($amenities as $key => $val) {
            mysqli_query($conDB, "insert into room_amenities(room_id,amenitie_id) values('$rid','$val')");
        }

        foreach ($image as $key => $val) {
            mysqli_query($conDB, "insert into room_img(room_id,image) values('$rid','$val')");
        }

        foreach ($roomNumber as $key => $val) {
            $roomNumber = $val;
            setRoomNumerByData("add", $roomNumber, $rid);
        }

        foreach ($titlearr as $key => $val) {
            $title = $titlearr[$key];
            $singleRoomPrice = $singleRoomPriceArr[$key];
            $doubleRoomPrice = $doubleRoomPriceArr[$key];
            $extraAdult = $extraAdultArr[$key];
            $extraChild = $extraChildArr[$key];

            echo "insert into roomratetype(room_id,title,singlePrice,doublePrice,extra_adult,extra_child,status) values('$rid','$title','$singleRoomPrice','$doubleRoomPrice','$extraAdult','$extraChild','1')";
            mysqli_query(
                $conDB, "insert into roomratetype(room_id,title,singlePrice,doublePrice,extra_adult,extra_child,status) values('$rid','$title','$singleRoomPrice','$doubleRoomPrice','$extraAdult','$extraChild','1')"
            );
        }
    }

    if ($type == "update_room") {
        // pr($_POST);
        $update_id = $_POST["update_id"];
        $header = $_POST["header"];
        $bedType = $_POST["bedType"];
        $roomCapacity = $_POST["roomCapacity"];
        $roomdesc = $_POST["roomdesc"];
        $roomNumberDisplay = $_POST["roomNumberDisplay"];
        $roomNumberarry = explode(",", $roomNumberDisplay);
        $oldRumNumberArry = getRoomNumber("", "", $update_id, "", "", "", "", "", "", "", "yes");
        $removeRoomNumArry = array_diff($oldRumNumberArry, $roomNumberarry);
        $insertRoomNumArry = array_diff_assoc(
            $roomNumberarry,
            $oldRumNumberArry
        );
        

        $noAdult = $_POST["noAdult"];
        $noChild = $_POST["noChild"];
        
        $added_on = date("Y-m-d h:i:s");
        $mrp = $_POST["mrp"];

        mysqli_query(
            $conDB,
            "update room set header = '$header', bedtype = '$bedType', roomcapacity='$roomCapacity' , noAdult='$noAdult', noChild='$noChild',mrp='$mrp',description='$roomdesc' where id='$update_id'"
        );


        if (isset($_POST["title"])) {
            $titlearr = $_POST["title"];
            $singleRoomPriceArr = $_POST["singleRoomPrice"];
            $doubleRoomPriceArr = $_POST["doubleRoomPrice"];
            $extraAdultArr = $_POST["extraAdult"];
            $extraChildArr = $_POST["extraChild"];
            $room_detail_id = $_POST["room_detail_id"];

            foreach ($titlearr as $key => $val) {
                $title = $titlearr[$key];
                $singleRoomPrice = $singleRoomPriceArr[$key];
                $doubleRoomPrice = $doubleRoomPriceArr[$key];
                $extraAdult = $extraAdultArr[$key];
                $extraChild = $extraChildArr[$key];
                $rdid = $room_detail_id[$key];
                
                if($rdid != ''){
                    $ratePlanSql = "update roomratetype set title = '$title', singlePrice = '$singleRoomPrice', doublePrice = '$doubleRoomPrice', extra_adult = '$extraAdult',  extra_child = '$extraChild' where id = '$rdid'";
                }else{
                    $ratePlanSql = "insert into roomratetype(room_id,title,singlePrice,doublePrice,extra_adult,extra_child) values('$update_id','$title','$singleRoomPrice','$doubleRoomPrice','$extraAdult','$extraChild')";
                }
                echo $ratePlanSql;
                mysqli_query($conDB,$ratePlanSql);
            }
        }

        $amenities = $_POST["amenities"];
        $amenitiesLoop = getAmenitieIdByRoomId($update_id);
        foreach ($amenitiesLoop as $num) {
            if (!in_array($num, $amenities)) {
                mysqli_query(
                    $conDB,
                    "delete from room_amenities where room_id = '$update_id' and amenitie_id = '$num'"
                );
            }
        }

        foreach ($amenities as $key => $val) {
            if (checkAmenitiesById($update_id, $val) == 0) {
                mysqli_query(
                    $conDB,
                    "insert into room_amenities(room_id,amenitie_id) values('$update_id','$val')"
                );
            }
        }
        
        
        echo 1;
    }

    if ($type == "add_guest_section") {

        //    pr($_POST);
        $id = $_POST["id"];
        $room_id = $_POST["room_id"];
        $room = $_POST["room"];

        // $userRoomChoose = $_SESSION['userRoomChoose'];

        $adultNo = roomMaxCapacityById($room_id);
        $adultList = "";
        for ($i = 1; $i <= $adultNo; $i++) {
            if ($i == getMinRoomAdultCountByIdRdid($room_id, $id)) {
                $adultList .= "<option selected value='$i'>$i</option>";
            } else {
                $adultList .= "<option value='$i'>$i</option>";
            }
        }

        $childAve = 2;
        $childList = "";
        for ($i = 0; $i <= $childAve; $i++) {
            if ($i == getRoomChildCountById($room_id)) {
                $childList .= "<option selected value='$i'>$i</option>";
            } else {
                $childList .= "<option value='$i'>$i</option>";
            }
        }
        $html = "";
        for ($i = 1; $i <= $room; $i++) {
            if ($room == $i) {
                $actionRoom =
                    '
                                <input id="roomInput" name="room[]" type="text" value="' .
                    $i .
                    '">
                                <div class="roomAction">
                                    <span class="roomIncrement" data-id="' .
                    $room_id .
                    '" data-rdid="' .
                    $id .
                    '">+</span>
                                    <span class="roomDecrement" data-id="' .
                    $room_id .
                    '" data-rdid="' .
                    $id .
                    '">-</span>
                                </div>
                            ';
            } else {
                $actionRoom =
                    '
                                <input name="room[]" type="text" value="' .
                    $i .
                    '">
                            ';
            }

            $html .=
                '
                                <div class="row mb-2">
                                    <div class="col-4">
                                        <div class="form-group inlineFlex" style="height: 40px;">
                                            <span class="icon roomIcon mr-2">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 65.8 105.3" style="enable-background:new 0 0 65.8 105.3; width: 30px;height: 30px;fill: #3d5a80;" xml:space="preserve">
                                                <g>
                                                    <path d="M3.7,2.4c18,0,35.7-0.1,53.3,0c4.6,0,6.3,2.4,6.4,8.2c0,18.8,0,37.6,0,56.5c0,3.7,0,7.3,0,11c-0.1,4.5-2.4,6.7-6.9,6.8
                                                        c-5,0-10,0-15.8,0c0,4.7,0,9.2,0,13.6c-0.1,5.9-2.1,7.1-6.9,4.2c-9.1-5.6-18.2-11.1-27.1-16.9c-1.7-1.1-3.5-3.5-3.5-5.4
                                                        C3,55.6,3.1,30.8,3.1,6C3.1,5,3.4,4,3.7,2.4z M8.7,9.6c0,2.9,0,4.6,0,6.4c0,18.1,0.5,36.3-0.2,54.4c-0.3,8.2,1.9,13.2,9.4,16.7
                                                        c6,2.8,11.5,6.9,17.9,10.8c0-23.7,0-46.3-0.1-68.9c0-1.2-0.5-2.9-1.4-3.4C26.1,20.4,17.8,15.3,8.7,9.6z M57.9,79.8
                                                        c0-24.3,0-48.2,0-71.9c-14.1,0-27.7,0-42.5,0c7.8,4.8,14.5,9.2,21.4,13.2c3,1.7,4.1,3.8,4,7.2c-0.1,15.3-0.1,30.6-0.1,46
                                                        c0,1.8,0,3.5,0,5.5C46.8,79.8,52.1,79.8,57.9,79.8z"/>
                                                    <path d="M33.2,62.2c-1.6,0-2.9,0-4.5,0c0-3.2,0-6.2,0-9.5c1.5,0,2.9,0,4.5,0C33.2,55.8,33.2,58.8,33.2,62.2z"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="inlineFlex roomSelect">
                                                ' . $actionRoom . '
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-group inlineFlex" style="height: 40px;width: 100%;">
                                                    <span class="icon">
                                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                            viewBox="0 0 95.6 193.3" style="enable-background:new 0 0 95.6 193.3;width: 30px;height: 28px;fill: #3d5a80;" xml:space="preserve">
                                                            <g>
                                                                <path d="M25.2,82.4c-2.6,6.9-5.1,13.9-7.7,20.8c-1.6,4.3-4.5,6.6-9.2,6c-4.9-0.6-8.1-5.4-6.3-10.4C6.8,85.4,11.4,72,16.9,59
                                                                    c3.5-8.4,11-12.3,20-12.6c7.3-0.2,14.7-0.2,22,0c10.3,0.3,17.8,5.2,21.6,14.9c4.5,11.8,8.8,23.7,13.1,35.6
                                                                    c2.1,5.8,0.3,10.5-4.3,12.1c-4.7,1.6-8.8-0.9-11-6.7c-2.5-6.6-4.9-13.3-8.3-19.7c0,1.8,0,3.5,0,5.3c0,30.3,0,60.7,0,91
                                                                    c0,1.5,0.1,3-0.1,4.5c-0.6,5.4-4.5,9-9.6,8.9c-5.1-0.1-9-3.8-9.2-9.3c-0.2-5.5-0.1-11-0.1-16.5c0-14,0.1-28-0.1-42
                                                                    c0-1.7-1.6-3.4-2.5-5.2c-1,1.7-3,3.5-3,5.2c-0.2,19.3-0.1,38.7-0.2,58c0,5.6-3.7,9.4-8.7,9.7c-5.2,0.3-9.5-3.3-10.1-8.9
                                                                    c-0.2-1.6-0.1-3.3-0.1-5c0-30.2,0-60.3,0-90.5c0-1.8,0-3.5,0-5.3C25.9,82.5,25.5,82.4,25.2,82.4z"/>
                                                                <path d="M47.9,2.3C58.7,2.2,67.5,11,67.7,21.9c0.1,10.8-8.7,19.9-19.5,20c-10.7,0.1-19.6-8.8-19.8-19.7
                                                                    C28.3,11.4,37.1,2.3,47.9,2.3z"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    
                                                    <select id="adult-label" class="form-control" name="adult[]">
                                                            ' . $adultList . '
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-group inlineFlex" style="height: 40px;width: 100%;">
                                                    <span class="icon">
                                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                            viewBox="0 0 119.5 165.8" style="enable-background:new 0 0 119.5 165.8; width: 30px;height: 28px;fill: #3d5a80;" xml:space="preserve">
                                                            <g>
                                                                <path d="M85.3,90.2c0,1.6,0,3.2,0,4.8c0,18.5,0,37,0,55.5c0,7.8-4.4,12.7-10.9,12.8c-6.6,0-10.9-4.9-11-12.7c-0.1-6.7,0-13.3,0-20
                                                                    c0-2.5,0.1-5.7-3.4-5.2c-1.3,0.2-3,3.2-3.1,5c-0.4,7.3,0,14.7-0.3,22c-0.2,5.8-4.1,10-9.3,10.8c-4.7,0.8-9.7-1.7-11.4-6.2
                                                                    c-0.9-2.2-1.1-4.9-1.1-7.3c-0.1-18.2,0-36.3,0-54.5c0-1.8,0-3.5,0-5.3c-0.5-0.3-1-0.6-1.5-0.9c-3.8,4.1-7.5,8.3-11.4,12.2
                                                                    c-5.6,5.7-12,6.1-16.7,1.3c-4.7-4.7-4.2-11.3,1.2-16.8c7.1-7.1,14.2-14.1,21.3-21.1c4.8-4.9,10.7-7.2,17.5-7.2c10,0,20,0,30,0
                                                                    c6.8,0,12.7,2.3,17.5,7.2c7.1,7.2,14.3,14.4,21.4,21.7c5.1,5.2,5.4,11.9,0.9,16.4c-4.6,4.6-11.1,4.2-16.4-1c-4-3.9-7.9-8-11.9-12.1
                                                                    C86.2,89.9,85.8,90.1,85.3,90.2z"/>
                                                                <path d="M34.7,28.4C34.9,14.3,46.2,3.2,60.3,3.3c14,0.1,25.1,11.6,25,25.7c-0.1,14-11.7,25.4-25.6,25.1
                                                                    C45.7,53.9,34.6,42.5,34.7,28.4z"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    
                                                    <select name="kids[]" id="child-label" class="form-control">
                                                        ' . $childList . '
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        ';
        }
        ?>
        <form id="room_guest_select_form" method="POST">

            <?php echo $html; ?>

            <input type="hidden" name="room_id" value="<?php echo $room_id; ?>">
            <input type="hidden" name="room_detail_id" value="<?php echo $id; ?>">
            <input type="hidden" value="confirm_room" name="type">
            <div class="row btn_row">
                <div class="col-6"><a class="btn btn-light" id="remove_guest_section">CANCEL</a></div>
                <div class="col-6" style="display: flex;justify-content: end;"><input type="submit" class="btn btn-dark" value="Confirm"></div>
            </div>
        </form>



    <?php
    }

    if ($type == "confirm_room") {
        // pr($_POST);
        $roomArr = $_POST["room"];
        $adultArr = $_POST["adult"];
        $kidsArr = $_POST["kids"];
        $rid = $_POST["room_id"];
        $rdid = $_POST["room_detail_id"];
        $night = 1;
        $adultNo = roomMaxCapacityById($rid);

        $checkIn = $_SESSION["checkIn"];
        $checkout = $_SESSION["checkout"];

        // if(isset($_SESSION['room']) && !empty($_SESSION['room'])){
        //     $fistKey = array_keys($_SESSION['room'])[0];
        //     $checkIn = $_SESSION['room'][$fistKey]['checkIn'];
        //     $checkout = $_SESSION['room'][$fistKey]['checkout'];
        // }

        // if(roomExist($rid) >= $room){
        //     $room = $room;
        // }else{
        //     $room = 1;
        // }

        // if($adultNo <= $adult){
        //     $adult = $adultNo;
        // }

        foreach ($roomArr as $key => $val) {
            $room = $val;
            $adult = $adultArr[$key];
            $kids = $kidsArr[$key];
            $night = getNightCountByDay($checkIn, $checkout);
            $obj->addroom(
                $rid,
                $room,
                $adult,
                $kids,
                $night,
                $rdid,
                $checkIn,
                $checkout,
                $key
            );
        }
    }

    if ($type == "persionCheckout") {
        $personName = $_POST["personName"];
        $personEmail = $_POST["personEmail"];
        $personPhoneNo = $_POST["personPhoneNo"];
        $companyName = "";
        $companyGst = "";

        $hotelId = 1;
        $add_on = date("Y-m-d h:i:s");

        $_SESSION["personName"] = $personName;
        $_SESSION["personEmail"] = $personEmail;
        $_SESSION["personPhoneNo"] = $personPhoneNo;

        $night = $_SESSION["night_stay"];

        if (isset($_POST["companyName"])) {
            $companyName = $_POST["companyName"];
            $companyGst = $_POST["companyGst"];
        }

        if (isset($_SESSION["partial"])) {
            $partial = $_SESSION["partial"];
        } else {
            $partial = "";
        }
        if (isset($_SESSION["couponCode"])) {
            $couponCode = $_SESSION["couponCode"];
        } else {
            $couponCode = "";
        }
        if (isset($_SESSION["pickUp"])) {
            $pickUp = $_SESSION["pickUp"];
        } else {
            $pickUp = 0;
        }

        $bid = getBookingNumber();
        $grossAmount = $_SESSION["gossCharge"];
        $userPay = $_SESSION["roomTotalPrice"];

        $noOfRum = 1;
        $bookingSrc = 5;

        $sql = "insert into booking(hotelId,bookinId,payment_status,add_on,couponCode,pickUp,userPay,nroom,bookingSource) values('$hotelId','$bid','pending','$add_on','$couponCode','$pickUp','$userPay','$noOfRum','$bookingSrc')";

        mysqli_query($conDB, $sql);
        $_SESSION["OID"] = mysqli_insert_id($conDB);
        $bookingId = $_SESSION["OID"];

        $roomNumStr = "";
        $roomNumArr = [];

        if (!empty($personName)) {
            if (isset($_SESSION["room"])) {
                $countKey = 0;
                foreach ($_SESSION["room"] as $key => $val) {
                    $countKey++;
                    $rdid = explode("-", $key)[0];

                    $rid = $_SESSION["room"][$key]["roomId"];
                    $child = $_SESSION["room"][$key]["child"];
                    $adult = $_SESSION["room"][$key]["adult"];
                    $checkInTime = $_SESSION["room"][$key]["checkIn"];
                    $checkInOut = $_SESSION["room"][$key]["checkout"];
                    $noAdult = $_SESSION["room"][$key]["adult"];
                    $noRoom = $_SESSION["room"][$key]["room"];
                    $night = $_SESSION["room"][$key]["night"];

                    $roomPrice = getRoomPriceById(
                        $rid,
                        $rdid,
                        $adult,
                        $checkInTime
                    );
                    $adultPrice = getAdultPriceByNoAdult(
                        $adult,
                        $rid,
                        $rdid,
                        $checkInTime
                    );
                    $childPrice = getChildPriceByNoChild(
                        $child,
                        $rid,
                        $rdid,
                        $checkInTime
                    );

                    $singleRoomPriceCalculator = SingleRoomPriceCalculator(
                        $rid,
                        $rdid,
                        $adult,
                        $child,
                        $noRoom,
                        $night,
                        $roomPrice,
                        $childPrice,
                        $adultPrice,
                        $couponCode
                    );

                    $gstPer = $singleRoomPriceCalculator[0]["gstPer"];
                    $total = $singleRoomPriceCalculator[0]["total"];

                    $roomNum = getRoomNumber(
                        "",
                        1,
                        $rid,
                        $checkInTime,
                        $checkInOut
                    )[0]["roomNo"];

                    array_push($roomNumArr, $roomNum);
                    $bid = $_SESSION["OID"];

                    $sql = "insert into bookingdetail(bid,roomId,roomDId,room_number,adult,child) values('$bid','$rid','$rdid','$roomNum','$adult','$child')";

                    mysqli_query($conDB, $sql);
                }

                $roomNumStr = implode(",", $roomNumArr);

                mysqli_query(
                    $conDB,
                    "insert into guest(hotelId,bookId,roomnum,serial,name,email,phone,company_name,comGst) values('$hotelId','$bookingId','$roomNumStr','1','$personName','$personEmail','$personPhoneNo','$companyName','$companyGst')"
                );

                unset($_SESSION["room"]);
                echo "successfull book";
            }
        }
    }

    if ($type == "couponCode") {
        $couponValu = trim($_POST["couponValu"]);
        $sql = mysqli_query(
            $conDB,
            "select * from couponcode where coupon_code = '$couponValu'"
        );
        if (mysqli_num_rows($sql) > 0) {
            $row = mysqli_fetch_assoc($sql);
            $coupon_type = $row["coupon_type"];
            $min_value = $row["min_value"];
            $coupon_value = $row["coupon_value"];
            $expire_on = $row["expire_on"];
            $status = $row["status"];

            if ($coupon_value === $couponValu) {
                $data["type"] = "error";
                $data["msg"] = "Coupon Code Is Invalid";
            } elseif ($status == 0) {
                $data["type"] = "error";
                $data["msg"] = "Coupon Code Is Deactive";
            } elseif (strtotime($expire_on) < strtotime(date("Y-m-d"))) {
                $data["type"] = "error";
                $data["msg"] = "Coupon code is expired";
            } else {
                $_SESSION["couponCode"] = $couponValu;
                if ($coupon_type == "P") {
                    $data["type"] = "success";
                }
                if ($coupon_type == "F") {
                    $data["type"] = "success";
                }
            }
        } else {
            $data["type"] = "error";
            $data["msg"] = "Invalid Coupon Code.";
        }
        echo json_encode($data);
    }

    if ($type == "removeCouponCode") {
        unset($_SESSION["couponCode"]);
    }

    if ($type == "LoadPrice") {
        echo number_format(totalSessionPrice()["price"], 2);
    }

    if ($type == "pickup") {
        echo $pickupPrice = settingValue()["pckupDropPrice"];
        $_SESSION["pickUp"] = $pickupPrice;
        calculateTotalBookingPrice();
    }

    if ($type == "removePickup") {
        echo $pickupPrice = settingValue()["pckupDropPrice"];
        unset($_SESSION["pickUp"]);
        calculateTotalBookingPrice();
    }

    if ($type == "partial") {
        if (isset($_SESSION["payByRoom"]) && $_SESSION["payByRoom"] == "Yes") {
        } else {
            $_SESSION["partial"] = "Yes";
            calculateTotalBookingPrice();
        }
    }

    if ($type == "removePartial") {
        if (isset($_SESSION["payByRoom"]) && $_SESSION["payByRoom"] == "Yes") {
        } else {
            unset($_SESSION["partial"]);
            calculateTotalBookingPrice();
        }
    }

    if ($type == "updatePayRoom") {
        $id = $_POST["id"];
        $data = "";
        if ($id == 0) {
            $data .= "<option value='0'>Select Room</option>";
        } else {
            $ratePlanArr = getRatePlanArrById($id);

            foreach ($ratePlanArr as $key => $rPlanList) {
                $id = $rPlanList["id"];
                $name = $rPlanList["rplan"];
                $price = $rPlanList["price"];
                if ($key == 0) {
                    $data .= "<option selected value='$id'><span>$name</span><span> ( ₹ $price )</span></option>";
                } else {
                    $data .= "<option value='$id'><span>$name</span><span> ( ₹ $price )</span></option>";
                }
            }
        }

        echo $data;
    }

    if ($type == "updatePayRatePlan") {
        $id = $_POST["id"];
        $ratePlanDetail = getRatePlanDetailById($id);
        $price = $ratePlanDetail[0]["price"];
        $gst = getGSTPrice($price);

        $persentageArr = [50, 75, 100];

        $data = '<div id="percentageCheck" class="row"> ';
        foreach ($persentageArr as $key => $percentageList) {
            $PercentagePrice = (($price + $gst) * $percentageList) / 100;
            if ($key == 0) {
                $req = "required";
            } else {
                $req = "";
            }
            $data .= "<div class='col-md-4 col-sm-6'><input type='radio' name='percentageCheck' value='$percentageList' id='$percentageList' $req> <label for='$percentageList'><span class='percentage'>$percentageList %</span> <span>₹ $PercentagePrice</span></label> </div>";
        }

        $data .= "</div>";

        $data .=
            '
        
        <div class="card mb-4">
            <h5 class="card-header d-flex align-items-center justify-content-between"><span>Payble <small
                        class="text-secondary">Amount</small></span></h5>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 d-flex mb-3">
                       
                    </div>
                    <div class="col-md-8">
                        <dl class="row">
                            <dt class="col-5">Room:</dt>
                            <dd class="col-7">' .
            $price .
            '</dd>
                            <dt class="col-5">GST ( ' .
            getGSTPercentage($price) .
            '% ):</dt>
                            <dd class="col-7">' .
            getGSTPrice($price) .
            '</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
        
        ';

        echo $data;
    }

    if ($type == "checkRoomNumber") {
        $id = $_POST["id"];
        $room = $_POST["room"];
        $action = $_POST["action"];

        if (roomExist($id) >= 15) {
            $roomDisplay = 15;
        } else {
            $roomDisplay = roomExist($id);
        }

        if ($roomDisplay > $room) {
            if ($action == "inc") {
                $room++;
            }
        }

        if ($action == "dec") {
            $room--;
        }

        if ($room < 1) {
            $room = 1;
        } else {
            $room;
        }

        $_SESSION["userRoomChoose"] = $room;
        echo $room;
    }

    if ($type == "getParentIdData") {
        $id = $_POST["id"];
        $sql = mysqli_query(
            $conDB,
            "select * from room where id = '$id' and pId = '0'"
        );
        $data = [];
        if (mysqli_num_rows($sql) > 0) {
            $update_row = mysqli_fetch_assoc($sql);
            $uid = $update_row["id"];
            $header = $update_row["header"];
            $bedtype = $update_row["bedtype"];
            $totalroom = $update_row["totalroom"];
            $roomcapacity = $update_row["roomcapacity"];

            $noAdult = $update_row["noAdult"];
            $noChild = $update_row["noChild"];
            $slug = $update_row["slug"];

            $getRatePlanArrById = getRatePlanArrById($uid);

            $data[] = [
                "rid" => $uid,
                "header" => $header,
                "bedtype" => $bedtype,
                "totalroom" => $totalroom,
                "roomcapacity" => $roomcapacity,
                "noAdult" => $noAdult,
                "noChild" => $noChild,
                "slug" => $slug,
            ];
        }

        echo json_encode($data[0]);
    }

    if ($type == "removeGustContent") {
        $key = $_POST["key"];
        $obj->removeroom($key);
    }

    if ($type == "payByRoom") {
        $_SESSION["payByRoom"] = "Yes";
    }

    if ($type == "removePayByRoom") {
        unset($_SESSION["payByRoom"]);
    }

    if ($type == "payByRoomCalculate") {
        $key = $_POST["key"];
        $total = 0;
        foreach ($key as $keyList) {
            $rdid = explode("-", $keyList)[0];
            $rid = $_SESSION["room"][$keyList]["roomId"];
            $child = $_SESSION["room"][$keyList]["child"];
            $adult = $_SESSION["room"][$keyList]["adult"];
            $checkInTime = $_SESSION["room"][$keyList]["checkIn"];
            $checkInOut = $_SESSION["room"][$keyList]["checkout"];
            $noAdult = $_SESSION["room"][$keyList]["adult"];
            $noRoom = $_SESSION["room"][$keyList]["room"];
            $night = $_SESSION["room"][$keyList]["night"];

            $roomPrice = getRoomPriceById($rid, $rdid, $adult, $checkInTime);
            $adultPrice = getAdultPriceByNoAdult(
                $adult,
                $rid,
                $rdid,
                $checkInTime
            );
            $childPrice = getChildPriceByNoChild(
                $child,
                $rid,
                $rdid,
                $checkInTime
            );

            if (isset($_SESSION["couponCode"])) {
                $couponCode = $_SESSION["couponCode"];
            } else {
                $couponCode = "";
            }

            $singleRoomPriceCalculator = SingleRoomPriceCalculator(
                $rid,
                $rdid,
                $adult,
                $child,
                $noRoom,
                $night,
                $roomPrice,
                $childPrice,
                $adultPrice,
                $couponCode
            );

            $total += $singleRoomPriceCalculator[0]["total"];
        }

        $_SESSION["roomTotalPrice"] = $total;
        echo $total;
    }

    function roomNumberAddForm($rnid = ""){
        $roomNameOption = "";
        foreach (getRoomList("1") as $roomNameList) {
            $name = $roomNameList["header"];
            $id = $roomNameList["id"];
            $roomNameOption .= "<option value='$id'>$name</option>";
        }
        $formId = "addRoomNumberForm";
        $roomNumerValue = "";
        $roomNumBtn = "Add Room Number";
        $updateRoomNumIdHtml = "";
        if ($rnid != "") {
            $formId = "updateRoomNumberForm";
            $roomNumArry = getRoomNumber("", "", "", "", "", "", $rnid)[0];

            $roomNumerValue = $roomNumArry["roomNo"];
            $roomNumBtn = "Update Room Number";
            $updateRoomNumIdHtml =
                '<input type="hidden" name="roomNumId" value="' .
                $rnid .
                '" required>';
        }

        $html =
            '
            <form action="" method="post" id="' .
            $formId .
            '">
                <div class="form-group">
                    <label for="roomNum">Room Number</label>
                    <input type="number" class="form-control" name="roomNum" id="roomNum" value="' .
            $roomNumerValue .
            '" required>
                </div>
                ' .
            $updateRoomNumIdHtml .
            '
                <div class="form-group">
                    <label for="roomId">Room Name</label>
                    <select class="form-control" name="roomId" id="roomId">
                        ' .
            $roomNameOption .
            '
                    </select>
                </div>

                <button type="submit" class="btn bg-gradient-primary">' .
            $roomNumBtn .
            '</button>
            </form>
        ';

        return $html;
    }

    if ($type == "loadRoomNumber") {
        $html = '<ul>';

        $si = 0;
        $sql = mysqli_query($conDB, "select * from roomnumber where hotelId = '$hotelId' and deleteRec = '1'");
        if (mysqli_num_rows($sql) > 0) {
            while ($row = mysqli_fetch_assoc($sql)) {
                $si++;
                $id = $row["id"];
                $roomNum = $row["roomNo"];
                $roomName = (isset(getRoomData($row["roomId"])[0])) ? getRoomData($row["roomId"])[0]['header'] : '';
                $time = formatingDate($row["addOn"]);

                if ($row["status"] == 1) {
                    $status = "<a class='tableIcon status bg-gradient-success deactive' href='javascript:void(0)' data-rnid='$id' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-original-title='Deactive'><i class='far fa-eye'></i></a>";
                } else {
                    $status = "<a class='tableIcon status bg-gradient-warning  active' href='javascript:void(0)' data-rnid='$id' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-original-title='Active'><i class='far fa-eye-slash'></i></a>";
                }

                $delete = "<a class='tableIcon delete bg-gradient-danger' href='javascript:void(0)' data-rnid='$id' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-original-title='Delete'><i class='far fa-trash-alt'></i></a>";
                $update = "<a class='tableIcon update bg-gradient-info' href='javascript:void(0)' data-rnid='$id' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-original-title='Edit'><i class='far fa-edit'></i></a>";
                
                $html .= "<li>
                            <div class='buttonGroup'>$update $delete</div>
                            <div class='item'>
                                <h6>$roomName</h6>
                                <h4>$roomNum</h4>
                            </div>
                        </li>";
            }
        } else {
            $html .= "
                        
                    <tr>
                        <td calspan='7'>No Data</td>
                    </tr>
                
                ";
        }

        $html .= "</ul>";

        echo $html;
    }

    if ($type == "submitRoomNumber") {
        $roomNum = $_POST["roomNum"];
        $roomId = $_POST["roomId"];
        $hId = $_SESSION["HOTEL_ID"];
        $addby = dataAddBy();

        $roomNumberArry = getRoomNumber($roomNum);
        if (count($roomNumberArry) > 0) {
            echo 0;
        } else {
            $sql = "insert into roomnumber(hotelId,roomNo,roomId,addBy) values('$hId','$roomNum','$roomId','$addby')";
            if (mysqli_query($conDB, $sql)) {
                echo 1;
            } else {
                echo 0;
            }
        }
    }

    if ($type == "updateSubmitRoomNumber") {
        global $hotelId;
        $roomNumId = $_POST["roomNumId"];
        $roomNum = $_POST["roomNum"];
        $roomId = $_POST["roomId"];
        $hId = $_SESSION["HOTEL_ID"];

        $roomNumberArry = getRoomNumber($roomNum,'',$roomId);
        
        if (count($roomNumberArry) > 0) {
            echo 0;
        } else {
            $sql = "update roomnumber set roomNo = '$roomNum', roomId='$roomId' where hotelId = '$hotelId' and id = '$roomNumId'";
            if (mysqli_query($conDB, $sql)) {
                echo 1;
            } else {
                echo 0;
            }
        }
    }

    if ($type == "addRoomNumForm") {
        echo roomNumberAddForm();
    }

    if ($type == "editRoomNumberForm") {
        $id = $_POST["rnid"];
        echo roomNumberAddForm($id);
    }

    if ($type == "statusUpdate") {
        $sid = $_POST["rnid"];

        $sql = mysqli_fetch_assoc(
            mysqli_query($conDB, "select * from roomnumber where id='$sid'")
        );
        if ($sql["status"] == 1) {
            $query = "update roomnumber set status = '0' where id='$sid'";
        } else {
            $query = "update roomnumber set status = '1' where id='$sid'";
        }

        if (mysqli_query($conDB, $query)) {
            echo 1;
        } else {
            echo 0;
        }
    }

    if ($type == "deleteRoomNumber") {
        $did = $_POST["rnid"];
        $sql = "update roomnumber set deleteRec = '0' where id='$did'";
        if (mysqli_query($conDB, $sql)) {
            echo 1;
        } else {
            echo 0;
        }
    }

    if ($type == "editRoomNumber") {
        $hid = $_POST["rnid"];
        echo roomNumberAddForm();
    }

    function addRoomForm($rid = ""){
        global $conDB;
        global $hotelId;
        $header = "";
        $slug = "";
        $bedtype = "";
        $totalroom = "";
        $roomcapacity = "";
        $uid = "";
        $noAdult = "";
        $extraAdult = "";
        $extraChild = "";
        $noChild = "";
        $mrp = "";
        $roomNumber = "";
        $btn = "Add Room";
        $header_text = "Add Room";
        $roomCapacity = "";
        $roomNumListHtml = '';

        $imgSize = "(900 x 1060)";
        $formBtn = "manageForm";

        if ($rid != "") {
            $id = $rid;
            $formBtn = "updateManageForm";
            $header_text = "Update Room";
            $sql = mysqli_query($conDB, "select * from room where id = '$id'");

            if (mysqli_num_rows($sql) > 0) {
                $update_row = mysqli_fetch_assoc($sql);
                $uid = $update_row["id"];
                $header = $update_row["header"];
                $slug = $update_row["slug"];
                $bedtype = $update_row["bedtype"];
                $totalroom = $update_row["totalroom"];
                $roomCapacity = $update_row["roomcapacity"];

                $noAdult = $update_row["noAdult"];
                $noChild = $update_row["noChild"];
                $mrp = $update_row["mrp"];
                $btn = "Update Room";

                if (count(getRoomNumber("", "yes", $id)) > 0) {
                    $roomNumber = implode(",",getArryDataToString(getRoomNumber("", "yes", $id), "roomNo"));
                } else {
                    $roomNumber = '';
                }

                $roomTypeArray = getRateType($rid);

            } else {
                $_SESSION["ErrorMsg"] = "Room Id not exist";
                redirect("list-room.php");
            }
            
            foreach(QueryGen('roomnumber',['roomId'=>$rid,'deleteRec'=>'1']) as $item){
                $num = $item['roomNo'];
                $rid = $item['roomId'];
                $roomNumListHtml .= '<li>'.$num.'<a class="removeRoomNum" data-value="'.$num.'" href="javascript:void(0)" data-rid="'.$rid.'">X</a></li>';
            }
        }else{
            $roomNumListHtml = '';
            foreach($_SESSION['roomNumUpload'] as $key=>$item){
                $num = $item['roomNo'];
                $roomNumListHtml .= '<li>'.$num.'<a class="removeRoomNum session" data-value="'.$num.'" href="javascript:void(0)" data-rid="'.$key.'">X</a></li>';
            }
        }

        $ratePlanHtml = createSelectItem(getPropertyRatePlaneList('',$hotelId,'','yes'));

        $inventoryHtml = "";

        $roomRateField = "";
        $imgBoxContent = "";
        for ($i = 0; $i <= 5; $i++) {
            if ($i == $totalroom) {
                $inventoryHtml .= "<option selected value='$i'>$i</option>";
            } else {
                $inventoryHtml .= "<option value='$i'>$i</option>";
            }
        }

        if ($rid != "" && count(getImageById($rid)) != 0) {
            foreach (getImageById($rid) as $image_row) {
                if ($image_row["image"] != 0 && $image_row["image"] != 'demoRoom.jpg') {
                    $imgId = $image_row["image"];
                    $img_path = getHotelImageData('','','','',$imgId)[0]['fullUrl'];

                    $imgBoxContent .= "                        
                        <div class='form_group col-md-6 col-sm-12 mb-3'>
                            <div class='dFlex aie'>
                                <div class='previewImg'><img src='$img_path'/><span data-imgid='$imgId' class='removeImg'>X</span></div>
                                <div class='imgCon' style='width:80%'>
                                    <label for='roomImage2'>Room Image $imgSize</label>
                                    <input class='form-control checkRoomImg' type='file' id='roomImage2' accept='image/jpeg' name='roomImage[]' disabled>
                                </div>
                            </div>
                        </div>                        
                    ";
                }
            }

        } else {
            $imgBoxContent .=
                '               
                    <div class="form_group col-md-6 col-sm-12 mb-3">
                        <div class="dFlex aie">
                            <div class="imgCon">
                                <label for="roomImage1">Room Image '.$imgSize .'</label>
                                <input data-rid="'.$rid.'" class="form-control checkRoomImg" type="file" id="roomImage1" accept="image/jpeg" name="roomImage[]">
                            </div>
                        </div>
                    </div>
                    <div class="form_group col-md-6 col-sm-12 mb-3">
                        <div class="dFlex aie">
                            <div class="imgCon">
                                <label for="roomImage2">Room Image '.$imgSize .'</label>
                                <input class="form-control checkRoomImg" type="file" id="roomImage2" accept="image/jpeg" name="roomImage[]">
                            </div>
                        </div>
                    </div>
                </div>
            
            ';
        }

        $exInputField = "";

        if ($rid != "") {
            $exInputField .=
                '<input type="hidden" value="update_room" name="type">';
            $exInputField .= "<input type='hidden' value='$uid' name='update_id'>";
        } else {
            $exInputField .=
                '<input type="hidden" value="add_room" name="type">';
        }
        $amenitiesField = "";

        foreach(getHotelAmenitieData('','','',$hotelId) as $item){
            if ($rid != "") {
                $amenitiesField .= "<input type='hidden' name='amenitieRoomId' value='$rid'>";
            } else {
                $rid = "";
            }
            $filterData = amenitiesFilter($item);
            $hotelAID = $filterData['hotelAID'];
            $ameniteTitle = $filterData['title'];
            $ameniteImg = $filterData['img'];

            $checked = '';
                if (checkAmenitiesById($rid, $hotelAID) == 1) {
                    $checked = 'checked';
                }

                $amenitiesField .= "                
                    <span class='amenitiesCheckBox' style='display: inline-block;margin-right: 10px;'>
                        <input $checked type='checkbox' id='amenitie{$hotelAID}' name='amenities[]' value='{$hotelAID}'>
                        <label for='amenitie{$hotelAID}'>$ameniteImg <span>$ameniteTitle</span></label>
                    </span>";

        }

        // $amenitiesField .= "<span data-rid='$rid' id='roomAmenitesAdd' class='formAddBtn'><i class='bi bi-clipboard-plus'></i></span>";
        
        $roomRateField ='';

        if ($rid != "" && count(getRateType($rid)) != 0) {
            $count = 0;
            foreach (getRateType($rid) as $detail_row) {
                createSession('ratePlanCon', $detail_row['title']);
            };

            foreach (getRateType($rid) as $detail_row) {
                // echo "<pre>";
                // print_r($detail_row);
                $count++;
                $rdid = $detail_row['id'];
                $ratePlanId = $detail_row['title'];
                $singlePrice = $detail_row['singlePrice'];
                $doublePrice = $detail_row['doublePrice'];
                $extra_adult = $detail_row['extra_adult'];
                $extra_child = $detail_row['extra_child'];
                // $exisRateplane = $_SESSION['ratePlanCon'];
                $exisRateplane = array();
                
                $roomRateField .= createRatePlanInputField($rid,$rdid,$ratePlanId,$singlePrice,$doublePrice,$extra_adult,$extra_child,$exisRateplane);
                
            }
        }else{
            $roomRateField =createRatePlanInputField();
        }

        $html =
            '
                <form action="" id="'.$formBtn .'" method="post" enctype="multipart/form-data">

                    <div class="row p0">
                        <div class="form_group col-12 col-sm-6 mb-3">
                            <label for="header">Room *</label>
                            <input class="form-control" type="text" id="header" name="header" placeholder="Enter Room Name." value="' .
                            $header .
                            '" required data-rid="' .
                            $rid .
                            '">
                            <span class="errormsg" id="errorHeader"></span>
                        </div>
                        <div class="form_group col-12 col-sm-6 mb-3">
                            <label for="bedType">Bed Type *</label>
                            <input class="form-control" type="text" id="bedType" name="bedType" placeholder="Enter Bed Type" value="' .
                            $bedtype .
                            '" required>
                        </div>
                    </div>

                    <div class="row p0">
                        <div class="form_group col_12 mb-3">
                            <label for="slug">Slug *</label>
                            <input class="form-control" type="text" id="slug" name="slug" placeholder="Enter Slug." value="' .
                            $slug .
                            '" required disabled>
                        </div>
                    </div>

                    <div class="row p0">
                        <div class="form_group col-12 col-sm-6 mb-3 addRoomNumberForRoom">
                            <label style="width: 100%;" for="roomNumber">Room Number *
                                <div id="rnDisplayLabelInputField">
                                <ul class="tagList">'.$roomNumListHtml.'</ul>
                                <input name="roomNumberDisplay" placeholder="Enter Room Number." type="number" id="roomNumber" class="form-control" data-rid="'.$rid.'" data-value="' .$roomNumber .'" required autocomplete="off"/>
                                </div>
                            </label> 
                            
                        </div>
                        <div class="form_group col-12 col-sm-6 mb-3">
                            <label for="roomCapacity">Room Capacity</label>
                            <input class="form-control" name="roomCapacity" id="roomCapacity" placeholder="Enter room capacity." value="' .
                            $roomCapacity .
                            '" required autocomplete="off">
                        </div>
                    </div>

                    <div class="row p0">

                        <div class="col-md-4 mb-3">
                            <div class="form_group">
                                <label for="noAdult">No of Adult *</label>
                                <input class="form-control" type="text" id="noAdult" name="noAdult" placeholder="Enter No of Adult"
                                    value="' .$noAdult .'" required>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="form_group">
                                <label for="noChild">No of Child ( Above 5 Years ) *</label>
                                <input class="form-control" type="text" id="noChild" name="noChild" placeholder="Enter No of Child"
                                    value="' .$noChild .'" required>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="form_group">
                                <label for="mrp">Rack Rate *</label>
                                <input class="form-control" type="number" id="mrp" name="mrp" placeholder="Enter Room MRP" value="' .$mrp .'" required>
                            </div>
                        </div>

                    </div>
                    <div class="row justify-content-end">
                        <div class="col-auto"><a data-rid="'.$rid.'" id="addImageBtn" href="javascript:void(0)">Add Image</a></div>
                    </div>
                    <div class="row p0" id="roomImgContent">'.$imgBoxContent.'</div>
                    '.$exInputField.'

                    <div class="s25"></div>

                    <div class="form_group amenities mb-3" id="amenitiesContent">
                        <label for="amenities">Amenities</label> <br /> '.$amenitiesField.'
                    </div>
                    <div style="display: flex;justify-content: end;"><div class="add_sub mb-3 " data-id="1"> <div class="btn update bg-gradient-dark ms-auto mb-0 js-btn-next">Add</div> </div></div>
                    <div id="add_content">'.$roomRateField.'</div>

                    <div class="s25"></div>
                    <div class="form-group">
                        <label for="roomDescription">Room Description</label>
                        <textarea name="roomdesc" id="roomDescription" style="resize: none;" rows="4" class="form-control"></textarea>
                    </div>
                    <button class="btn bg-gradient-primary mb-0 mt-lg-auto deactive" name="addRoom" value="submit" id="addRoomSubmitBtn">'.$btn .'</button>
                </form>
            ';

        return $html;
    }

    function roomListHtml($action=''){
        global $conDB;
        global $hotelId;
        $si = 0;
        $query = "select * from room where hotelId = '$hotelId' ";
        $acctionBtn = '';
        if($action == 'delete'){
            $query .= " and deleteRec = '0'";
        }else{
            $query .= " and deleteRec = '1'";
        }

        $sql = mysqli_query( $conDB, $query);
        $roomRowData = "";
        if (mysqli_num_rows($sql) > 0) {
            while ($row = mysqli_fetch_assoc($sql)) {
                $si++;
                $id = $row["id"];
                $time = formatingDate($row["add_on"]);
                $roomTotalNum = count(getRoomNumber("", "", $id));

                if ($row["status"] == 1) {
                    $status = "<a class='tableIcon status bg-gradient-success deactive' href='javascript:void(0)' data-rid='$id' data-tooltip-top='Active'><i class='far fa-eye'></i></a>";
                } else {
                    $status = "<a class='tableIcon status bg-gradient-warning  active' href='javascript:void(0)' data-rid='$id' data-tooltip-top='Active'><i class='far fa-eye-slash'></i></a>";
                }

                $delete = "<a class='tableIcon delete bg-gradient-danger' href='javascript:void(0)' data-rid='$id' data-tooltip-top='Delete'><i class='far fa-trash-alt'></i></a>";

                $update = "<a class='tableIcon update bg-gradient-info' href='javascript:void(0)' data-rid='$id' data-tooltip-top='Edit'><i class='far fa-edit'></i></a>";
                
                $restroreBtn = "<a class='tableIcon restore bg-gradient-info' href='javascript:void(0)' data-rid='$id' data-tooltip-top='Restore'><i><svg class='w28 h28' style='padding: 5px;'><use xlink:href='#restoreSvgIcon'></use></svg></i></a>";

                $imgCon = '<div class="imgGrid">';

                foreach (getImageById($id) as $key => $imgList) {
                    if ($key < 3) {
                        $img = (isset(getHotelImageData('','','','',$imgList["image"])[0]['fullUrl'])) ? getHotelImageData('','','','',$imgList["image"])[0]['fullUrl'] : '';
                        $imgCon .= "<span><img style='width:50px' src='$img'></span>";
                    }
                }

                if($action == 'delete'){
                    $acctionBtn = " $restroreBtn ";
                }else{
                    $acctionBtn = "$status $update $delete" ;
                }

                $imgCon .= "</div>";
                $singleOcPrice = '';
                $doubleOcPrice = '';
                if(count(getRateType($id))>0){
                    $roomDetailId = getRateType($id)[0]["id"];
                    $dateCheck = date("Y-m-d");
                    $singleOcPrice = number_format(getRoomPriceById($id, $roomDetailId, 1, $dateCheck));
                    $doubleOcPrice = number_format(getRoomPriceById($id, $roomDetailId,2,$dateCheck));
                }
                
                $roomPrice = "<span><i class='bi bi-person-fill'></i> $singleOcPrice</span><br/><span><i class='bi bi-people-fill'></i> $doubleOcPrice</span>";

                $roomRowData .= "
                
                    <tr>
                        <td width='10%' class='left'>$imgCon </td>
                        <td width='20%' class='center mb-0 bold'>{$row["header"]}</td>
                        <td width='10%' class='center mb-0 bold'>{$row["bedtype"]}</td>
                        <td width='10%' class='center mb-0 bold'>{$roomTotalNum}</td>
                        <td width='10%' class='center mb-0 bold'>{$row["roomcapacity"]}</td>
                        <td width='15%' class='center mb-0 bold'>{$roomPrice}</td>
                        <td width='25%'>
                            <div class='tableCenter'>
                                <span class='tableHide'><i class='fas fa-ellipsis-h'></i></span>
                                <span class='tableHoverShow'>$acctionBtn</span>
                            </div>
                        </td>
                    </tr>

        ";
            }
        } else {
            $roomRowData = "

        <tr>
            <td colspan='7'>No Data</td>
        </tr>

        ";
        }

        $html =
            '

            <table class="table align-items-center mb-0 tableLine rt rb hover">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Header</th>
                        <th>Bedtype</th>
                        <th>Total Room</th>
                        <th>Room capacity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>' .
                $roomRowData .
                '</tbody>
            </table>

        ';

        return $html;
    }

    if ($type == "loadRoomList") {       
        echo roomListHtml();
    }

    if ($type == "loadDeleteRoomList") {       
        echo roomListHtml('delete');
    }

    if ($type == "showAddRoomForm") {
        $rid = $_POST["rid"];
        $data = addRoomForm($rid);

        echo $data;
    }

    if ($type == "deleteRoom") {
        $removeId = $_POST["rid"];
        $sql = mysqli_query(
            $conDB,
            "select * from room where id = '$removeId' "
        );
        if (mysqli_num_rows($sql) > 0) {
            $sql = "update room set deleteRec = '0' where id='$removeId'";

            if (mysqli_query($conDB, $sql)) {
                echo 1;
            }
        }
    }

    if ($type == "deleteRoomRecord") {
        $bid = $_POST["bid"];
        $bdid = $_POST["bdid"];
        mysqli_query($conDB, "update bookingdetail set checkinstatus = '5' where id='$bdid'");
        setActivityFeed('','14',$bid,$bdid);
        echo 1;
    }

    if ($type == "statusUpdateForRoom") {
        $sid = $_POST["rid"];

        $sql = mysqli_fetch_assoc(
            mysqli_query($conDB, "select * from room where id='$sid'")
        );
        if ($sql["status"] == 1) {
            $query = "update room set status = '0' where id='$sid'";
        } else {
            $query = "update room set status = '1' where id='$sid'";
        }

        if (mysqli_query($conDB, $query)) {
            echo 1;
        } else {
            echo 0;
        }
    }

    if ($type == "loadReservationCountNavBar") {
        if ($_POST["rTab"] == "") {
            $rTab = "reservation";
        } else {
            $rTab = $_POST["rTab"];
        }

        $currentDate = $_POST["currentDate"];

        $reservationBtn = [
            "New",
            "all",
            "No show",
            "void",            
        ];

        $data = "";

        foreach ($reservationBtn as $rTabList) {
            $active = "";
            $name = ucfirst($rTabList);
            if ($rTabList == $rTab) {
                $active = "active";
            }
            if($rTabList == 'all'){
                $count = countBookingRow($rTabList, $currentDate);
                $name = 'All  Reservations';

            }
            else{
                $count='';
            }

        

           
           
                $data .=
                    '<li><a id="' .
                    $rTabList .
                    '" class="reservationTab py-3 ' .
                    $active .
                    '" href="javascript:void(0)">' .
                    $name .
                    '
                    <span>' .
                    $count .
                    '
                    </span></a></li>';
            
        }

        // $data .= '<li><a href="javascript:void(0)"  data-page="reservation" onclick="loadAddResorvation(\'\', \'reservation\')">New</a></li>';
        // $data .= '<li><a href="javascript:void(0) class="reservationTab py-3" >No Show</a></li>';
        // $data .= '<li><a href="javascript:void(0) class="reservationTab py-3" >Void</a></li>';

        echo $data;
    }

    if ($type == "amenitiesAdd") {
        $name = safeData($_POST["amenities"]);
        if ($name != "") {
            $amenitiesArr = getAmenitieById("", $name, "yes", "yes");
            if ($amenitiesArr < 1) {
                $sql = "insert into amenities(hotelId,title) values('$hotelId', '$name')";
                if (mysqli_query($conDB, $sql)) {
                    $data = ["status" => "no", "name" => $name, "msg" => ""];
                } else {
                    $data = [
                        "status" => "yes",
                        "name" => "",
                        "msg" => "Something wrong.",
                    ];
                }
            } else {
                $data = [
                    "status" => "yes",
                    "name" => "",
                    "msg" => "Already Exists",
                ];
            }
        } else {
            $data = [
                "status" => "yes",
                "name" => "",
                "msg" => "Amenities Name Required.",
            ];
        }

        echo json_encode($data);
    }

    if ($type == "amenitiesDelete") {
        $name = safeData($_POST["amenities"]);
        $amenitiesArr = getAmenitieById("", $name, "yes");
        $amenitiesId = $amenitiesArr["id"];
        $sql = "delete from amenities where id = '$amenitiesId'";

        if (mysqli_query($conDB, $sql)) {
            echo 1;
        } else {
            echo 0;
        }
    }

    if ($type == "checkRoomInputData") {
        $cname = $_POST["cname"];
        $cnamevalue = trim($_POST["cnamevalue"]);
        $rid = $_POST["rid"];
        $roomarry = [];

        if ($cname == "header") {
            $roomarry = getRoomList("", "", $cnamevalue, $rid);
        }

        if($cnamevalue == ''){
            $data = [
                "type" => "header",
                "error" => "yes",
                "msg" => "Room name is required.",
            ];
        }
        elseif  (count($roomarry) > 1) {
            $data = [
                "type" => "header",
                "error" => "yes",
                "msg" => "Room Name Already Exists.",
            ];
        } else {
            $data = [
                "type" => "",
                "error" => "",
                "msg" => "",
            ];
        }

        echo json_encode($data);
    }

    if ($type == "deleteRoomImg") {
        $rimgid = $_POST["imgId"];
        $filePath = $_POST["filePath"];
        $imagArr = getHotelImageData("",'','','',$rimgid);
       
        if (isset($imagArr[0]['id'])) {
            $accessId = $imagArr[0]['accessId'];
            $private = ($imagArr[0]["private"] == 'private') ? 'yes' : '';
            $sql = "delete from hotel_image where id = $rimgid";
            if (mysqli_query($conDB, $sql)) {
                if($filePath == 'users'){
                    mysqli_query($conDB, "update hoteluser set imageId = 0 where id ='$accessId'");
                }
                imgUploadWithData("", "", $imagArr[0]["image"],'','','',$private);
                echo 1;
            } else {
                echo 0;
            }
        }
    }
}

if (isset($_POST["night"])) {
    $night = $_POST["night"];
    $key = $_POST["key"];
    $rid = $_POST["rid"];

    $check_in = strtotime($_SESSION["room"][$key]["checkIn"]);
    $oldNight = $_SESSION["room"][$key]["night"];
    $_SESSION["room"][$key]["night"] = $night;

    $check_out = strtotime($_SESSION["room"][$key]["checkout"]);
    $night_string = strtotime("1 day 00 second", 0);

    $check_out_time = $check_in + $night * $night_string;

    $preCheckOutTime = $check_out_time - $night_string;

    if (loopRoomExist($rid, date("Y-m-d", $preCheckOutTime)) == 0) {
        $_SESSION["room"][$key]["checkout"] = date("Y-m-d", $check_out);
        $_SESSION["room"][$key]["night"] = $oldNight;
        echo "noNight";
    } else {
        $_SESSION["room"][$key]["checkout"] = date("Y-m-d", $check_out_time);
    }
}

?>