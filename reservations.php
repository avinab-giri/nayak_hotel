<?php

include('include/constant.php');
include(SERVER_INCLUDE_PATH . 'db.php');
include(SERVER_INCLUDE_PATH . 'function.php');
// include(SA_SERVER_SCREEN_PATH . 'svg.php');

checkLoginAuth();

checkProductExistOrNot([3, 1, 5], 2);

$backLink = FRONT_SITE;
if (isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] != '') {
    $backLink = $_SERVER['HTTP_REFERER'];
}

$grcLink = FRONT_SITE . '/grc';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <title>Reservations </title>

    <script src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

    <?php include(FO_SERVER_SCREEN_PATH . 'link.php') ?>


</head>

<body class="g-sidenav-show  bg-gray-100">

    <?php include(FO_SERVER_SCREEN_PATH . 'sidebar.php') ?>


    <?php include(FO_SERVER_SCREEN_PATH . 'navbar.php') ?>

    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">


        <div class="container">

            <div class="reservationNav sNavBar">
                <?php

                $stayOverviewLink = FRONT_SITE.'/stay-view';

                $leftNav = '<div class="mainNavContent">
                    <ul id="loadReservationCountContent">
                         <li><a id="New" href="javascript:void(0)" class="reservationTab py-3">New</a> </li>
                        <li><a id="all" class="reservationTab py-3 active" href="javascript:void(0)">All Reservations<span></span></a></li>
                        <li><a id="noShow" href="javascript:void(0)" class="reservationTab py-3" >No Show</a></li>     
                        <li><a id="void" href="javascript:void(0)" class="reservationTab py-3" >Void</a></li>                    
                    </ul>
                    <span class="nav-indicator"></span>
                </div>';

                // <li><a id="excelExport" href="javascript:void(0)"> <i class="fas fa-file-export"></i> Export</a> </li>
                $rightNav = '
                        <ul>
                        
                            <li style="margin-right: 5px;"><a class="btn btn-success" id="excelImport" href="javascript:void(0)"> <i class="fas fa-file-import"></i> Import</a> </li>
                            <li style="margin-right: 5px;"><a target="_blank" class="mb-0 btn btn-secondary" href="' . $grcLink . '"><i class="fas fa-print"></i> Print Blank GRC</a></li>
                            <li style="margin-right: 5px;"><a class="mb-0 btn btn-info" href="' . $stayOverviewLink . '">Stay Overview <i class="ml-1 fas fa-th-list"></i></a></li>
                            <li><a class="btn btn-warning" id="searchBtnReservation" href="javascript:void(0)"> <i class="fas fa-search"></i></a> </li>
                        </ul>
                        <div id="searchForReservation">
                            <input id="searchForReservationValue" type="text" class="form-contol" placeholder="Search Text.">
                            <button id="searchForCloseBtn">X</button>
                        </div>';
                echo backNavbarUi('', '', $rightNav, $leftNav);
                ?>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div id="resorvationContent"></div>
                    <div id="loadAddResorvation"></div>
                </div>
            </div>
        </div>



    </main>
    <?php include(FO_SERVER_SCREEN_PATH . 'footer.php') ?>
    <?php include(FO_SERVER_SCREEN_PATH . 'booing_detail.php') ?>
    <?php include(FO_SERVER_SCREEN_PATH . 'script.php') ?>




    <script>
        function loadResorvation($rTab = '', $search = '', $reserveType = '', $bookingType = '', $currentDate = '') {

            var rTab = $rTab;
            var search = $search;
            var reserveType = $reserveType;
            var bookingType = $bookingType;
            var currentDate = $currentDate;

            if (rTab == '') {
                rTab = 'reservation';
            }

            $('#resorvationContent').html(`<div class="loadingIcon">
                            <img src="<?= FRONT_SITE_IMG . '/loading.gif' ?>" alt="">
                        </div>`);

            if (rTab === 'New') {
                console.log(rTab);
                loadAddResorvation('', 'reservation');
            } else {
                $('#loadAddResorvation').html('').hide();
                $.ajax({
                    url: "<?= FRONT_SITE . '/include/ajax/resorvation.php' ?>",
                    type: 'post',
                    data: {
                        type: 'load_resorvation',
                        rTab: rTab,
                        search: search,
                        reserveType: reserveType,
                        bookingType: bookingType,
                        currentDate: currentDate
                    },
                    success: function(data) {
                        $('#resorvationContent').html(data);
                        reservationCountNavBar(rTab, '', currentDate);
                    }
                });
            }

        }

        $('.linkBtn').removeClass('active');
        $('.pmsLink').addClass('active');

        const indicator = document.querySelector('.nav-indicator');
        const items = document.querySelectorAll('.reservationTab');

        function handleIndicator(el) {

            items.forEach(item => {
                item.classList.remove('active');
                item.removeAttribute('style');
            });

            indicator.style.width = `${el.offsetWidth}px`;
            indicator.style.left = `${el.offsetLeft}px`;

            el.classList.add('active');
        }

        $(document).on('click', '#fullPayment', function() {
            if ($('#fullPayment').is(':checked')) {
                $("#paymentAmount").prop('disabled', true);
            } else {
                $("#paymentAmount").prop('disabled', false);
            }
        });

        $(document).on('click', '.reservationPaymentBtn', function(e) {
            e.preventDefault();
            var bookingId = $(this).data('bookingid');
            var reservationtab = $(this).data('reservationtab');
            var bdid = $(this).data('bdid');
            var formData = `request_type=reservationPaymentSubmit&bookingId=${bookingId}&bdid=${bdid}`;
            ajax_request(formData).done((data) => {
                var response = JSON.parse(data);
                var totalPrice = response.totalPrice;
                var userPay = response.userPay;
                var pendding = numberWithCommas(totalPrice - userPay);
                var html = `
                            <form id="reservationPaymentForm" class="priceSec">
                                <p>Total payment is Rs <strong>${pendding}</strong></p>
                                <input type="hidden" name="bookingId" value="${bdid}"/>
                                <div class="row">
                                    <div class="col-4">
                                        <input name="fullPayment" class="form-check-input" type="checkbox" value="" id="fullPayment" checked="">
                                        <label class="custom-control-label" for="fullPayment">Full payment</label>
                                    </div>
                                    <div class="col-8">
                                        <label for="paymentAmount">Enter Amount</label>
                                        <input name="paymentAmount" disabled class="form-control" type="text" id="paymentAmount" placeholder="Enter payment amount.">
                                    </div>
                                </div>
                            </form>`;

                showModalBox('Get paid', 'Create link', html, 'reservationPaymentLinkSubmitBtn');
                var myModal = new bootstrap.Modal(document.getElementById('popUpModal'));
                myModal.show();
            });
        });



        $(document).ready(() => {
            loadResorvation('all');
            reservationCountNavBar();


            $('#currentDateStart').datepick({
                onSelect: function(dates) {
                    var currentDate = $(this).val();
                    var rTab = $('.reservationTab.active').attr('id');
                    loadResorvation(rTab, '', '', '1', currentDate);
                },
                dateFormat: 'yyyy-mm-dd',
            });

            $(document).on('click', '.reservationTab', function(e) {
                var tag = e.target.tagName.toLowerCase();
                if (tag == 'a') {
                    var tabName = $(this).attr('id');
                    var singleGroupBtn = $(".singleGroupToggleBtn").hasClass("active");
                    var currentDate = $('#currentDateStart').val();
                    handleIndicator(e.target);
                    if (singleGroupBtn == true) {
                        loadResorvation(tabName, '', '', '1', currentDate);
                        reservationCountNavBar(tabName, '', currentDate);
                    } else {
                        loadResorvation(tabName, '', '', '1', currentDate);
                        reservationCountNavBar(tabName, '', currentDate);
                    }
                }

            });

            items.forEach((item, index) => {
                item.addEventListener('click', e => {
                    console.log(e.target);
                    handleIndicator(e.target);
                });
                item.classList.contains('active') && handleIndicator(item);
            });

            $(document).on('click', '.reservationRemoveRateArea', function(e) {
                e.preventDefault();
                var target = $(this).parent().parent();
                target.remove();
                loadReservationPreview();
            });

            $(document).on('click', '#reservationPaymentLinkSubmitBtn', function(e) {
                e.preventDefault();
                var formData = $('#reservationPaymentForm').serialize() + '&request_type=reservationPaymentLinkSubmitBtn';
                ajax_request(formData).done((data) => {
                    var response = JSON.parse(data);
                    var link = response.link;
                    var msg = response.msg;
                    var status = response.status;
                    var paymentId = response.paymentId;
                    var amount = numberWithCommas(response.amount);

                    if (status == 'success') {
                        var title = `Rs ${amount} Payment.`;
                        var html = previewPaymentLink(paymentId, link);
                        customModal(title, html);
                    }

                    if (status == 'error') {
                        sweetAlert(msg, 'error');
                    }

                });
            });




        });

        $('#excelExport').click(function() {
            // Use html2pdf to generate and download the PDF
            var element = document.getElementById('resorvationContent');
            html2pdf(element);
        });

        function hideAddReservation() {
            console.log('clicked');
            $("#loadAddResorvation").html("").hide();
            loadResorvation('all');
        }
    </script>


</body>

</html>