part of "./widget.dart";

class ButtonSheetWidget extends GetxController {
  void viewButtonSheet(String pesan1, Widget content, String type, String acc,
      bool? isDismissible, Function() onTap) {
    showModalBottomSheet(
      context: Get.context!,
      isDismissible: isDismissible ?? false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return Container(
          height: Get.height - 80,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Utility.medium,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 90,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pesan1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 10,
                            child: InkWell(
                              onTap: () => Navigator.pop(Get.context!),
                              child: const Icon(
                                Iconsax.close_circle,
                                color: Colors.red,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: Utility.small,
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Expanded(
                flex: type != "hidden" ? 80 : 90,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: content,
                ),
              ),
              if (type != "hidden")
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(Utility.normal),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Button1(
                              contentButton: Center(
                                child: TextLabel(
                                  text: acc,
                                  color: Utility.baseColor1,
                                ),
                              ),
                              colorBtn: Utility.maincolor1,
                              onTap: () {
                                onTap();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Button1(
                              contentButton: Center(
                                child: TextLabel(
                                  text: "Cancel",
                                  color: Utility.baseColor1,
                                ),
                              ),
                              colorBtn: Colors.red,
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void validasiButtomSheet(
      String pesan1, Widget content, String acc, Function() onTap,
      {bool isDismissible = false}) {
    showModalBottomSheet(
      context: Get.context!,
      isDismissible: isDismissible,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
                left: Utility.medium,
                right: Utility.medium,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: Utility.medium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 90,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pesan1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: InkWell(
                            onTap: () => Navigator.pop(Get.context!),
                            child: const Icon(
                              Iconsax.close_circle,
                              color: Colors.red,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Utility.small,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: content,
                  ),
                  SizedBox(
                    height: Utility.medium,
                  ),
                  acc == "hidden"
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.all(Utility.normal),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Button1(
                                    contentButton: Center(
                                      child: TextLabel(
                                        text: acc,
                                        color: Utility.baseColor1,
                                      ),
                                    ),
                                    colorBtn: Utility.maincolor1,
                                    onTap: () {
                                      Get.back();
                                      onTap();
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Button1(
                                    contentButton: Center(
                                      child: TextLabel(
                                        text: acc == "Lanjutkan"
                                            ? "Batal"
                                            : "Cancel",
                                        color: Utility.baseColor1,
                                      ),
                                    ),
                                    colorBtn: Colors.red,
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
