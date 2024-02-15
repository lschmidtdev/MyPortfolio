import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/layout/responsive_layout.dart';
import '../../utils/values/values.dart';
import '../../utils/widgets/animated_widgets/animated_footer.dart';
import '../../utils/widgets/animated_widgets/animated_positioned_text.dart';
import '../../utils/widgets/animated_widgets/animated_text_slide_box_transition.dart';
import '../../utils/widgets/content_area.dart';
import '../../utils/widgets/content_builder.dart';
import '../../utils/widgets/custom_spacer.dart';
import '../../utils/widgets/page_header.dart';
import '../../utils/widgets/page_wrapper.dart';
import '../../utils/widgets/spaces.dart';


class ExperiencePage extends StatefulWidget {
  static const String experiencePageRoute = StringConst.EXPERIENCE_PAGE;
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<AnimationController> _experienceControllers;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: Animations.animationDuration1200),
      vsync: this,
    );
    _experienceControllers = List.generate(4, (index) => AnimationController(
      duration: const Duration(milliseconds: Animations.animationDuration1200),
      vsync: this,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in _experienceControllers) {
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
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );

    return PageWrapper(
      selectedRoute: ExperiencePage.experiencePageRoute,
      selectedPageName: StringConst.EXPERIENCE,
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
          PageHeader(
            headingText: StringConst.EXPERIENCE,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildExperienceSection(
                  data: Data.experienceData,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          const AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSection({
    required List<ExperienceData> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_18,
        Sizes.TEXT_SIZE_20,
      ),
    );

    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        VisibilityDetector(
          key: Key('experience-section-$index'),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 40) {
              _experienceControllers[index].forward();
            }
          },
          child: ContentBuilder(
            controller: _experienceControllers[index],
            number: "/0${index + 1}",
            width: width,
            section: data[index].duration.toUpperCase(),
            heading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextSlideBoxTransition(
                  controller: _experienceControllers[index],
                  text: data[index].company,
                  textStyle: defaultTitleStyle,
                ),
                SpaceH16(),
                AnimatedTextSlideBoxTransition(
                  controller: _experienceControllers[index],
                  text: data[index].position,
                  textStyle: defaultTitleStyle?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.TEXT_SIZE_16,
                      Sizes.TEXT_SIZE_18,
                    ),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRoles(
                roles: data[index].roles,
                controller: _experienceControllers[index],
                width: width * 0.75,
              ),
            ),
          ),
        ),
      );
      items.add(
        const CustomSpacer(heightFactor: 0.1),
      );
    }

    return items;
  }

  List<Widget> _buildRoles({
    required List<String> roles,
    required AnimationController controller,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        17,
      ),
      color: AppColors.grey750,
      fontWeight: FontWeight.w300,
      height: 1.5,
      // letterSpacing: 2,
    );

    List<Widget> items = [];
    for (int index = 0; index < roles.length; index++) {
      items.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.play_arrow_outlined,
              color: AppColors.black,
              size: 12,
            ),
            SpaceW8(),
            Flexible(
              child: AnimatedPositionedText(
                text: roles[index],
                textStyle: bodyText1Style,
                maxLines: 7,
                width: width,
                controller: CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                ),
              ),
            ),
          ],
        ),
      );

      items.add(SpaceH12());
    }

    return items;
  }
}