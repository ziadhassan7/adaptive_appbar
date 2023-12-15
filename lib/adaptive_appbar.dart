import 'package:flutter/material.dart';

//ignore: must_be_immutable
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  /// AppBar's title
  final String title;

  /// Title for back button (Shows only on big screens)
  final String backButtonTitle;

  /// Handle on back button press
  final Function()? onBackPressed;

  /// Custom background color
  Color? backgroundColor;

  /// Custom foreground color
  Color foregroundColor;

  /// Custom elevation
  double elevation;

  /// Custom widget at the end of the AppBar
  Widget? widget;

  AdaptiveAppBar(
    this.context, {
    super.key,
    required this.title,
    this.backButtonTitle = "Cancel",
    required this.onBackPressed,
    this.backgroundColor,
    this.foregroundColor = Colors.black,
    this.elevation = 0,
    this.widget,
  });

  static double _scale = 1;
  static const double _fixedHeight = 60;

  @override
  Size get preferredSize =>
      Size.fromHeight(AdaptiveAppBar._fixedHeight * getScale(context));

  bool isDesktop() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return (screenWidth > 600 && screenHeight > 400);
  }

  double getScale(BuildContext context) {
    // Set Scale
    if (isDesktop()) {
      return _scale = 1.4;
    } else {
      return _scale = 1;
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // Set AppBar default colors
    if (backgroundColor == null) {
      backgroundColor = Theme.of(context).colorScheme.primaryContainer;
      foregroundColor = Theme.of(context).colorScheme.onSecondaryContainer;
    }

    // Get Custom AppBar
    return getWidget();
  }

  Widget getWidget() {
    if (isDesktop()) {
      return _customAppBar(_desktopLeadingWidget());
    } else {
      return _customAppBar(_mobileLeadingWidget());
    }
  }

  ///Custom AppBar
  Widget _customAppBar(Widget leadingWidget) {
    return Material(
      elevation: elevation,
      child: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: AdaptiveAppBar._fixedHeight * AdaptiveAppBar._scale,
        scrolledUnderElevation: 0, //do not change color on scroll

        flexibleSpace: SafeArea(
          child: SizedBox(
            height: AdaptiveAppBar._fixedHeight * AdaptiveAppBar._scale,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  InkWell(
                      onTap: onBackPressed ?? () => Navigator.pop(context),
                      child: leadingWidget),

                  // Title
                  Expanded(child: getTitle()),

                  // Custom widget
                  widget ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// AppBar Title
  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18 * _scale,
            color: foregroundColor),
      ),
    );
  }

  /// Back/Cancel Button
  //desktop leading widget
  Widget _desktopLeadingWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: foregroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.close_rounded,
            color: foregroundColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            backButtonTitle,
            style: TextStyle(fontSize: 14, color: foregroundColor),
          )
        ],
      ),
    );
  }

  //mobile leading widget
  Widget _mobileLeadingWidget() => Icon(
        Icons.close_rounded,
        color: foregroundColor,
        size: 26,
      );
}
