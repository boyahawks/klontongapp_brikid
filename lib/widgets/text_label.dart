part of "./widget.dart";

class TextLabel extends StatelessWidget {
  final String text;
  final double? size;
  final dynamic color;
  final FontWeight? weigh;
  final String? family;
  final TextAlign? align;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? height;

  const TextLabel(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.weigh,
      this.family,
      this.decoration,
      this.align,
      this.letterSpacing,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        decoration: decoration ?? TextDecoration.none,
        color: color ?? Colors.black,
        fontSize: size ?? 14,
        fontWeight: weigh ?? FontWeight.w500,
        fontFamily: family ?? "InterRegular",
        height: height ?? 1.2,
        letterSpacing: letterSpacing ?? 0.5,
      ),
    );
  }
}
