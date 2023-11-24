import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_brikId/helper/utility.dart';
import 'package:test_brikId/widgets/widget.dart';

class ShimmerWidget {
  static shimmerOnProduct(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade300,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Utility.extraLarge,
              ),
              ExpandedView2Row(
                  flexLeft: 80,
                  flexRight: 20,
                  widgetLeft: ExpandedView2Row(
                      flexLeft: 80,
                      flexRight: 20,
                      widgetLeft: Container(
                        padding: EdgeInsets.only(left: Utility.small),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Card(child: ListTile(title: Text(''))),
                      ),
                      widgetRight: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Card(child: ListTile(title: Text(''))),
                      )),
                  widgetRight: Container(
                    padding: EdgeInsets.only(right: Utility.small),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Card(child: ListTile(title: Text(''))),
                  )),
              SizedBox(
                height: Utility.medium,
              ),
              ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: Utility.small, right: Utility.small),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: const Card(child: ListTile(title: Text(''))),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
