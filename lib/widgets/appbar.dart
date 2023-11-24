part of "./widget.dart";

class AppbarMenu1 extends StatelessWidget {
  final String? title;
  final int? icon;
  final Color? colorTitle;
  final Color? colorIcon;
  final Icon? rightIcon;
  final Color? colorBackground;
  final bool? iconShow;
  final Function()? onTap;
  final Function()? onTap2;
  const AppbarMenu1({
    Key? key,
    this.title,
    this.icon,
    this.colorTitle,
    this.colorIcon,
    this.rightIcon,
    this.colorBackground,
    this.iconShow,
    this.onTap,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: colorBackground ?? Colors.white,
        child: icon == 1
            ? style1()
            : icon == 2
                ? style2()
                : icon == 3
                    ? style3()
                    : const SizedBox());
  }

  Widget style1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 10,
            child: Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 5),
                child: iconShow == false
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          if (onTap != null) onTap!();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: colorIcon ?? Colors.black,
                        ),
                      ),
              ),
            )),
        Expanded(
            flex: 80,
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  child: TextLabel(
                    text: title!,
                    weigh: FontWeight.bold,
                    size: 22.0,
                    color: colorTitle,
                    family: "InterBold",
                  )),
            )),
        const Expanded(flex: 10, child: SizedBox())
      ],
    );
  }

  Widget style2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 10, child: SizedBox()),
        Expanded(
            flex: 80,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(bottom: 15, left: 15),
              child: Text(
                title!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorTitle),
              ),
            )),
        Expanded(
            flex: 10,
            child: Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 5),
                child: iconShow == false
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          if (onTap != null) onTap!();
                        },
                        icon: Icon(
                          Iconsax.search_normal_1,
                          color: colorTitle,
                        ),
                      ),
              ),
            )),
      ],
    );
  }

  Widget style3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 10,
            child: Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 5),
                child: IconButton(
                  onPressed: () {
                    if (onTap != null) onTap!();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: colorTitle,
                  ),
                ),
              ),
            )),
        Expanded(
            flex: 80,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 15, left: 15),
              child: Text(
                title!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorTitle),
              ),
            )),
        Expanded(
            flex: 10,
            child: Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 5),
                child: IconButton(
                    onPressed: () {
                      if (onTap2 != null) onTap2!();
                    },
                    icon: rightIcon!),
              ),
            )),
      ],
    );
  }
}
