<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <!-- 이슬완료 -->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <link rel="icon" href="images/favicon.ico" />
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ACENSE</title>
        <style>
            tr th, td {
            	border-bottom: 1px solid #ccc !important;
            }

            #order h3 {
            	position: relative;
            	margin-top: 40px;
            	padding-bottom: 10px;
            	font-size: 18px;
            	color: #202020;
            	font-weight: bold;
            	line-height: 18px
            }

            #order .MS_input_txt {
            	height: 23px;
            	line-height: 25px;
            	margin: 0;
            	padding: 0 5px;
            }

            #order .container {
            	border: 0;
            	display: inline-block;
            	position: relative;
            	width: 180px;
            	height: 25px;
            	overflow: hidden;
            	border: 1px solid #ddd;
            }

            #order input[type=text], #order input[type=password] {
            	height: 23px;
            	line-height: 25px;
            	padding: 0 5px;
            	border: 1px solid #ddd;
            }

            #order input[name=user_email] {
            	width: 150px;
            }

            #order .w60 {
            	width: 48px !important;
            }

            #order .w100 {
            	width: 100px !important;
            }

            #order .w120 {
            	width: 120px !important;
            }

            #order .w240 {
            	width: 240px !important;
            }

            #order .w280 {
            	width: 280px !important;
            }

            #order .fc-red {
            	color: #f00;
            }

            #order .fc-gray {
            	color: #888;
            }

            #order .fc-blue {
            	color: #0047fb;
            }

            #order .mt-10 {
            	margin-top: 10px;
            }

            #order .txt-l {
            	text-align: left;
            }

            #order .txt-c {
            	text-align: center;
            }

            #order .txt-r {
            	text-align: right;
            }

            #order .txt-bold {
            	font-weight: bold;
            }

            #order .label {
            	display: inline-block;
            	margin: 5px 0;
            }

            #order .btn-gray {
            	display: inline-block;
            	height: 21px;
            	line-height: 23px;
            	padding: 0 10px;
            	border: 1px solid #cdcdcd;
            	background: #efefef;
            	color: #888;
            	font-size: 11px;
            	border-radius: 3px;
            }

            #order .btn-darkgray {
            	display: inline-block;
            	height: 23px;
            	line-height: 25px;
            	padding: 0 10px;
            	border: 1px solid #222;
            	background: #555;
            	color: #fff;
            	font-size: 11px;
            	font-weight: bold;
            	border-radius: 3px;
            }

            #order .btn-white {
            	display: inline-block;
            	height: 23px;
            	line-height: 25px;
            	padding: 0 5px;
            	border: 1px solid #ddd;
            	color: #000;
            	font-weight: bold;
            	letter-spacing: -1px;
            	border-radius: 3px;
            }

            #order #paybutton {
            	margin-top: 40px;
            	text-align: center
            }

            #order #paybutton a {
            	width: 162px;
            	height: 48px;
            	font-size: 16px;
            	line-height: 48px
            }

            #order #paybutton img {
            	margin: 0 5px;
            }

            #order .btn-coupon {
            	display: inline-block;
            	height: 22px;
            	line-height: 25px;
            	padding: 0 9px;
            	border: 1px solid #696969;
            	background: #696969;
            	color: #fff;
            	text-align: center;
            }

            #order .btn-coupon.order {
            	background-image: url('/images/common/ico_coupon.gif');
            	background-repeat: no-repeat;
            	background-position: 8px;
            	padding: 0 9px 0 30px;
            }

            #order .btn-coupon.use {
            	display: inline-block;
            	height: 22px;
            	line-height: 25px;
            	padding: 0 9px;
            	border: 1px solid #bdbec7;
            	background: #fff;
            	color: #000;
            	text-align: center;
            }

            #order .btn-coupon.order.use {
            	background-image: url('/images/common/ico_coupon_edit.gif');
            	background-repeat: no-repeat;
            	background-position: 8px;
            	padding: 0 9px 0 30px;
            }

            #order .btn-coupon img, #order .btn-coupon.use img {
            	margin-top: -3px;
            }

            #order .tbl-order {
            	position: relative;
            	border-top: 1px solid #000
            }

            #order .tbl-order .txt-l, #order .tbl-order .txt-c {
            	padding: 0 15px;
            }

            #order .tbl-order thead th {
            	padding: 15px 5px;
            	font-size: 13px;
            	color: #101010;
            	border-bottom: 1px solid #e9e9e9;
            	background: #f7f7f7
            }

            #order .tbl-order thead td {
            	background: #f7f7f7
            }

            #order .tbl-order tbody th {
            	border-bottom: 1px solid #e9e9e9
            }

            #order .tbl-order tbody th span {
            	font-size: 12px;
            	font-weight: normal;
            }

            #order .tbl-order tbody td {
            	padding: 10px 0;
            	border-bottom: 1px solid #e9e9e9
            }

            #order .tbl-order tbody td .btn-coupon {
            	display: inline-block;
            	height: 22px;
            	line-height: 24px;
            	padding: 0 9px;
            	margin-top: 5px;
            	border: 1px solid #696969;
            	background: #696969;
            	color: #fff;
            	text-align: center;
            }

            #order .tbl-order tbody td .btn-coupon.use {
            	display: inline-block;
            	height: 22px;
            	line-height: 24px;
            	padding: 0 9px;
            	margin-top: 5px;
            	border: 1px solid #bdbec7;
            	background: #fff;
            	color: #000;
            	text-align: center;
            }

            #order .tbl-order tbody td del {
            	font-size: 11px;
            	color: #999;
            	font-weight: normal;
            }

            #order .tbl-order tbody td .tb-coupon {
            	position: relative;
            }

            #order .tbl-order tbody td .block-prd-sale-layer {
            	position: absolute;
            	top: 20px;
            	left: 39px;
            	width: 195px;
            	padding-bottom: 10px;
            	border: 2px solid #666;
            	background: #fff;
            	text-align: left;
            }

            #order .tbl-order tbody td .block-prd-sale-layer .coupon-total-close {
            	position: absolute;
            	top: 0;
            	right: 0;
            }

            #order .tbl-order tbody td .block-prd-sale-layer .coupon-total-tit {
            	height: 28px;
            	line-height: 30px;
            	padding-left: 13px;
            	font-size: 12px;
            	font-weight: bold;
            	color: #000;
            	background: #f0f0f0;
            }

            #order .tbl-order tbody .total div {
            	padding: 10px 20px;
            }

            #order .tbl-order tfoot th, #order .tbl-order tfoot td {
            	padding: 25px 0;
            	background: #ececec;
            	border-top: 2px solid #ccc;
            	border-bottom: 1px solid #ccc;
            }

            #order .tbl-order tfoot td .price {
            	color: #000;
            	font-size: 16px;
            	letter-spacing: -1px;
            }

            #order .tbl-order tfoot td .price em {
            	color: #f00;
            	font-family: tahoma;
            	font-size: 26px;
            	font-weight: normal;
            	letter-spacing: -1px;
            }

            #order .tbl-order textarea {
            	width: 500px;
            	padding: 10px;
            	border: 1px solid #ddd;
            }

            #order .tbl-order .date {
            	margin: 10px 0 5px;
            }

            #order .tbl-order .escrow {
            	padding-top: 40px;
            	color: #666;
            	line-height: 1.5;
            	text-align: center;
            }

            #order .lst-order {
            	padding: 15px;
            	border-bottom: 1px solid #ccc;
            }

            #order .chk-label {
            	display: inline-block;
            	margin: 10px 0 0 15px;
            	color: #222;
            }

            #order .tot-order {
            	margin: 10px 0;
            	border-top: 1px solid #000;
            	border-bottom: 1px solid #000;
            }

            #order .tot-order th, #order .tot-order td {
            	padding: 25px 0 25px 10px;
            	border: 0 none !important;
            	text-align: left !important;
            	background: #ececec !important
            }

            #order .tot-order td {
            	color: #777;
            }

            #order .tot-order td .price {
            	color: #000;
            	font-size: 16px;
            	letter-spacing: -1px;
            }

            #order .tot-order td .price em {
            	color: #f00;
            	font-size: 26px;
            	font-weight: bold;
            	letter-spacing: -1px;
            }

            #order .tot-order .reserve-msg {
            	padding-top: 5px;
            	font-size: 0.95em;
            }

            #order .bill {
            	position: relative;
            	padding: 10px 0 10px 110px;
            	border-bottom: 2px solid #ccc;
            }

            #order .bill dt {
            	position: absolute;
            	top: 10px;
            	left: 10px;
            	color: #222;
            	font-weight: bold;
            	letter-spacing: -1px;
            }

            #order .bill dd {
            	margin-left: 16px
            }

            #order .bill dd #cashbill_data {
            	padding-top: 5px
            }

            #order .tbl-pay {
            	margin-top: 10px;
            	border-top: 1px solid #000
            }

            #order .tbl-pay th, #order .tbl-pay td {
            	padding: 10px 0;
            	border-bottom: 1px solid #ccc;
            	color: #444;
            	background: #f7f7f7;
            }

            #order .tbl-pay .txt-l, #order .tbl-pay .txt-c {
            	padding: 0 15px;
            }

            #order .tbl-pay thead th {
            	padding: 15px;
            	background: #ececec;
            	border-bottom: 1px solid #ccc;
            	font-size: 14px;
            }

            #order .tbl-pay thead td {
            	padding: 25px 0 28px;
            	font-size: 16px;
            	text-align: center;
            }

            #order .tbl-pay thead td strong em {
            	position: relative;
            	top: 3px;
            	font-family: tahoma;
            	font-size: 26px;
            	font-weight: normal;
            	letter-spacing: -1px;
            }

            #order .tbl-pay thead td .base {
            	z-index: 1;
            	position: relative;
            }

            #order .tbl-pay thead td .base .plus, #order .tbl-pay thead td .base .minus,
            	#order .tbl-pay thead td .base .equal {
            	position: absolute;
            	top: 9px;
            	width: 23px;
            	height: 23px;
            	right: 90%;
            }

            #order .tbl-pay thead td .down {
            	position: relative;
            	top: -3px;
            }

            #order .tbl-pay tbody th {
            	letter-spacing: -1px;
            }

            #order .tbl-pay .discount {
            	position: relative;
            	margin: 10px 0;
            	padding-left: 140px;
            }

            #order .tbl-pay .discount dt {
            	position: absolute;
            	top: 50%;
            	left: 15px;
            	margin-top: -8px;
            	font-weight: bold;
            	letter-spacing: -1px;
            }

            #order .tbl-pay .discount .label {
            	margin-top: 0;
            }

            #order .chk-cont-layer {
            	display: none;
            	position: absolute;
            	top: 0;
            	left: 50%;
            	width: 430px;
            	padding: 0;
            	margin: 0 0 0 -215px;
            	background: #fff;
            	border: 1px solid #b8b8b8;
            	z-index: 999;
            }

            #order .chk-cont-layer .l-close {
            	position: absolute;
            	top: 10px;
            	right: 10px;
            }

            #order .chk-cont-layer .l-tit {
            	height: 40px;
            	line-height: 42px;
            	padding-left: 15px;
            	background: #a4a4a4;
            	font-size: 14px;
            	color: #fff;
            	font-weight: bold;
            }

            #order .chk-cont-layer .l-cont {
            	overflow-x: hidden;
            	overflow-y: auto;
            	padding: 15px;
            }

            #order .chk-cont-layer .l-cont .fc-blue {
            	padding-bottom: 5px;
            	color: #0082f0;
            }

            #order .chk-cont-layer .l-cont textarea {
            	width: 99%;
            	height: 400px;
            	border: 0;
            	font-size: 11px;
            	color: #777;
            }

            #order .chk-cont-layer .l-cont .l-tbl {
            	width: 100%;
            	border-spacing: 0;
            	border-collapse: collapse;
            }

            #order .chk-cont-layer .l-cont .l-tbl th, #order .chk-cont-layer .l-cont .l-tbl td
            	{
            	border: 1px solid #cbcbcb;
            	text-align: center;
            	font-size: 11px;
            }

            #order .chk-cont-layer .l-cont .l-tbl th {
            	color: #000;
            	font-weight: bold;
            	background: #ededed;
            }

            #order .chk-cont-layer .l-cont .l-tbl td {
            	color: #777;
            }

            #order .chk-cont-layer .l-cont .l-tbl th div, #order .chk-cont-layer .l-cont .l-tbl td div
            	{
            	padding: 10px 0 8px;
            }

            #order .escrow-info {
            	margin-top: 10px;
            	border-top: 3px solid #ccc;
            	border-bottom: 3px solid #ccc;
            	background: #eef1f7;
            	color: #666;
            }

            #order .escrow-info td {
            	padding: 20px 0;
            }

            #order .reserve-msg {
            	padding-top: 5px;
            	font-size: 0.95em;
            }

            #order .cnt-box {
            	margin-top: 10px;
            }

            #order .cnt-box-desc {
            	margin-top: 5px;
            }

            #order #okreserve, #order #okemoney {
            	margin-top: -3px;
            	border: none;
            	background: #f7f7f7;
            	font-weight: bold;
            	width: 50px;
            	text-align: right;
            }

            * {
            	-webkit-font-smoothing: antialiased;
            	-webkit-text-size-adjust: none;
            }

            html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td,
            	p, blockquote, form, fieldset, legend, menu, nav, section, hgroup,
            	article, header, aside, footer, input, select, textarea, button {
            	margin: 0;
            	padding: 0;
            }
            /*
                              body,
                              h1, h2, h3, h4, h5, h6, table,
                              pre, xmp, plaintext, listing,
                              input, textarea, select, button, a {
                                  font-size: 12px;
                                  color: #1c1c1c;
                                  line-height: 1.25;
                                  font-family: Dotum, "돋움", DotumChe, "돋움체", Verdana, monospace, Corbel, AppleGothic, Helvetica, sans-serif;
                              }
                              */
            h1, h2, h3, h4, h5, h6 {
            	font-weight: normal;
            }

            img, fieldset, button {
            	border: 0 none;
            }

            img {
            	vertical-align: middle;
            }

            li {
            	list-style: none;
            }

            hr, caption, legend {
            	display: none;
            }

            a {
            	color: #1c1c1c;
            	text-decoration: none;
            	background: none;
            }

            a:hover {

            }

            button {
            	overflow: hidden;
            	cursor: pointer;
            }

            button span {
            	visibility: hidden;
            }

            address, em {
            	font-style: normal;
            }

            button, input, select, textarea, a {
            	vertical-align: middle;
            }

            input:focus {
            	outline: none;
            }

            table {
            	width: 100%;
            	border-collapse: collapse;
            	border-spacing: 0;
            	table-layout: fixed;
            	word-wrap: break-word;
            	word-break: keep-all;
            }

            input[type=text]::-ms-clear {
            	display: none;
            }

            .pointColor {
            	color: #c08dff !important
            }

            .fc-blue {
            	color: #0e67ec;
            	font-weight: bold
            }

            /*
                              ========================================================================
                              공통 class
                              ========================================================================
                              */
            /* image replace, hidden text */
            .ir *, .blind {
            	z-index: -1;
            	position: absolute;
            	display: block;
            	left: 0;
            	top: 0;
            	overflow: hidden;
            	visibility: hidden;
            	width: 0;
            	height: 0;
            	text-indent: -9999px;
            }
            /* block, inline */
            .d-block {
            	display: block;
            }

            .d-inline {
            	display: inline;
            }
            /* form */
            .txt-right {
            	text-align: right;
            }

            .txt-input1 {
            	padding: 2px 0 0 2px;
            	height: 31px;
            	line-height: 31px;
            	border: 1px solid #e2e9ef;
            	border-top: 1px solid #aaadb2;
            }

            .txt-input2 {
            	padding: 2px 0 0 2px;
            	height: 31px;
            	line-height: 31px;
            	border: 1px solid #dcdcdc;
            }

            .MS_input_txt {
            	margin-right: 5px;
            	padding: 2px 0 0 2px;
            	line-height: 31px;
            	height: 31px
            }

            .txt-disabled {
            	background-color: #f6f6f6;
            }

            .chk-rdo {
            	width: 13px;
            	height: 13px;
            	vertical-align: middle;
            }

            .txt-area1 {
            	overflow-y: scroll;
            	padding: 2px 0 0 2px;
            	line-height: 17px;
            	border: 1px solid #e2e9ef;
            	border-top: 1px solid #aaadb2;
            }
            /* file add trick */
            .file-wrap {
            	display: inline-block;
            	overflow: hidden;
            	position: relative;
            	height: 23px;
            	width: 280px;
            	vertical-align: middle;
            	background: url(/images/btn/h20_trick_fileadd.gif) no-repeat right 0;
            }

            .file-wrap .file-txt {
            	float: left;
            	border: 0 none;
            	height: 18px;
            	font-size: 12px;
            	line-height: 18px;
            	width: 198px;
            	border: 1px solid #ccc;
            }

            .file-wrap .file-trick {
            	cursor: pointer;
            	position: absolute;
            	right: 0px;
            	top: 0;
            	right: 0;
            	width: 100px;
            	height: 20px;
            	background: none;
            	border: 0 none;
            	opacity: 0;
            	filter: alpha(opacity = 0);
            }
            /* en-font */
            .fe {
            	font-family: Verdana
            }
            /* font-color */
            .fc-red {
            	color: #bd101b;
            }

            .MS_option_price {
            	color: #fe3333
            }
            /* bold */
            .bold {
            	font-weight: bold;
            }
            /* float clear */
            .clear {
            	zoom: 1;
            }

            .clear:after {
            	content: "";
            	display: block;
            	clear: both;
            }
            /* margin */
            .nomg {
            	margin: 0 !important
            }

            .mr-5 {
            	margin-right: 5px;
            }

            .mr-10 {
            	margin-right: 10px;
            }

            .mr-15 {
            	margin-right: 15px;
            }

            .mr-20 {
            	margin-right: 20px;
            }

            .ml-5 {
            	margin-left: 5px;
            }

            .ml-10 {
            	margin-left: 10px;
            }

            .ml-15 {
            	margin-left: 15px;
            }

            .ml-20 {
            	margin-left: 20px;
            }

            .mt-5 {
            	margin-top: 5px;
            }

            .mt-10 {
            	margin-top: 10px;
            }

            .mt-15 {
            	margin-top: 15px;
            }

            .mt-20 {
            	margin-top: 20px;
            }

            .mb-5 {
            	margin-bottom: 5px;
            }

            .mb-10 {
            	margin-bottom: 10px;
            }

            .mb-15 {
            	margin-bottom: 15px;
            }

            .mb-20 {
            	margin-bottom: 20px;
            }
            /* padding */
            .nopd {
            	padding: 0 !important
            }

            .pr-5 {
            	padding-right: 5px;
            }

            .pr-10 {
            	padding-right: 10px;
            }

            .pr-15 {
            	padding-right: 15px;
            }

            .pr-20 {
            	padding-right: 20px;
            }

            .pl-5 {
            	padding-left: 5px;
            }

            .pl-10 {
            	padding-left: 10px;
            }

            .pl-15 {
            	padding-left: 15px;
            }

            .pl-20 {
            	padding-left: 20px;
            }

            .pl-30 {
            	padding-left: 30px;
            }

            .pt-5 {
            	padding-top: 5px;
            }

            .pt-10 {
            	padding-top: 10px;
            }

            .pt-15 {
            	padding-top: 15px;
            }

            .pt-20 {
            	padding-top: 20px;
            }

            .pb-5 {
            	padding-bottom: 5px;
            }

            .pb-10 {
            	padding-bottom: 10px;
            }

            .pb-15 {
            	padding-bottom: 15px;
            }

            .pb-20 {
            	padding-bottom: 20px;
            }
            /* table */
            table img {
            	vertical-align: middle;
            }

            .tb-bold {
            	font-weight: bold;
            }

            .tb-left, .tb-center, .tb-right {
            	padding: 0 10px;
            }

            .tb-btn {
            	padding: 0;
            }

            .tb-left {
            	text-align: left;
            }

            .tb-center {
            	text-align: center;
            }

            .tb-right {
            	text-align: right;
            }

            .tb-label-r5 label {
            	margin-right: 5px;
            }

            .tb-label-r10 label {
            	margin-right: 10px;
            }

            .tb-label-r10 label.last, .tb-label-r5 label.last {
            	margin-right: 0;
            }
            /* table-type-1 */
            .table-type-1 {
            	border-top: 1px solid #b7b7b7;
            	border-bottom: 1px solid #b7b7b7;
            }

            .table-type-1 th, .table-type-1 td {
            	padding: 8px 0 8px;
            	background: url(/images/d3/modern_simple/common/dot_h1_w10.gif) repeat-x
            		0 bottom;
            }

            .table-type-1 tr.nbg th, .table-type-1 tr.nbg td {
            	background-image: none;
            }

            .table-type-1 tr.bg th, .table-type-1 tr.bg td {
            	background-color: #f8f8f8;
            }

            .table-type-1 th {
            	font-weight: normal;
            }
            /* table-type-2 */
            .table-type-2 {
            	border-top: 1px solid #000
            }

            .table-type-2 th, .table-type-2 td {
            	border-bottom: 1px solid #e9e9e9
            }

            .table-type-2 th {
            	padding: 16px 0;
            	font-size: 13px;
            	color: #101010;
            	font-weight: normal
            }

            .table-type-2 td {
            	padding: 10px 0;
            	color: #343434
            }

            .table-type-2 td li {
            	padding: 5px 0
            }

            .table-type-2 td a {
            	vertical-align: top
            }

            .table-type-2 td.review-tx {
            	padding: 15px 130px;
            	color: #999
            }

            .table-type-2 td.nodata {
            	padding: 15px 0;
            	text-align: center
            }

            .table-type-2 tr.nbg th, .table-type-2 tr.nbg td {
            	background-image: none;
            }
            /* 상품리스트 (메인/검색/상품리스트) */
            .prd-list {
            	margin-top: 10px;
            }

            .prd-list table td {
            	border: 0;
            }

            .prd-list table .tb-center {
            	padding: 0 10px;
            }

            .prd-list table .info {
            	padding: 5px 0;
            }

            .prd-list .thumb {
            	width: 196px;
            	height: 196px;
            	margin-left: auto;
            	margin-right: auto;
            	font-size: 0;
            	line-height: 0;
            	border: 2px solid #f2f4f3;
            }

            .prd-list .thumb a, .prd-list .thumb img {
            	display: block;
            	width: 100%;
            	height: 100%;
            }

            .prd-list .dsc {
            	margin-top: 15px;
            	font-weight: bold;
            }

            .prd-list .price {
            	margin-top: 5px;
            	font-weight: bold;
            	color: #333;
            }
            /* 장바구니 리스트, 주문상품 리스트 */
            .table-cart {
            	border-bottom: 1px solid #e9e9e9
            }

            .table-cart thead th {
            	padding: 15px 0;
            	font-size: 13px;
            	color: #101010;
            	font-weight: bold;
            	border-bottom: 1px solid #e9e9e9
            }

            .table-cart tbody td {
            	padding: 10px 0;
            	border-top: 1px solid #e9e9e9
            }

            .table-cart tbody td .thumb {
            	width: 70px;
            	height: 70px;
            	margin-left: auto;
            	margin-right: auto
            }

            .table-cart tbody td .thumb a, .table-cart tbody td .thumb img {
            	display: block;
            	width: 70px;
            	height: 70px
            }

            .table-cart tbody td .tb-opt {
            	padding-top: 5px
            }

            .table-cart tbody td .tb-opt .tb-dl .opt_dt {
            	display: inline-block;
            	width: 34px;
            	line-height: 21px;
            	vertical-align: top
            }

            .table-cart tbody td .tb-opt .tb-dl .opt_dd {
            	display: inline-block;
            	line-height: 21px;
            	word-break: break-all
            }

            .table-cart tbody td .txt-spin {
            	width: 31px;
            	height: 21px;
            	border: 1px solid #acacac;
            	font-size: 11px;
            	text-align: center
            }

            .table-cart tbody td .btn_option {
            	padding: 5px 11px 3px;
            	font-size: 11px
            }

            .table-cart tbody td .btn_select {
            	width: 70px;
            	padding: 5px 0 3px;
            	font-size: 11px
            }

            .table-cart tbody td .d-block {
            	padding-bottom: 3px;
            }

            .table-cart tfoot td {
            	padding: 15px 0;
            	font-weight: bold;
            	line-height: 20px;
            	border-top: 1px solid #e9e9e9
            }

            .table-cart tfoot strong {
            	color: #fe3333
            }

            /* 일반형 주문서 작성 */
            .table-order-prd {
            	border-top: 1px solid #000
            }

            /* 수량 컨트롤 */
            .table-cart .opt-spin {
            	position: relative;
            	width: 50px;
            	height: 21px;
            	margin-left: auto;
            	margin-right: auto;
            	padding-bottom: 6px
            }

            .table-cart .opt-spin .txt-spin, .table-cart .opt-spin .btns {
            	float: left;
            }

            .table-cart .opt-spin .txt-spin {
            	margin-right: 3px;
            	width: 31px;
            	height: 21px;
            	border: 1px solid #acacac;
            	font-size: 11px;
            	text-align: center
            }

            .table-cart .opt-spin .btns {
            	width: 12px;
            	height: 20px;
            	margin-top: 4px;
            }

            .table-cart .opt-spin .btns img {
            	overflow: hidden;
            	float: left;
            	text-indent: -999px;
            	background: none;
            }
            /* 주문 - 주문정보 테이블 */
            .table-order-info {
            	margin-top: 10px;
            	border-top: 1px solid #000
            }

            .table-order-info tbody th, .table-order-info tbody td {
            	padding: 12px 0 11px 0;
            	border-bottom: 1px solid #e9e9e9
            }

            .table-order-info tbody th {
            	background-color: #f8f8f8
            }

            .table-order-info tbody th div.tb-left {
            	padding-left: 25px
            }

            .table-order-info tbody td {
            	padding-left: 10px
            }

            .table-order-info tbody th .d-block {
            	font-weight: normal;
            	letter-spacing: 0;
            }

            .table-order-info tbody tr.nbg th, .table-order-info tbody tr.nbg td {
            	background-image: none;
            }
            /* 마이페이지 디자인 타입2 테이블 리스트, 타이틀 */
            .tit-tb-list {
            	margin-top: 40px;
            	font-size: 18px;
            	color: #2e2e2e;
            	font-weight: bold
            }

            .table-d2-list {
            	border-top: 1px solid #000
            }

            .table-d2-list thead th {
            	padding: 15px 0;
            	font-size: 13px;
            	color: #000;
            	font-weight: bold;
            	border-bottom: 1px solid #e9e9e9
            }

            .table-d2-list tbody td {
            	padding: 15px 0;
            	color: #343434;
            	border-bottom: 1px solid #e9e9e9
            }

            .table-d2-list tbody td a {
            	color: #343434
            }

            .table-d2-list tbody td .replyYes {
            	display: inline-block;
            	padding: 4px 3px 3px;
            	font-size: 11px;
            	color: #fff;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #231f20
            }

            .table-d2-list tbody td .replyNo {
            	display: inline-block;
            	padding: 4px 3px 3px;
            	font-size: 11px;
            	color: #231f20;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #fff
            }

            /* 마이페이지 디자인 타입2 테이블 뷰 */
            .table-d2-view {
            	margin-top: 10px;
            	border-top: 1px solid #000
            }

            .table-d2-view th, .table-d2-view td {
            	padding: 15px 0;
            	border-bottom: 1px solid #e9e9e9
            }

            .table-d2-view th {
            	padding-left: 20px;
            	font-size: 14px;
            	color: #000;
            	font-weight: normal;
            	background: #f8f8f8
            }

            .table-d2-view td {
            	padding: 15px 0
            }

            .table-d2-view td .replyYes {
            	display: inline-block;
            	padding: 4px 3px 3px;
            	font-size: 11px;
            	color: #fff;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #231f20
            }

            .table-d2-view td .replyNo {
            	display: inline-block;
            	padding: 4px 3px 3px;
            	font-size: 11px;
            	color: #231f20;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #fff
            }
            /* paging */
            .paging {
            	padding: 20px 0;
            	text-align: center
            }

            .paging a {
            	display: inline-block;
            	padding: 0 10px;
            	height: 16px;
            	font-size: 16px;
            	color: #a6a6a6;
            	font-family: 'Verdana';
            	line-height: 16px
            }

            .paging a:hover, .paging a.now, .paging .now {
            	color: #2a2a2a
            }

            .paging a.first, .paging a.prev, .paging a.next, .paging a.last {
            	font-size: 13px;
            	font-family: dotum;
            	line-height: 18px
            }

            .paging a.first, .paging a.last {
            	letter-spacing: -4px
            }

            /* 현재위치 */
            .loc-navi {
            	height: 100px;
            	text-align: center;
            	overflow: hidden;
            	padding-top: 50px;
            	font-size: 30px;
            }

            .loc-navi, .loc-navi a {
            	color: #878787;
            	text-transform: capitalize;
            	vertical-align: top;
            	line-height: 46px
            }
            /* 페이지 타이틀 */
            /* 타입 1*/
            #content .tit-page {
            	padding-bottom: 10px;
            	position: relative;
            	font-size: 18px;
            	color: #202020;
            	line-height: 18px;
            	font-weight: bold;
            	border-bottom: 1px solid #000
            }

            #content .tit-page .dsc {
            	position: absolute;
            	right: 0px;
            	top: 15px;
            	font-size: 11px;
            	color: #a5a5a5;
            	letter-spacing: -1px;
            }

            #content .tit-page .dsc em {
            	color: #333;
            }
            /* 타입 2 */
            #content .tit-page-2 {
            	margin-top: 40px;
            	position: relative
            }

            #content .tit-page-2 h2 {
            	font-size: 18px;
            	color: #2e2e2e;
            	font-weight: bold
            }

            #content .tit-page-2 .dsc {
            	position: absolute;
            	top: 8px;
            	right: 0
            }
            /* 타입 3 */
            #content .page-hd {
            	padding-bottom: 5px;
            	border-bottom: 1px solid #e3e3e3
            }

            #content .page-hd h2 {
            	color: #202020;
            	font-size: 18px;
            	font-weight: bold;
            	text-transform: uppercase
            }

            /* 상품 total/정렬 */
            .total-sort {
            	zoom: 1;
            	overflow: hidden;
            	padding-bottom: 5px;
            	border-bottom: 1px solid #e5e5e5;
            }
            /* total */
            .total-sort .total {
            	float: left;
            	width: auto;
            }

            .total-sort .total dt, .total-sort .total dd {
            	display: inline;
            }

            .total-sort .total dd {
            	font-weight: bold;
            }

            .total-sort .total dt {
            	text-transform: capitalize;
            }
            /* sort */
            .total-sort .sort {
            	float: right;
            	width: auto;
            	display: inline;
            	margin-right: 20px;
            }

            .total-sort .sort li, .total-sort .sort li a {
            	float: left;
            	width: auto;
            }

            .total-sort .sort li {
            	display: inline;
            	margin-left: 10px;
            }
            /* 게시판 총게시글,PAGE */
            .total-page {
            	zoom: 1;
            	overflow: hidden;
            }

            .total-page .total {
            	float: left;
            	width: auto;
            }

            .total-page .page {
            	float: right;
            	width: auto;
            }
            /* 회원 등급 표시 */
            /* 타입 1 */
            .mem-lvl {
            	*zoom: 1;
            	overflow: hidden;
            	padding: 25px 0 25px 350px;
            	width: 753px;
            	margin: 0 auto;
            	border-bottom: 1px dashed #e9e9e9
            }

            .mem-lvl:after {
            	display: block;
            	clear: both;
            	content: ''
            }

            .mem-lvl .lvl-img, .mem-lvl p {
            	position: relative;
            	float: left;
            }

            .mem-lvl .lvl-img {
            	left: -120px;
            	margin-right: -120px;
            	width: 120px;
            }

            .mem-lvl p {
            	width: 100%;
            	padding-top: 10px;
            	font-size: 12px;
            	color: #2e2e2e;
            	line-height: 25px
            }

            .mem-lvl p em {
            	color: #be101a;
            	font-weight: bold;
            }

            .mem-lvl span.MS_group_reserve_msg, .mem-lvl span.MS_group_dc_msg {
            	color: #F26622;
            }

            /* 타입 2 */
            .mem-lvl-2 {
            	zoom: 1;
            	overflow: hidden;
            	padding: 15px 50px 15px 150px;
            	border: 5px solid #ededed;
            }

            .mem-lvl-2 .lvl-img, .mem-lvl-2 p {
            	position: relative;
            	float: left;
            }

            .mem-lvl-2 .lvl-img {
            	left: -130px;
            	margin-right: -130px;
            	width: 120px;
            	border-right: 1px solid #ededed;
            }

            .mem-lvl-2 p {
            	width: 100%;
            	padding-top: 10px;
            	line-height: 16px;
            }

            .mem-lvl-2 p em {
            	color: #be101a;
            	font-weight: bold;
            }

            .mem-lvl-2 span.MS_group_reserve_msg, .mem-lvl-2 span.MS_group_dc_msg {
            	color: #F26622;
            }

            /* 마이페이지 상단 메시지 박스 */
            .t-box-msg {
            	padding: 10px 20px;
            	border: 5px solid #ededed;
            }

            .t-box-msg strong {
            	color: #0178d3;
            }

            /*
                              ========================================================================
                              디자인위브 추가
                              ========================================================================
                              */
            html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td,
            	p, blockquote, form, fieldset, legend, menu, nav, section, hgroup,
            	article, header, aside, footer, input, select, textarea, button {
            	font-family: "Raleway", "Malgun Gothic", "맑은 고딕", Nanum Gothic, "나눔 고딕",
            		AppleGothic, Dotum, 'Apple SD Gothic Neo', "돋움", sans-serif;
            }

            body, th, td, input, select, textarea, button {
            	font-size: 12px;
            	line-height: 1.5;
            	font-family: Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
            		sans-serif;
            	color: #333;
            }

            body {
            	min-width: 100%;
            }

            #wrap {
            	min-width: auto;
            }

            #container {
            	border-top: none;
            	margin: 0;
            }

            #comment_password input {
            	width: 185px !important
            }

            .CSSbuttonBlack {
            	display: inline-block;
            	color: #fff;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #231f20;
            	-webkit-transition: all 0.3s ease;
            	transition: all 0.3s ease
            }

            .CSSbuttonBlack:hover {
            	color: #231f20;
            	background: #fff
            }

            .CSSbuttonBlack:active {
            	position: relative;
            	top: 1px
            }

            .CSSbuttonWhite {
            	display: inline-block;
            	color: #231f20;
            	text-align: center;
            	border: 1px solid #231f20;
            	background: #fff;
            	-webkit-transition: all 0.3s ease;
            	transition: all 0.3s ease
            }

            .CSSbuttonWhite:hover {
            	color: #fff;
            	background: #231f20
            }

            .CSSbuttonWhite:active {
            	position: relative;
            	top: 1px
            }

            .CSSbuttonGray {
            	display: inline-block;
            	color: #231f20;
            	text-align: center;
            	border: 1px solid #e4e4e5;
            	background: #fff;
            	-webkit-transition: all 0.3s ease;
            	transition: all 0.3s ease
            }

            .CSSbuttonGray:hover {
            	color: #fff;
            	border: 1px solid #231f20;
            	background: #231f20
            }

            .CSSbuttonGray:active {
            	position: relative;
            	top: 1px
            }

            .CSSbuttonMin {
            	padding: 3px 10px;
            	font-size: 10px
            }

            /*
                              ========================================================================
                              공통 - 레이아웃
                              ========================================================================
                              */
            /* z-index */
            #layerWrap {
            	z-index: 1;
            }
            /* layout */
            #header, #layerWrap, #contentWrap, #ftLink .link, #footer {
            	position: relative;
            	width: 1100px;
            	margin-left: auto;
            	margin-right: auto;
            }

            #contentWrapper {
            	position: relative;
            }

            #contentWrap {
            	*zoom: 1
            }

            #contentWrap:after {
            	content: "";
            	display: block;
            	clear: both;
            }

            #aside, #content {
            	position: relative
            }

            #content {
            	min-height: 400px
            }

            /* 상품 미리보기 레이어 */
            #detailpage {
            	position: absolute;
            	top: 100px;
            	display: block;
            	width: 936px;
            	padding: 43px;
            	border: 1px solid #838897;
            	background-color: #fff;
            }

            #detailpage .detail {
            	zoom: 1;
            	overflow: hidden;
            	padding-left: 526px
            }

            #detailpage .detail:after {
            	display: inline-block;
            	clear: both;
            	content: ''
            }

            #detailpage .thumb-wrap, #detailpage .txt-wrap {
            	position: relative;
            	float: left;
            }

            #detailpage .close-layer {
            	position: absolute;
            	top: 19px;
            	right: 19px;
            	width: 26px;
            	height: 26px;
            	text-indent: -9999em;
            	background:
            		url(//image.makeshop.co.kr/makeshop/d3/basic_simple/common/btn_close_layer.gif)
            		0 0 no-repeat
            }
            /* thumb-wrap */
            #detailpage .thumb-wrap {
            	width: 486px;
            	height: auto;
            	left: -526px;
            	margin-right: -526px;
            	text-align: center
            }

            #detailpage .thumb-wrap .btns {
            	margin-top: 10px;
            	font-size: 0;
            	line-height: 0;
            }

            #detailpage .thumb-wrap .btns a {
            	margin-left: 5px;
            }

            #detailpage .thumb-wrap .thumb img {
            	width: 486px
            }
            /* txt-wrap */
            #detailpage .txt-wrap {
            	width: 100%;
            }

            #detailpage .txt-wrap .picon {
            	padding-top: 10px
            }

            #detailpage .txt-wrap .picon img {
            	margin-right: 3px
            }

            #detailpage .txt-wrap .ptit {
            	font-size: 18px;
            	color: #1c1c1c
            }

            #detailpage .txt-wrap .table-opt {
            	margin-top: 10px
            }

            #detailpage .txt-wrap .table-opt th, #detailpage .txt-wrap .table-opt td
            	{
            	padding: 4px 0
            }

            #detailpage .txt-wrap .table-opt th {
            	color: #969696;
            	font-weight: normal
            }

            #detailpage .txt-wrap .table-opt th .tb-left, #detailpage .txt-wrap .table-opt td .tb-left
            	{
            	padding: 0
            }

            #detailpage .txt-wrap .table-opt td {
            	color: #555
            }

            #detailpage .txt-wrap .table-opt .sell_price {
            	font-size: 18px;
            	color: #1c1c1c;
            	font-weight: bold
            }

            #detailpage .txt-wrap .f-btns {
            	margin-top: 10px
            }

            #detailpage .txt-wrap .f-btns .soldout {
            	margin-top: 6px;
            	width: 408px;
            	height: 104px;
            	font-size: 14px;
            	color: #231f20;
            	text-align: center;
            	line-height: 104px;
            	letter-spacing: 2px;
            	border: 1px solid #231f20;
            	background: #fff
            }

            #detailpage .txt-wrap .f-btns a {
            	margin-top: 6px
            }

            #detailpage .txt-wrap .f-btns .btn_buy {
            	display: block;
            	width: 408px;
            	height: 40px;
            	font-size: 13px;
            	color: #fff;
            	font-family: Verdana;
            	text-align: center;
            	line-height: 40px;
            	border: 1px solid #231f20;
            	background: #231f20
            }

            #detailpage .txt-wrap .f-btns .btn_buy:hover {
            	color: #000;
            	background: #fff
            }

            #detailpage .txt-wrap .f-btns .btn_buy:active {
            	position: relative;
            	top: 1px
            }

            #detailpage .txt-wrap .f-btns .btn_cart {
            	display: block;
            	width: 408;
            	height: 40px;
            	font-size: 14px;
            	color: #231f20;
            	font-family: Verdana;
            	text-align: center;
            	line-height: 40px;
            	border: 1px solid #231f20;
            	background: #fff
            }

            #detailpage .txt-wrap .f-btns .btn_cart:hover {
            	color: #fff;
            	background: #231f20
            }

            #detailpage .txt-wrap .f-btns .btn_cart:active {
            	position: relative;
            	top: 1px
            }
            /* opt-spin */
            #detailpage .opt-spin {
            	display: inline-block;
            	position: relative;
            	width: 36px;
            	height: 20px;
            }

            #detailpage .opt-spin .txt-spin {
            	width: 22px;
            	height: 18px;
            	padding-right: 2px padding-top: 2px;
            	border: 1px solid #acacac;
            	font-size: 11px;
            	text-align: right;
            }

            #detailpage .opt-spin .btns {
            	position: absolute;
            	left: 35px;
            	top: 0px;
            	width: 12px;
            	height: 20px;
            }

            #detailpage .opt-spin .btns img {
            	overflow: hidden;
            	float: left;
            	text-indent: -999px;
            	background: none;
            }

            #detailpage .thumb-wrap .btns {
            	margin-top: 10px;
            	font-size: 0;
            	line-height: 0;
            }

            #detailpage .thumb-wrap .btns a {
            	margin-left: 5px;
            }

            /* 게시판 공통 - 일반, 겔러리, 컨텐츠링크, 자료실, 미니홈피, 방명록, 동영상 */
            /* 상단 */
            .bbs-hd {
            	padding: 65px 0 20px;
            	border-bottom: 1px dashed #e9e9e9
            }

            .bbs-hd .link {
            	text-align: center
            }

            .bbs-hd .link li {
            	display: inline;
            }

            .bbs-hd .link li a {
            	padding: 0 10px;
            	color: #b7b7b7;
            	background: url(/images/d3/modern_simple/common/bull_bbs_hd_link.gif)
            		no-repeat left 2px;
            }

            .bbs-hd .link li.last a {
            	background-image: none;
            }
            /* 타이틀 */
            .bbs-tit {
            	margin-top: 60px;
            	*zoom: 1
            }

            .bbs-tit:after {
            	display: block;
            	clear: both;
            	content: ''
            }

            .bbs-tit h3 {
            	float: left;
            	font-size: 16px;
            	color: #000;
            	font-weight: bold;
            	line-height: 30px
            }
            /* 검색 */
            .bbs-sch {
            	float: right
            }

            .bbs-sch label {
            	margin-right: 10px;
            	font-size: 11px
            }

            .bbs-sch label input {
            	margin-top: -3px;
            	vertical-align: middle
            }

            .bbs-sch .key-wrap {
            	font-size: 0;
            	line-height: 0;
            }

            .bbs-sch .key-wrap, .bbs-sch .keyword, .bbs-sch img {
            	vertical-align: middle;
            }

            .bbs-sch .key-wrap a {
            	margin-left: -1px;
            	vertical-align: top
            }

            .bbs-sch img {
            	*margin-top: 1px;
            	*margin-left: -1px;
            	vertical-align: top
            }

            .bbs-sch .MS_input_txt {
            	margin: 0;
            	padding: 0 0 0 5px;
            	width: 178px;
            	height: 28px;
            	border: 1px solid #c3c3c3
            }

            .bbs-sch .keyword {
            	width: 125px;
            	height: 14px;
            	padding: 2px 0 0 2px;
            	margin-right: 3px;
            	line-height: 14px;
            	border: 1px solid #ededed;
            }
            /* 게시판 글쓰기, 목록 이동 링크 */
            .bbs-btm {
            	padding: 15px 0;
            	position: relative;
            	*zoom: 1
            }

            .bbs-btm:after {
            	display: block;
            	clear: both;
            	content: ''
            }

            .bbs-btm .bbs-link {
            	float: right
            }

            .bbs-btm .bbs-link a {
            	margin-left: 3px;
            	width: 108px;
            	height: 38px;
            	font-size: 13px;
            	line-height: 38px
            }

            .bbs-btm .bbs-paging .paging {
            	margin: 0 auto;
            	padding: 10px 0
            }
            /* 게시판 한줄공지 */
            .bbs-online-notice {
            	margin-top: 10px;
            	margin-bottom: -10px;
            	padding: 7px 10px;
            	color: #9d9d9d;
            	border-top: 1px solid #e5e5e5;
            	border-bottom: 1px solid #e5e5e5;
            }
            /* 게시판 타입 - 리스트 */
            .bbs-table-list {
            	margin-top: 10px
            }

            .bbs-table-list thead th, .bbs-table-list tbody td {
            	padding: 15px 0
            }

            .bbs-table-list thead th {
            	font-size: 13px;
            	color: #000;
            	font-weight: normal;
            	font-family: Verdana;
            	border-top: 1px solid #000;
            	border-bottom: 1px solid #e9e9e9
            }

            .bbs-table-list tbody td {
            	color: #343434;
            	border-bottom: 1px solid #e9e9e9
            }

            .bbs-table-list tbody td a {

            }
            /* 게시판 타입 - 보기 */
            .bbs-table-view {
            	margin-top: 10px
            }

            .bbs-table-view thead th, .bbs-table-view tbody td {
            	padding: 15px 0
            }

            .bbs-table-view thead th {
            	color: #000;
            	font-size: 15px;
            	font-weight: normal;
            	border-top: 1px solid #000;
            	border-bottom: 1px solid #e9e9e9
            }

            .bbs-table-view .btn-dwn {
            	margin-top: 15px;
            }

            .bbs-table-view .privercy-agree label {
            	vertical-align: -2px \0/IE8 +9;
            	*vertical-align: bottom
            }

            .bbs-table-view .privercy-agree label input {
            	vertical-align: top;
            	*vertical-align: top
            }
            /* 팝업 타이틀 (1:1고객게시판) */
            .tit-pop {
            	position: relative
            }

            .tit-pop h1 {
            	font-size: 18px;
            	color: #000;
            	font-weight: bold;
            	line-height: 18px
            }

            .tit-pop .txt {
            	position: absolute;
            	top: 5px;
            	right: 0;
            	font-size: 12px;
            	color: #343434
            }

            /* 미니홈피, 방명록 게시글 뷰 */
            /* 상단 */
            .visit-vhd {
            	margin-top: 10px;
            	border-top: 1px solid #000
            }

            .visit-vhd th, .visit-vhd td {
            	padding: 15px 0;
            	border-bottom: 1px solid #e9e9e9;
            	font-size: 15px;
            	color: #000
            }

            .visit-vhd .tb-left {
            	padding: 0 10px
            }
            /* 내용*/
            .visit-vcont th, .visit-vcont td {
            	padding: 15px 0;
            	color: #000
            }

            .visit-vcont .info em {
            	font-weight: bold
            }

            .visit-vcont .info .video-writer {
            	display: inline-block;
            	*display: inline
            }

            .visit-vcont tr.no-line th, .visit-vcont tr.no-line td {
            	padding-bottom: 0;
            	border-bottom: 0;
            }

            .visit-vcont tr.dot-line th, .visit-vcont tr.dot-line td {
            	padding-top: 2px;
            	border-bottom: 1px dotted #e5e5e5;
            }

            .visit-vcont tr.info td .tb-left {
            	padding-left: 0;
            	color: #555;
            }

            .visit-vcont .tb-left {
            	padding: 0 3px;
            }

            .visit-vcont td .tb-cont {
            	padding: 15px 0;
            	min-height: 250px;
            	color: #8d8d8d
            }

            .visit-vcont td .tb-cont img {
            	max-width: 100%;
            }
            /* 코멘트 */
            .visit-vcmt {
            	border-top: 1px solid #000
            }

            .visit-vcmt td {
            	padding: 20px 0 15px;
            	border-bottom: 1px dashed #e9e9e9;
            	vertical-align: top
            }

            .visit-vcmt .com-name {
            	margin-right: 20px;
            	font-weight: bold;
            	color: #000
            }

            .visit-vcmt .com-date {
            	font-size: 11px;
            	color: #aeaeae
            }

            .visit-vcmt .com-cont {
            	padding: 10px 20px 0 0;
            	color: #828282;
            	line-height: 20px
            }
            /* 작성 */
            .vist-vcmt-reg {
            	margin-top: 10px;
            	border-bottom: 1px solid #e5e5e5;
            }

            .vist-vcmt-reg th, .vist-vcmt-reg td, #comment_reply_input th {
            	padding: 6px 0;
            }

            .vist-vcmt-reg th, #comment_reply_input th {
            	font-weight: normal;
            	color: #9d9d9d;
            }

            .vist-vcmt-reg .tb-left, #comment_reply_input .tb-left {
            	padding: 0 3px;
            }

            .vist-vcmt-reg th .tb-left {
            	padding-left: 10px;
            	background:
            		url('/images/d3/modern_simple/common/bull_join_required.gif')
            		no-repeat 0 45%;
            }
            /* 게시판 타입 - 쓰기 */
            .bbs-table-write {
            	margin-top: 10px;
            	border-top: 1px solid #000
            }

            .bbs-table-write tbody th, .bbs-table-write tbody td {
            	padding: 13px 0;
            	text-align: left;
            	border-bottom: 1px solid #e9e9e9
            }

            .bbs-table-write tbody th {
            	padding-left: 30px;
            	font-size: 14px;
            	font-weight: normal;
            	background: #f8f8f8
            }

            .bbs-table-write tbody td {
            	padding: 13px 10px
            }

            .bbs-table-write .privercy-agree label {
            	vertical-align: -2px \0/IE8 +9;
            	*vertical-align: bottom
            }

            .bbs-table-write .privercy-agree label input {
            	vertical-align: top;
            	*vertical-align: top
            }

            /* 게시판 타입 - 비밀번호찾기 */
            .bbs-table-pwd {
            	margin-top: 10px;
            	padding: 60px 0;
            	border-top: 1px solid #e5e5e5;
            	border-bottom: 1px solid #e5e5e5;
            }

            .bbs-table-pwd table {
            	width: 475px;
            	margin: 0 auto
            }

            .bbs-table-pwd tbody th, .bbs-table-pwd tbody td {
            	font-size: 14px;
            	color: #8d8d8d;
            	font-weight: normal
            }

            .bbs-table-pwd tbody td input {
            	padding: 0 0 0 5px;
            	width: 355px;
            	height: 42px;
            	line-height: 42px;
            	border: 1px solid #ddd
            }

            .pwd-link {
            	padding: 40px 0 100px;
            	text-align: center
            }

            .pwd-link a {
            	margin: 0 3px;
            	width: 188px;
            	height: 58px;
            	font-size: 16px;
            	line-height: 58px
            }

            /* 공통으로 쓰는거 */
            textarea {
            	width: 600px;
            	height: 47px;
            	padding: 2px;
            	border: 1px solid #EDEDED;
            }

            .finput {
            	width: 168px;
            	height: 50px;
            	font-size: 16px;
            	line-height: 48px;
            }

            .input-style {
            	padding: 2px;
            	height: 14px;
            	line-height: 14px;
            	border: 1px solid #EDEDED;
            }

            .cont-sub-des {
            	position: relative;
            }

            .cont-sub-des div {
            	padding-top: 5px
            }

            .cont-sub-des span {
            	margin-right: 15px;
            	color: #343434
            }

            .cont-sub-des span em {
            	font-size: 12px;
            	color: #343434;
            	font-weight: bold
            }

            .cont-sub-des span a {

            }

            .comment-list {
            	border-top: 1px solid #000
            }

            .comment-write {
            	border-bottom: 1px solid #e9e9e9
            }

            .bbs-table-view .comment-box td {
            	padding-top: 20px;
            	border-bottom: 1px dashed #e9e9e9;
            	vertical-align: top
            }

            .comment-box .com-name {
            	margin-right: 20px;
            	font-weight: bold;
            	color: #000
            }

            .comment-box .com-date {
            	font-size: 11px;
            	color: #aeaeae
            }

            .comment-box .com-cont {
            	padding: 10px 20px 0 0;
            	color: #828282;
            	line-height: 20px
            }

            .bbs-table-view td.com-wrt-box {
            	border: 0;
            }

            .com-wrt-box label {
            	padding-left: 12px;
            	font-size: 14px;
            	color: #000;
            	background:
            		url('//image.makeshop.co.kr/makeshop/d3/basic_simple/common/bu_4x4.gif')
            		no-repeat 0 50%;
            }

            .com-wrt-box .input-style {
            	margin: 0 10px 0 7px;
            	padding: 0 0 0 5px;
            	width: 212px;
            	height: 27px;
            	line-height: 27px;
            	border: 1px solid #ddd
            }

            .com-wrt-box .wrt {
            	margin-top: 7px
            }

            .com-wrt-box .wrt span {
            	margin: 0 10px;
            	font-size: 14px;
            	color: #828282
            }

            .com-wrt-box .wrt textarea {
            	padding: 1px 0;
            	width: 978px;
            	height: 118px;
            	border: 1px solid #ddd
            }

            .com-wrt-box .wrt_write {
            	padding-bottom: 15px;
            	font-size: 0
            }

            .com-wrt-box .wrt_write .CSSbuttonBlack {
            	width: 118px;
            	height: 120px;
            	font-size: 16px;
            	line-height: 120px
            }

            .view-link {
            	padding: 20px 0;
            	text-align: right
            }

            .view-link a {
            	width: 108px;
            	height: 38px;
            	font-size: 13px;
            	line-height: 38px
            }

            /* 게시판 회원 게시글 검색 */
            .search_id {
            	background: none repeat scroll 0 0 #FFFFFF;
            	border: 1px solid #DADADA;
            	display: block;
            	padding: 3px;
            	position: absolute;
            	width: 90px;
            }

            /* 개인정보보호정책 동의 */
            .new-privercy-contract {
            	text-align: left
            }

            .new-privercy-contract p {
            	font-weight: bold;
            	margin: 0;
            	margin-bottom: 10px;
            	margin-top: 20px;
            	text-align: left;
            }

            .new-privercy-contract .privercy-agree label {
            	vertical-align: -2px \0/IE8 +9;
            	*vertical-align: bottom
            }

            .new-privercy-contract .privercy-agree label input {
            	vertical-align: top;
            	*vertical-align: top
            }

            .privercy-contract-tap {
            	position: relative;
            	height: 40px;
            }

            .privercy-contract-tap ul {
            	list-style: none;
            	margin: 0;
            	padding: 0;
            	position: absolute;
            	bottom: -1px;
            	*bottom: -2px;
            }

            .privercy-contract-tap li {
            	border: 1px solid #ccc;
            	border-right: none;
            	background: #F4F4F4;
            	float: left;
            	display: inline-block;
            }

            .privercy-contract-tap li a {
            	display: block;
            	padding: 10px 10px;
            	text-decoration: none;
            }

            .privercy-contract-tap li.end {
            	border-right: 1px solid #ccc;
            }

            .privercy-contract-tap li.sel {
            	background: #FFFFFF;
            	border-bottom: 1px solid #FFFFFF;
            }

            .privercy-contract {
            	clear: both;
            }

            .privercy-contract textarea {
            	clear: both;
            	border: 1px solid #CCC;
            	height: 60px;
            	background: #FFFFFF;
            	padding: 10px;
            	width: 660px;
            }

            .privercy-agree {
            	margin: 10px 0;
            }

            .privercy-agree label {
            	margin-right: 10px
            }

            /*
                              ========================================================================
                              hot issue common class
                              ========================================================================
                              */

            /* .item-wrap */
            .item-wrap {
            	overflow: hidden;
            	width: 1100px
            }

            .item-wrap .item-hd {
            	margin: 40px 0 20px 0
            }

            .item-wrap .nbg {
            	background: none;
            	text-align: center;
            }

            .item-wrap .item-info {
            	zoom: 1;
            	overflow: hidden;
            	padding: 35px 0 10px;
            	margin-bottom: 10px
            }

            .item-wrap .item-info:after {
            	display: block;
            	clear: both;
            	content: ''
            }

            .item-wrap .item-info .item-total {
            	float: left;
            	font-size: 14px;
            	color: #7b7b7b
            }

            .item-wrap .item-info .item-total span {
            	color: #0e0d0d
            }

            .item-wrap .item-info .item-order {
            	float: right
            }

            .item-wrap .item-info .item-order li {
            	float: left;
            	padding: 0 15px;
            	line-height: 12px;
            	border-right: 1px solid #ddd
            }

            .item-wrap .item-info .item-order li.nobg {
            	padding-right: 0;
            	border-right: none
            }

            .item-wrap .item-info .item-order li a {
            	font-size: 12px;
            	color: #a6a6a6;
            	line-height: 12px;
            	vertical-align: top
            }

            .item-wrap .item-info .item-order li a .on {
            	color: #111
            }

            .item-wrap .item-cont {
            	width: 1122px;
            	*zoom: 1
            }

            .item-wrap .item-cont:after {
            	content: "";
            	display: block;
            	clear: both
            }

            .item-wrap .item-cont .item-list {
            	padding-right: 22px;
            	float: left;
            	width: 352px;
            	text-align: center
            }

            .item-wrap .item-cont .item-list .thumb {
            	width: 352px;
            	height: 352px;
            	overflow: hidden
            }

            .item-wrap .item-cont .item-list .thumb img {
            	width: 352px;
            	height: 352px
            }

            .item-wrap .item-cont .item-list .prd-info {
            	padding: 18px 0 60px;
            	overflow: hidden
            }

            .item-wrap .item-cont .item-list .prd-ico img {
            	margin: 2px
            }

            .item-wrap .item-cont .item-list .prd-name {
            	padding-top: 5px
            }

            .item-wrap .item-cont .item-list .prd-name a {
            	display: block;
            	color: #1c1c1c;
            	line-height: 14px;
            	text-overflow: ellipsis;
            	word-wrap: normal
            }

            .item-wrap .item-cont .item-list .prd-price {
            	padding-top: 5px;
            	font-family: Verdana
            }

            .item-wrap .item-cont .item-list .prd-price strike {
            	color: #707070
            }

            .item-wrap .item-cont .item-list .prd-price .price {
            	color: #1c1c1c
            }

            .item-wrap .item-cont .item-list .prd-color {
            	padding-top: 5px
            }

            .item-wrap .item-cont .item-list .prd-preview {
            	padding-top: 5px
            }

            .item-wrap .item-cont .item-list .prd-preview .btn-preview {
            	display: inline-block;
            	width: 69px;
            	height: 17px;
            	text-indent: -9999em;
            	background:
            		url(//image.makeshop.co.kr/makeshop/d3/basic_simple/common/btn_preview.gif)
            		0 0 no-repeat
            }

            .item-wrap .item-cont .item-list .prd-subname {
            	margin-top: 15px;
            	padding-top: 15px;
            	color: #8b8b8b;
            	text-align: left;
            	border-top: 1px dashed #c6c6c6
            }

            .item-wrap .item-cont .item-list .MK-product-icons img {
            	vertical-align: middle
            }

            .item-wrap .item-cont .nomg {
            	padding-right: 0px
            }

            .item-wrap .item-page {
            	margin-top: 50px;
            	text-align: center;
            }

            .item-wrap .item-page a {
            	padding: 0 5px
            }

            .item-wrap .item-page a:hover, .item-wrap .item-page a.now {
            	color: #111;
            	font-weight: bold;
            	letter-spacing: -1px;
            }

            /* 타이틀 */
            .cateTit {
            	padding-top: 60px;
            	position: relative;
            	text-align: center
            }

            .cateTit h3 {
            	font-size: 20px;
            	color: #1c1c1c;
            	font-weight: bold;
            	font-family: Verdana;
            	line-height: 20px
            }

            .cateTit .line {
            	margin: 20px auto;
            	width: 10px;
            	height: 2px;
            	background: #1c1c1c
            }

            /* 타이틀 - 회원가입 등의 페이지 */
            .cateTit_v2 {
            	*zoom: 1
            }

            .cateTit_v2:after {
            	content: "";
            	display: block;
            	clear: both;
            }

            .cateTit_v2 .right {
            	float: right;
            }

            .cateTit_v2 .title {
            	font-size: 18px;
            	line-height: 1;
            	font-weight: bold;
            	display: inline-block;
            	*float: left;
            	*line-height: 20px
            }

            .cateTit_v2 .subTxt {
            	font-size: 12px;
            	line-height: 1.5;
            }

            .cateTit_v2.join {
            	margin: 88px 0 20px;
            	padding: 14px 0;
            	border-bottom: 1px solid #000;
            	color: #000;
            }

            /* 추가 게시판 상단 메뉴 */
            .board_top_menu {
            	margin-top: 50px;
            }

            .board_top_menu ul {
            	font-size: 0;
            	margin-bottom: 60px;
            	text-align: center;
            }

            .board_top_menu ul li {
            	margin-right: 20px;
            	display: inline-block;
            	vertical-align: top;
            }

            .board_top_menu ul li:last-of-type {
            	margin-right: 0;
            }

            .board_top_menu ul li a {
            	color: #C4C4C4;
            	font-size: 22px;
            	letter-spacing: -0.5px;
            }

            .board_top_menu ul li.on a {
            	color: #3D3D3D;
            }

            #sample4_jibunAddress {
            	width: 25%;
            }
        </style>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ""; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (
                            data.bname !== "" &&
                            /[동|로|가]$/g.test(data.bname)
                        ) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (
                            data.buildingName !== "" &&
                            data.apartment === "Y"
                        ) {
                            extraRoadAddr +=
                                extraRoadAddr !== ""
                                    ? ", " + data.buildingName
                                    : data.buildingName;
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== "") {
                            extraRoadAddr = " (" + extraRoadAddr + ")";
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById("sample4_postcode").value =
                            data.zonecode;
                        document.getElementById("sample4_jibunAddress").value =
                            data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if (roadAddr !== "") {
                            document.getElementById(
                                "sample4_extraAddress"
                            ).value = extraRoadAddr;
                        } else {
                            document.getElementById(
                                "sample4_extraAddress"
                            ).value = "";
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if (data.autoRoadAddress) {
                            var expRoadAddr =
                                data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML =
                                "(예상 도로명 주소 : " + expRoadAddr + ")";
                            guideTextBox.style.display = "block";
                        } else if (data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML =
                                "(예상 지번 주소 : " + expJibunAddr + ")";
                            guideTextBox.style.display = "block";
                        } else {
                            guideTextBox.innerHTML = "";
                            guideTextBox.style.display = "none";
                        }
                    },
                }).open();
            }
        </script>
    </head>
    <body>
        <div id="contentWrapper">
            <div id="contentWrap">
                <div id="content">
                    <dl class="loc-navi">
                        <a href="main.do"><h1>ACENSE</h1></a>
                    </dl>

                    <div id="order">
                        <div class="page-body">
                            <form
                                name="form1"
                                id="order_form"
                                action="order.do"
                                method="post"
                            >
                                <h3>주문자정보</h3>
                                <div class="tbl-order">
                                    <table>
                                        <colgroup>
                                            <col style="width: 130px" />
                                            <col />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <div class="txt-l">
                                                        이름
                                                    </div>
                                                </th>
                                                <td>${memberName}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <h3>배송 정보</h3>
                                <div class="tbl-order">
                                    <table>
                                        <caption>
                                            배송 정보 입력
                                        </caption>
                                        <colgroup>
                                            <col style="width: 130px" />
                                            <col />
                                            <col style="width: 100px" />
                                            <col />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <div class="txt-l">
                                                        <span style="color:red">*</span>이름
                                                    </div>
                                                </th>
                                                <td colspan="3">
                                                    <input
                                                        type="text"
                                                        name="oName"
                                                        form="order_form"
                                                        id="receiver"
                                                        class="MS_input_txt checkValid"
                                                        maxlength="10"
                                                        value=""
                                                        required
                                                    />
                                                </td>
                                            </tr>
                                            <tr
                                                style="
                                                    border-bottom: 1px solid
                                                        #e9e9e9;
                                                "
                                            >
                                                <th scope="row">
                                                    <div class="txt-l">
                                                         <span style="color:red">*</span>연락처
                                                    </div>
                                                </th>
                                                <td>
                                                    <input
                                                    style="height: 23px; line-height: 25px; padding: 0 5px; border: 1px solid #ddd;"
                                                        id="pp"
                                                        class="MS_input_txt checkValid"
                                                        type="tel"
                                                        name="oPhone"
                                                        pattern="[0-9]{3,3}-[0-9]{4,4}-[0-9]{4,4}"
                                                        maxlength="13"
                                                        required
                                                    />
                                                </td>
                                            </tr>

                                            <tr>
                                                <th scope="row">
                                                    <div class="txt-l">
                                                         <span style="color:red">*</span>주소
                                                    </div>
                                                </th>
                                                <td colspan="3">
                                                    <input
                                                        type="text"
                                                        id="sample4_postcode"
                                                        placeholder="우편번호"
                                                        pattern="[0-9]{5,5}"
                                                        maxlength="5"
                                                        readonly
                                                        required
                                                    />
                                                    <input
                                                        type="button"
                                                        onclick="sample4_execDaumPostcode()"
                                                        value="우편번호 찾기"
                                                        style="margin-left: 5px"
                                                    />
                                                    <div class="mt-10">
                                                        <input
                                                            type="text"
                                                            id="sample4_jibunAddress"
                                                            class="checkValid"
                                                            placeholder="지번주소"
                                                            style="pointer-events:none"
                                                            required
                                                            name="ad1"
                                                        />
                                                        <span
                                                            id="guide"
                                                            style="
                                                                color: #999;
                                                                display: none;
                                                            "
                                                        ></span>
                                                        <input
                                                            type="text"
                                                            id="sample4_extraAddress"
                                                            placeholder="참고항목"
                                                            style="pointer-events:none"
                                                        />
                                                        <input
                                                            type="text"
                                                            id="sample4_detailAddress"
                                                            class="checkValid"
                                                            placeholder="상세주소"
                                                            name="ad2"
                                                            required
                                                        />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <div class="txt-l">
                                                        주문메세지<br />
                                                        <span>(100자내외)</span>
                                                    </div>
                                                </th>
                                                <td colspan="3">
                                                    <textarea
                                                    	maxlength="100"
                                                        name="oMsg"
                                                        form="order_form"
                                                        id="message"
                                                        cols="50"
                                                        rows="5"
                                                        class="MS_textarea"
                                                    ></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- .tbl-order -->

                                <h3>
                                    <img
                                        src="/images/common/ico_shop.gif"
                                        alt=""
                                        style="margin: -3px 0 0"
                                    />
                                    상품 정보
                                </h3>

                                <div class="tbl-order">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th
                                                    colspan="2"
                                                    style="
                                                        background-color: #ececec;
                                                    "
                                                >
                                                    상품
                                                </th>
                                                <th
                                                    style="
                                                        background-color: #ececec;
                                                    "
                                                >
                                                    수량
                                                </th>
                                                <th
                                                    style="
                                                        background-color: #ececec;
                                                    "
                                                >
                                                    상품금액
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach
                                                var="v"
                                                items="${buyList}"
                                                begin="0"
                                                end="${buyList.size()}"
                                                varStatus="status"
                                            >
                                            <input class="pNum" type="hidden" name="buyPk" value="${v.pNum}"/>
                                            <input type="hidden" name="buyCnt" value="${v.cartCnt}"/>
                                                <tr
                                                    class="nbg"
                                                    style="
                                                        border-bottom: 1px solid
                                                            #ccc;
                                                    "
                                                >
                                                    <td>
                                                        <div class="tb-center">
                                                            <div class="thumb">
                                                                <img
                                                                    src="${v.pImg}"
                                                                    alt="${v.pName}"
                                                                    width="70"
                                                                />
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="tb-left">
                                                            <a href=""
                                                                ><strong
                                                                    >${v.pName}</strong
                                                                >
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div
                                                            class="tb-center pCnt"
                                                        >
                                                            ${v.cartCnt}개
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div
                                                            class="tb-center tb-bold pPrice"
                                                        >
                                                            ${v.pPrice}원
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr
                                                style="
                                                    background-color: #f7f7f7;
                                                "
                                            >
                                                <!-- 
                                 <th scope="row"><div class="txt-l" style="text-align:center;">결제방법</div></th>
                                  -->
                                                <td colspan="4">
                                                    <ul
                                                        class="pay-method"
                                                        style="
                                                            display: flex;
                                                            justify-content: space-evenly;
                                                        "
                                                    >
                                                        <li>
                                                            <input
                                                                type="radio"
                                                                class="chk-rdo"
                                                                name="radio_paymethod"
                                                                value="trans"
                                                                checked="checked"
                                                            />
                                                            실시간계좌이체
                                                        </li>
                                                        <li>
                                                            <input
                                                                type="radio"
                                                                class="chk-rdo"
                                                                name="radio_paymethod"
                                                                value="card"
                                                            />
                                                            신용카드
                                                        </li>
                                                        <li>
                                                            <input
                                                                type="radio"
                                                                class="chk-rdo"
                                                                name="radio_paymethod"
                                                                
                                                                value="phone"
                                                            />
                                                            휴대폰소액결제
                                                        </li>
                                                        <li>
                                                            <input
                                                                type="radio"
                                                                class="chk-rdo"
                                                                name="radio_paymethod"
                                                                value="vbank"
                                                            />
                                                            가상계좌
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>

                                <h3>총 금액</h3>
                                <div class="tbl-pay">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>결제 예정금액</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="base">
                                                        <a class="equal"></a>
                                                        <strong
                                                            ><em class="fc-red"
                                                                ><span
                                                                    class="block-op-sum-price"
                                                                    id="totalPrice"
                                                                ></span></em
                                                            >원</strong
                                                        >
                                                    </div>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>

                                <div id="paybutton" style="margin-bottom: 40px">
                                    <a
                                        href="javascript:send();"
                                        class="CSSbuttonBlack finput"
                                        >주문하기</a
                                    >
                                    <a href="main.do" class="CSSbuttonWhite"
                                        >주문취소</a
                                    >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div style="display:none;">
        </div>
        
                <!-- jQuery -->
        <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
        ></script>
        <!-- iamport.payment.js -->
        <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
        ></script>
        
        <script>
            const orderForm = document.getElementById("order_form");
            const pCnt = document.getElementsByClassName("pCnt");
            const pPrice = document.getElementsByClassName("pPrice");
            const totalPrice = document.getElementById("totalPrice");
            const $inputPhone = document.getElementById("pp");
            const $body = document.getElementById("contentWrapper");
            
            const pNum = document.getElementsByClassName("pNum");

            
            
            let sum = 0;

            for (let i = 0; i < pCnt.length; i++) {
                let a = parseInt(pCnt[i].innerText);
                let b = parseInt(pPrice[i].innerText);
                sum += a * b;
            }

            totalPrice.innerText = sum;

            $inputPhone.addEventListener("input", function (event) {
                this.value = this.value.replace(/[^0-9]/g, ""); // 숫자를 제외한 모든 문자 제거
                this.value = this.value.replace(
                    /^(\d{2,3})(\d{3,4})(\d{4})$/,
                    `$1-$2-$3`
                );
            });
            function send() {
            	orderForm.submit();
            	const checkQuery = $(".checkValid:valid");
            	if(checkQuery.length == 4){
            		//에이젝스
				   $.ajax({
				      url : 'Ocheck',
				      type : 'post',
				      success : function(result){
			              payment(result);
				      },
				      error : function(){
				         alert("서버요청실패");
				      }
				   })
            	}
            	else{
            		alert("정보 입력 후 진행해주세요")	
            	}
            }


            //버튼 클릭하면 실행
            function payment(result) {
            	try{
                pay = $(".chk-rdo:checked").val();
                const id = "ACENSE_SIXSENSE0202"+result;
                IMP.init("imp67153164"); //아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
                IMP.request_pay(
                    {
                        pg: "html5_inicis", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
                        pay_method: pay, //지불 방법
                        merchant_uid: id, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
                        name: "ACENSE", //결제창에 노출될 상품명
                        amount: parseInt(totalPrice.innerText), //금액
                        //amount:100
                    },
                    function (rsp) {
                        // callback
                        if (rsp.success) {
                        	let pdatas=[];
                            for(let i = 0; i < pNum.length; i++ ){
                            	pdatas.push(pNum[i].value);
                            }
                            let cart = [];
                            if(localStorage.getItem("cart") != null){
                               cart = JSON.parse(localStorage.getItem("cart"));
                            }
                            cart = cart.filter(value => !pdatas.includes(value[0]));
                            localStorage.setItem("cart", JSON.stringify(cart));
                        	orderForm.submit();
                        } else {
                            alert("결제실패");
                        }
                    }
                );
            	}catch(error){
            		console.log(error);
            	}
            }
        </script>
        
    </body>
</html>
