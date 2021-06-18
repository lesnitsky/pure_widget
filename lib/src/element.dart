import 'package:flutter/widgets.dart';

import 'widget.dart';

class PureElement<T> extends ComponentElement {
  PureElement(PureWidget widget) : super(widget);

  PureWidget<T> get widget => super.widget as PureWidget<T>;

  bool shouldRebuild = true;

  @override
  void update(PureWidget<T> newWidget) {
    shouldRebuild = newWidget.shouldRebuild(widget, newWidget);

    if (shouldRebuild) {
      markNeedsBuild();
    }

    super.update(newWidget);
  }

  @override
  Widget build() {
    return widget.build(this);
  }
}
