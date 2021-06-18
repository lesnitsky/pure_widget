import 'package:flutter/widgets.dart';

import 'element.dart';

abstract class PureWidget<T> extends Widget {
  /// In oreder for built-in [shouldRebuild] to work, your widget should define [props]
  /// ```dart
  /// class MyWidget extends PureWidget<int> {
  ///   final int props;
  ///
  ///   MyWidget({ Key? key, required this.props }) : super(key: key);
  ///
  ///   ...
  /// }
  T get props;

  const PureWidget({Key? key}) : super(key: key);

  @override
  PureElement createElement() {
    return PureElement<T>(this);
  }

  /// Override this method of you want your widget rebuilds to be driven by custom logic
  /// Default behavior: compares props by reference
  bool shouldRebuild(
    covariant PureWidget oldWidget,
    covariant PureWidget newWidget,
  ) {
    return oldWidget.props != newWidget.props;
  }

  Widget build(BuildContext context);
}
