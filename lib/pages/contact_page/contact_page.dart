import 'package:flutter/material.dart';
import '../../utils/layout/responsive_layout.dart';
import '../../utils/values/values.dart';
import '../../utils/widgets/animated_widgets/animated_positioned_text.dart';
import '../../utils/widgets/animated_widgets/animated_text_slide_box_transition.dart';
import '../../utils/widgets/content_area.dart';
import '../../utils/widgets/custom_spacer.dart';
import '../../utils/widgets/page_wrapper.dart';
import '../../utils/widgets/simple_footer.dart';
import '../../utils/widgets/spaces.dart';

class ContactPage extends StatefulWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;


  bool isBodyVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 1.0, curve: Curves.ease),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.6),
    ); //takes 60% of screen

    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.25),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.25),
        assignHeight(context, 0.3),
      ),
    );
    TextStyle? headingStyle = textTheme.displayMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(context, 40, 60),
    );
    return  PageWrapper(
            selectedRoute: ContactPage.contactPageRoute,
            selectedPageName: StringConst.CONTACT,
            navBarAnimationController: _controller,
            onLoadingAnimationDone: () {
              _controller.forward();
            },
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Padding(
                  padding: padding,
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _controller,
                          text: StringConst.GET_IN_TOUCH,
                          textStyle: headingStyle,
                        ),
                        const CustomSpacer(heightFactor: 0.05),
                        AnimatedPositionedText(
                          width: contentAreaWidth,
                          controller: CurvedAnimation(
                            parent: _controller,
                            curve:
                            const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                          ),
                          text: StringConst.CONTACT_MSG,
                          maxLines: 5,
                          textStyle: textTheme.bodyLarge?.copyWith(
                            color: AppColors.grey700,
                            height: 2.0,
                            fontSize: responsiveSize(
                              context,
                              Sizes.TEXT_SIZE_16,
                              Sizes.TEXT_SIZE_18,
                            ),
                          ),
                        ),
                        const CustomSpacer(heightFactor: 0.05),
                        SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedTextSlideBoxTransition(
                                controller: _controller,
                                text: StringConst.HERES_MY_EMAIL,
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: responsiveSize(
                                    context,
                                    Sizes.TEXT_SIZE_20,
                                    Sizes.TEXT_SIZE_22,
                                    sm: Sizes.TEXT_SIZE_18,
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              AnimatedPositionedText(
                                width: contentAreaWidth,
                                controller: CurvedAnimation(
                                  parent: _controller,
                                  curve:
                                  const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                                ),
                                text: StringConst.DEV_EMAIL,
                                maxLines: 5,
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.grey700,
                                  height: 2.0,
                                  fontSize: responsiveSize(
                                    context,
                                    Sizes.TEXT_SIZE_16,
                                    Sizes.TEXT_SIZE_18,
                                  ),
                                ),
                              ),
                              SpaceH20(),
                              AnimatedTextSlideBoxTransition(
                                controller: _controller,
                                text: StringConst.HERES_MY_WHATSAPP,
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: responsiveSize(
                                    context,
                                    Sizes.TEXT_SIZE_20,
                                    Sizes.TEXT_SIZE_22,
                                    sm: Sizes.TEXT_SIZE_18,
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              AnimatedPositionedText(
                                width: contentAreaWidth,
                                controller: CurvedAnimation(
                                  parent: _controller,
                                  curve:
                                  const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                                ),
                                text: StringConst.DEV_PHONE,
                                maxLines: 5,
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.grey700,
                                  height: 2.0,
                                  fontSize: responsiveSize(
                                    context,
                                    Sizes.TEXT_SIZE_16,
                                    Sizes.TEXT_SIZE_18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const CustomSpacer(heightFactor: 0.15),
                const SimpleFooter(),
              ],
            ),
          );
        }
  }

