import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_brikId/helper/api.dart';
import 'package:test_brikId/helper/appdata.dart';
import 'package:test_brikId/helper/constant.dart';
import 'package:test_brikId/helper/routes.dart';
import 'package:test_brikId/helper/shimmer.dart';
import 'package:test_brikId/helper/toast.dart';
import 'package:test_brikId/helper/utility.dart';
import 'package:test_brikId/modules/produk/model_produk.dart';
import 'package:test_brikId/widgets/widget.dart';

part 'view_produk.dart';
part 'view_add_product.dart';
part 'controller_produk.dart';
part 'service_produk.dart';
