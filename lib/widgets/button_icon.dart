part of "./widget.dart";

class ButtonIcon extends StatelessWidget {
  final String? textBtn;
  final dynamic colorBtn;
  final dynamic colorText;
  final int? style;
  final Function()? onTap;

  const ButtonIcon({
    Key? key,
    this.textBtn,
    this.colorBtn,
    this.colorText,
    this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorBtn ?? Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ))),
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const Icon(Icons.add),
              Text(
                "$textBtn",
                style: TextStyle(
                  color: style == 1 ? colorText : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "InterBold",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
