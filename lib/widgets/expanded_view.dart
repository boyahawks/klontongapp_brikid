part of "./widget.dart";

class ExpandedView2Row extends StatelessWidget {
  // TITLE
  final int? flexLeft;
  final int? flexRight;
  final Widget? widgetLeft;
  final Widget? widgetRight;

  const ExpandedView2Row({
    Key? key,
    required this.flexLeft,
    required this.flexRight,
    required this.widgetLeft,
    required this.widgetRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: flexLeft!,
            child: widgetLeft!,
          ),
          Expanded(
            flex: flexRight!,
            child: widgetRight!,
          )
        ],
      ),
    );
  }
}

class ExpandedView3Row extends StatelessWidget {
  // TITLE
  final int? flex1;
  final int? flex2;
  final int? flex3;
  final Widget? widget1;
  final Widget? widget2;
  final Widget? widget3;

  const ExpandedView3Row({
    Key? key,
    required this.flex1,
    required this.flex2,
    required this.flex3,
    required this.widget1,
    required this.widget2,
    required this.widget3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: flex1!,
            child: widget1!,
          ),
          Expanded(
            flex: flex2!,
            child: widget2!,
          ),
          Expanded(
            flex: flex3!,
            child: widget3!,
          ),
        ],
      ),
    );
  }
}
