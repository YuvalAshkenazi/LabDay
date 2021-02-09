import 'package:flutter/cupertino.dart';

/// The base class for the different types of items the list can contain.
abstract class IListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);

  Widget buildLeftImage(BuildContext context);
}
