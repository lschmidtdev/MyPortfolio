import 'package:flutter/material.dart';

import '../../utils/functions.dart';
import '../../utils/layout/responsive_layout.dart';
import '../../utils/values/values.dart';
import '../../utils/widgets/about_page_widgets/about_page_header.dart';
import '../../utils/widgets/about_page_widgets/technology_section.dart';
import '../../utils/widgets/animated_widgets/animated_footer.dart';
import '../../utils/widgets/animated_widgets/animated_line_through_text.dart';
import '../../utils/widgets/animated_widgets/animated_positioned_text.dart';
import '../../utils/widgets/animated_widgets/animated_text_slide_box_transition.dart';
import '../../utils/widgets/content_area.dart';
import '../../utils/widgets/content_builder.dart';
import '../../utils/widgets/custom_spacer.dart';
import '../../utils/widgets/page_wrapper.dart';
import '../../utils/widgets/socials.dart';
import '../../utils/widgets/spaces.dart';
import 'package:visibility_detector/visibility_detector.dart'; 

const double visiblePercentageThreshold = 50.0;

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {

  late List<AnimationController> _controllers;


  

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => AnimationController(
      duration: const Duration(milliseconds: Animations.animationDuration1200),
      vsync: this,
    ));
  }

  /* 
  _controllers[0] page controller;
  _controllers[1] story controller;
  _controllers[2] technology controller;
  _controllers[3] contact controller;
  _controllers[4] technology list controller;
  _controllers[5] quote controller;
  */

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyText2Style =
    textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    CurvedAnimation storySectionAnimation = CurvedAnimation(
      parent: _controllers[1],
      curve: const Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation technologySectionAnimation = CurvedAnimation(
      parent: _controllers[2],
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT,
      navBarAnimationController: _controllers[0],
      onLoadingAnimationDone: () {
        _controllers[0].forward();
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
                children: [
                  AboutPageHeader(
                    width: contentAreaWidth,
                    controller: _controllers[0],
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('story-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 40, 70, md: visiblePercentageThreshold)) {
                        _controllers[1].forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _controllers[1],
                      number: "/01 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                      title: StringConst.ABOUT_DEV_STORY_TITLE,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            // factor: 1.25,
                            text: StringConst.ABOUT_DEV_STORY_CONTENT_1,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.ABOUT_DEV_STORY_CONTENT_2,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.ABOUT_DEV_STORY_CONTENT_3,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('technology-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > visiblePercentageThreshold) {
                        _controllers[2].forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _controllers[2],
                      number: "/02 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                      title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: technologySectionAnimation,
                            width: widthOfBody,
                            maxLines: 12,
                            text: StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      ),
                      footer: VisibilityDetector(
                        key: const Key('technology-list'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage =
                              visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 60) {
                            _controllers[4].forward();
                          }
                        },
                        child: Column(
                          children: [
                            SpaceH40(),
                            TechnologySection(
                              width: contentAreaWidth,
                              controller: _controllers[4],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('contact-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > visiblePercentageThreshold) {
                        _controllers[3].forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _controllers[3],
                      number: "/03 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                      title: StringConst.ABOUT_DEV_CONTACT_SOCIAL,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH20(),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: _buildSocials(Data.socialData2),
                          ),
                        ],
                      ),
                      footer: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH40(),
                          AnimatedTextSlideBoxTransition(
                            controller: _controllers[3],
                            text: StringConst.ABOUT_DEV_CONTACT_EMAIL,
                            textStyle: titleStyle,
                          ),
                          SpaceH40(),
                          AnimatedLineThroughText(
                            text: StringConst.DEV_EMAIL,
                            hasSlideBoxAnimation: true,
                            controller: _controllers[3],
                            onTap: () {
                              Functions.launchUrl(StringConst.EMAIL_URL);
                            },
                            textStyle: bodyText2Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('quote-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > visiblePercentageThreshold) {
                        _controllers[5].forward();
                      }
                    },
                    child: Column(
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _controllers[5],
                          text: StringConst.FAMOUS_QUOTE,
                          maxLines: 5,
                          width: contentAreaWidth,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle?.copyWith(
                            fontSize: responsiveSize(
                              context,
                              Sizes.TEXT_SIZE_24,
                              Sizes.TEXT_SIZE_36,
                              md: Sizes.TEXT_SIZE_28,
                            ),
                            height: 2.0,
                          ),
                        ),
                        SpaceH20(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedTextSlideBoxTransition(
                            controller: _controllers[5],
                            text: "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                            textStyle: textTheme.bodyLarge?.copyWith(
                              fontSize: responsiveSize(
                                context,
                                Sizes.TEXT_SIZE_16,
                                Sizes.TEXT_SIZE_18,
                                md: Sizes.TEXT_SIZE_16,
                              ),
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.2),
                ],
              ),
            ),
          ),
          // SlidingBanner(),
          const AnimatedFooter()
        ],
      ),
    );
  }

  List<Widget> _buildSocials(List<SocialData> data) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: _controllers[3],
          hasSlideBoxAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}