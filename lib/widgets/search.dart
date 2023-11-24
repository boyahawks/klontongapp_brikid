part of "./widget.dart";

class SearchApp extends StatelessWidget {
  final bool? isFilter;
  final bool? onChange;
  final String? title;
  final TextEditingController? controller;
  final Function? onTap;
  final Function? onTapFilter;

  const SearchApp({
    Key? key,
    required this.isFilter,
    required this.onChange,
    required this.controller,
    this.onTap,
    this.title,
    this.onTapFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: isFilter! == false ? 100 : 80,
          child: Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: CardCustom(
              colorBg: Utility.baseColor1,
              radiusBorder: Utility.borderStyle1,
              widgetCardCustom: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 15,
                    child: Padding(
                      padding: EdgeInsets.only(top: 7, left: 10),
                      child: Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Icon(
                          Iconsax.search_normal_1,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 85,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            onChange == false
                                ? Expanded(
                                    flex: 80,
                                    child: TextField(
                                      controller: controller,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: title ?? "Search"),
                                      textInputAction: TextInputAction.done,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          height: 1.5,
                                          color: Colors.black),
                                      onSubmitted: (value) {
                                        if (onTap != null) onTap!(value);
                                      },
                                    ),
                                  )
                                : Expanded(
                                    flex: 80,
                                    child: TextField(
                                      controller: controller,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: title ?? "Search"),
                                      textInputAction: TextInputAction.done,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          height: 1.5,
                                          color: Colors.black),
                                      onChanged: (value) {
                                        if (onTap != null) onTap!(value);
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        isFilter! == false
            ? const SizedBox(
                width: 10,
              )
            : const SizedBox(),
        isFilter! == true
            ? Expanded(
                flex: 20,
                child: InkWell(
                  onTap: () {
                    if (onTapFilter != null) onTapFilter!();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 3.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 211, 205, 205)),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Iconsax.setting_4)),
                  ),
                ))
            : const SizedBox()
      ],
    );
  }
}
