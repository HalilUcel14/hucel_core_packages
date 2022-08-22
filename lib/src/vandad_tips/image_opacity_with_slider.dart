import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ImageOpacityWithSlider extends StatefulWidget {
  const ImageOpacityWithSlider(
      {Key? key,
      this.duration,
      required this.url,
      this.sliderdivisions,
      this.sliderlabel,
      this.slideractiveColor,
      this.sliderinactiveColor,
      this.sliderthumbColor,
      this.slidermouseCursor,
      this.slidersemanticFormatterCallback,
      this.sliderfocusNode})
      : super(key: key);
  //
  final String url;
  final Duration? duration;
  // Slider
  final double slidermin = 0.0;
  final double slidermax = 1.0;
  final int? sliderdivisions;
  final String? sliderlabel;
  final Color? slideractiveColor;
  final Color? sliderinactiveColor;
  final Color? sliderthumbColor;
  final MouseCursor? slidermouseCursor;
  final String Function(double)? slidersemanticFormatterCallback;
  final FocusNode? sliderfocusNode;
  final bool sliderautofocus = false;
  //
  @override
  State<ImageOpacityWithSlider> createState() => _ImageOpacityWithSliderState();
}

class _ImageOpacityWithSliderState extends State<ImageOpacityWithSlider>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  //
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );
    _opacity = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HUNetworkImage(
          imageUrl: widget.url,
          opacity: _opacity,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Slider(
          value: _controller.value,
          onChanged: (value) {
            setState(() {
              _controller.value = value;
            });
          },
          activeColor: widget.slideractiveColor,
          autofocus: widget.sliderautofocus,
          divisions: widget.sliderdivisions,
          focusNode: widget.sliderfocusNode,
          inactiveColor: widget.sliderinactiveColor,
          label: widget.sliderlabel,
          max: widget.slidermax,
          min: widget.slidermin,
          mouseCursor: widget.slidermouseCursor,
          semanticFormatterCallback: widget.slidersemanticFormatterCallback,
          thumbColor: widget.sliderthumbColor,
        ),
      ],
    );
  }
}
