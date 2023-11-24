part of "./widget.dart";

class MainScaffold extends StatelessWidget {
  final Color? colorSafeArea;
  final Color? colorBackground;
  final Color? appbarColorBackground;
  final Color? appbarColorTitle;
  final Color? appbarColorIcon;
  final bool? returnOnWillpop;
  final bool? showIconLeft;
  final String? type;
  final String? appbarTitle;
  final int? styleAppbar;
  final Widget? content;
  final Widget? contentBottom;
  final Icon? iconRight;
  final Function()? backFunction;
  final Function()? ontapAppbar;
  final Function()? ontapAppbar2;
  final Widget? floatingActionButton;

  const MainScaffold({
    Key? key,
    required this.type,
    required this.content,
    this.colorSafeArea,
    this.colorBackground,
    this.appbarColorBackground,
    this.appbarColorTitle,
    this.appbarColorIcon,
    this.returnOnWillpop,
    this.showIconLeft,
    this.backFunction,
    this.styleAppbar,
    this.appbarTitle,
    this.iconRight,
    this.ontapAppbar,
    this.ontapAppbar2,
    this.contentBottom,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "default"
        ? Container(
            color: colorSafeArea ?? Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: colorBackground ?? Colors.white,
                body: WillPopScope(
                  onWillPop: () async {
                    if (backFunction != null) backFunction!();
                    return returnOnWillpop ?? false;
                  },
                  child: content!,
                ),
                floatingActionButton: floatingActionButton,
              ),
            ),
          )
        : type == "appbar"
            ? Container(
                color: colorSafeArea ?? Colors.white,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: colorBackground ?? Colors.white,
                    appBar: AppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        elevation: 2,
                        flexibleSpace: AppbarMenu1(
                          title: appbarTitle ?? "",
                          icon: styleAppbar ?? 1,
                          iconShow: showIconLeft ?? true,
                          colorBackground:
                              appbarColorBackground ?? Utility.baseColor1,
                          colorTitle: appbarColorTitle ?? Utility.baseColor2,
                          colorIcon: appbarColorIcon ?? Utility.baseColor2,
                          rightIcon: iconRight ??
                              Icon(
                                Icons.save,
                                color: appbarColorIcon ?? Utility.baseColor2,
                              ),
                          onTap: () {
                            if (ontapAppbar != null) ontapAppbar!();
                          },
                          onTap2: () {
                            if (ontapAppbar2 != null) ontapAppbar2!();
                          },
                        )),
                    body: WillPopScope(
                      onWillPop: () async {
                        if (backFunction != null) backFunction!();
                        return returnOnWillpop ?? false;
                      },
                      child: content!,
                    ),
                    floatingActionButton: floatingActionButton,
                  ),
                ),
              )
            : type == "appbar_with_bottom"
                ? Container(
                    color: colorSafeArea ?? Colors.white,
                    child: SafeArea(
                      child: Scaffold(
                        backgroundColor: colorBackground ?? Colors.white,
                        appBar: AppBar(
                            backgroundColor: Colors.white,
                            automaticallyImplyLeading: false,
                            elevation: 2,
                            flexibleSpace: AppbarMenu1(
                              title: appbarTitle ?? "",
                              icon: 1,
                              colorTitle: Colors.black,
                              onTap: () {
                                if (ontapAppbar != null) ontapAppbar!();
                              },
                            )),
                        body: WillPopScope(
                          onWillPop: () async {
                            if (backFunction != null) backFunction!();
                            return returnOnWillpop ?? false;
                          },
                          child: content!,
                        ),
                        bottomNavigationBar: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 12),
                          child: SizedBox(height: 50, child: contentBottom),
                        ),
                        floatingActionButton: floatingActionButton,
                      ),
                    ),
                  )
                : const SizedBox();
  }
}
