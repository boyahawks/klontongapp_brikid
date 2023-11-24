part of "./widget.dart";

class TextGroupColumn extends StatelessWidget {
  // TITLE
  final String? title;
  final bool? titleBold;
  final double? sizeTitle;
  final dynamic colorTitle;
  // SUBTITLE
  final String? subtitle;
  final bool? subtitleBold;
  final double? sizeSubtitle;
  final dynamic colorSubtitle;

  const TextGroupColumn({
    Key? key,
    this.title,
    this.sizeTitle,
    this.titleBold,
    this.colorTitle,
    this.subtitle,
    this.subtitleBold,
    this.sizeSubtitle,
    this.colorSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextLabel(
          text: title ?? "",
          weigh: titleBold == true ? FontWeight.bold : FontWeight.w400,
          size: sizeTitle ?? 14.0,
          color: colorTitle ?? Colors.black,
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextLabel(
            text: subtitle ?? "",
            weigh: subtitleBold == true ? FontWeight.bold : FontWeight.w500,
            color: colorSubtitle ?? Colors.black,
            size: sizeSubtitle ?? 13.0,
          ),
        )
      ],
    );
  }
}
