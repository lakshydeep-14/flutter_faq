library flutter_faq;

import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  final String question;
  final String answer;
  final TextStyle? queStyle;
  final TextStyle? ansStyle;
  final Widget? icon;
  final bool? isExpanded;
  final Widget? expandedIcon;
  final Widget? collapsedIcon;
  final bool showDivider;
  final EdgeInsets? ansPadding;
  final Widget? separator;

  const FAQ(
      {super.key,
      required this.question,
      required this.answer,
      this.queStyle,
      this.ansStyle,
      this.isExpanded = false,
      this.icon,
      this.expandedIcon,
      this.collapsedIcon,
      this.showDivider = true,
      this.ansPadding,
      this.separator});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return ListExpandableWidget(
      separator: widget.separator ?? const Divider(),
      showDivider: widget.showDivider,
      isExpanded: widget.isExpanded,
      expandedIcon:
          widget.expandedIcon ?? const Icon(Icons.keyboard_arrow_down),
      collapsedIcon:
          widget.collapsedIcon ?? const Icon(Icons.keyboard_arrow_right),
      header: Text(
        widget.question,
        style: widget.queStyle ??
            const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      items: Padding(
        padding: widget.ansPadding ??
            const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
        child: Text(
          widget.answer,
          textAlign: TextAlign.justify,
          style: widget.ansStyle ??
              const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
        ),
      ),
    );
  }
}

class ListExpandableWidget extends StatefulWidget {
  // optional property and default value is false
  final bool? isExpanded;

  final Widget separator;

  // required widget and display the header of each group
  final Widget? header;

  // required list `ListTile` widget for group items
  final Widget items;

  // optional widget for expanded Icon. Default value is `Icon(Icons.keyboard_arrow_down)`
  final Widget expandedIcon;

  final bool showDivider;

  // optional widget for collapse Icon. Default value is `Icon(Icons.keyboard_arrow_right)`
  final Widget collapsedIcon;
  const ListExpandableWidget(
      {super.key,
      this.isExpanded,
      this.header,
      required this.showDivider,
      required this.items,
      required this.expandedIcon,
      required this.collapsedIcon,
      required this.separator});

  @override
  State<ListExpandableWidget> createState() => _ListExpandableWidgetState();
}

class _ListExpandableWidgetState extends State<ListExpandableWidget> {
  bool? _isExpanded;

  @override
  void initState() {
    super.initState();
    _updateExpandState(widget.isExpanded!);
  }

  void _updateExpandState(bool isExpanded) =>
      setState(() => _isExpanded = isExpanded);

  @override
  Widget build(BuildContext context) {
    return _isExpanded! ? _buildListItems(context) : _wrapHeader();
  }

  Widget _wrapHeader() {
    List<Widget> children = [];
    if (!widget.isExpanded!) {
      children.add(widget.showDivider == false
          ? const SizedBox(
              height: 5,
            )
          : widget.separator);
    }
    children.add(ListTile(
      title: widget.header,
      trailing: _isExpanded! ? widget.expandedIcon : widget.collapsedIcon,
      onTap: () => _updateExpandState(!_isExpanded!),
    ));
    return Ink(
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildListItems(BuildContext context) {
    List<Widget> titles = [];
    titles.add(_wrapHeader());
    titles.add(widget.items);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ListTile.divideTiles(tiles: titles, context: context).toList(),
    );
  }
}
