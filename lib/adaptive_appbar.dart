library adaptive_appbar;

import 'package:flutter/material.dart';

//ignore: must_be_immutable
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget{

  final BuildContext context;
  final String title;
  final String responsiveBackButtonTitle;
  final Function()? onBackPressed;
  Color? backgroundColor;
  Color foregroundColor;

  AdaptiveAppBar(
      this.context,
      {super.key,
        required this.title,
        this.responsiveBackButtonTitle = "Cancel",
        required this.onBackPressed,
        this.backgroundColor,
        this.foregroundColor = Colors.black,
      });

  static double _scale = 1;
  static const double _fixedHeight = 60;

  @override
  Size get preferredSize => Size.fromHeight(AdaptiveAppBar._fixedHeight*getScale(context));

  double getScale(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Get Adaptive
    if(isDesktop(screenWidth, screenHeight)){
      return _scale = 1.4;

    } else {
      return _scale = 1;
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {

    if(backgroundColor == null) {
      backgroundColor= Theme.of(context).colorScheme.primaryContainer;
      foregroundColor= Theme.of(context).colorScheme.onSecondaryContainer;
    }

    return getWidget(context);
  }

  //Decide adaptive layout
  bool isDesktop(double screenWidth, double screenHeight){
    return (screenWidth > 600 && screenHeight > 400);
  }

  Widget getWidget(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Get Adaptive
    if(isDesktop(screenWidth, screenHeight)){
      return desktopAppBar(context);
    } else {
      return mobileAppBar(context);
    }
  }

  ///Layouts
  //Get Mobile layout
  Widget mobileAppBar(BuildContext context){
    return customAppBar(
      context,
      leadingWidget: mobileLeadingWidget(),
    );
  }

  //Get Desktop Layout
  Widget desktopAppBar(BuildContext context){
    return customAppBar(
      context,
      leadingWidget: desktopLeadingWidget(),
    );
  }

  ///Widgets
  //desktop leading widget
  Widget desktopLeadingWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),

      decoration:
      BoxDecoration(
          border: Border.all(width: 1, color: foregroundColor,),
          borderRadius: const BorderRadius.all(Radius.circular(14))
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close_rounded, color: foregroundColor,),

          const SizedBox(width: 10,),

          Text(responsiveBackButtonTitle,
            style: TextStyle(fontSize: 14, color: foregroundColor),)
        ],),
    );
  }

  //mobile leading widget
  Widget mobileLeadingWidget() => Icon(Icons.close_rounded, color: foregroundColor, size: 26,);

  ///View
  //Your app bar widget
  Widget customAppBar(BuildContext context, {required Widget leadingWidget,}){

    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      toolbarHeight: AdaptiveAppBar._fixedHeight*AdaptiveAppBar._scale,
      scrolledUnderElevation: 0, //do not change color on scroll

      flexibleSpace: SafeArea(
        child: SizedBox(
          height: AdaptiveAppBar._fixedHeight*AdaptiveAppBar._scale,

          child: Row(
            children: [
              //back button
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 24),
                child: InkWell(
                    onTap: onBackPressed ?? ()=> Navigator.pop(context),
                    child: leadingWidget),
              ),

              //Title
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18*AdaptiveAppBar._scale,
                    color: foregroundColor
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}