part of "./widget.dart";

class Button1 extends StatelessWidget {
  final Color? colorBtn;
  final Color? colorSideborder;
  final double? radius;
  final Widget? contentButton;
  final Function()? onTap;

  const Button1({
    Key? key,
    required this.colorBtn,
    this.colorSideborder,
    this.radius,
    required this.contentButton,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorBtn ?? Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.0),
            side: BorderSide(color: colorSideborder ?? Colors.transparent),
          ))),
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Center(
        child: Padding(padding: const EdgeInsets.all(6.0), child: contentButton!
            // Text(
            //   "$textBtn",
            //   style: TextStyle(
            //     color: colorText ?? Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: "InterBold",
            //   ),
            // ),
            ),
      ),
    );
  }
}
