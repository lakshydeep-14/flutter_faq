library flutter_faq;

import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  // for question
  final String question;

  //answer
  final String answer;

  //question textstyle, defaults to EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
  final TextStyle? queStyle;

  // answertextstyle, defaults to  TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),
  final TextStyle? ansStyle;

  //defaults to false
  final bool? isExpanded;

  //defaults to Icon.chevron_right
  final Widget? expandedIcon;
  final Widget? collapsedIcon;

  //defaults to true
  final bool showDivider;

  //padding to give in answer
  final EdgeInsets? ansPadding;

  //divider
  final Widget? separator;

  final BoxDecoration? ansDecoration, queDecoration;

  const FAQ(
      {super.key,
      required this.question,
      required this.answer,
      this.queStyle,
      this.ansStyle,
      this.isExpanded = false,
      this.expandedIcon,
      this.collapsedIcon,
      this.showDivider = true,
      this.ansPadding,
      this.separator,
      this.ansDecoration,
      this.queDecoration});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return ListExpandableWidget(
      ansDecoration: widget.ansDecoration ??
          BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
      queDecoration: widget.queDecoration ??
          BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
      ansPadding: widget.ansPadding ??
          const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
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
      items: Text(
        widget.answer,
        textAlign: TextAlign.justify,
        style: widget.ansStyle ??
            const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
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

  final EdgeInsets ansPadding;
  final bool showDivider;
  final BoxDecoration ansDecoration, queDecoration;
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
      required this.separator,
      required this.ansPadding,
      required this.ansDecoration,
      required this.queDecoration});

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
    children.add(Container(
      decoration: widget.queDecoration,
      child: ListTile(
        style: ListTileStyle.drawer,
        title: widget.header,
        trailing: _isExpanded! ? widget.expandedIcon : widget.collapsedIcon,
        onTap: () => _updateExpandState(!_isExpanded!),
      ),
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
    titles.add(Container(
        width: double.infinity,
        decoration: widget.ansDecoration,
        padding: widget.ansPadding,
        child: widget.items));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: ListTile.divideTiles(tiles: titles, context: context).toList(),
    );
  }
}
