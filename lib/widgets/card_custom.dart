part of "./widget.dart";

class CardCustomForm extends StatelessWidget {
  final Widget? widgetCardForm;
  final dynamic colorBg;
  final double? tinggiCard;
  final BorderRadius? radiusBorder;

  const CardCustomForm({
    Key? key,
    this.widgetCardForm,
    this.colorBg,
    this.tinggiCard,
    this.radiusBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: tinggiCard,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: colorBg,
            borderRadius: radiusBorder,
            border: Border.all(width: 0.5, color: Utility.borderContainer)),
        child: widgetCardForm);
  }
}

class CardCustomShadow extends StatelessWidget {
  final Widget? widgetCardCustom;
  final dynamic colorBg;
  final BorderRadius? radiusBorder;

  const CardCustomShadow({
    Key? key,
    this.widgetCardCustom,
    this.colorBg,
    this.radiusBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: colorBg,
          borderRadius: radiusBorder,
          boxShadow: [
            BoxShadow(
              color: Utility.borderContainer.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: widgetCardCustom);
  }
}

class CardCustom extends StatelessWidget {
  final Widget? widgetCardCustom;
  final dynamic colorBg;
  final dynamic colorBorder;
  final BorderRadius? radiusBorder;
  final VoidCallback? onTap;
  const CardCustom({
    Key? key,
    this.widgetCardCustom,
    this.colorBg,
    this.colorBorder,
    this.radiusBorder,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: radiusBorder,
      color: colorBg,
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: radiusBorder,
                border: Border.all(
                    width: 1.0,
                    color: colorBorder == null
                        ? Utility.borderContainer
                        : colorBorder!)),
            child: widgetCardCustom),
      ),
    );
  }
}
