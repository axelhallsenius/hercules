import 'package:flutter/material.dart';

// This widget is used to create a search box with history.
class SearchBoxWithHistory extends StatefulWidget {
  final String hintText;
  final String searchKey;

  // Constructor to initialize the search box with history.
  SearchBoxWithHistory({
    this.hintText = 'Start typing',
    required this.searchKey,
  });

  @override
  SearchBoxWithHistoryState createState() => SearchBoxWithHistoryState();
}

// This class is used to create the state of the search box with history.
class SearchBoxWithHistoryState extends State<SearchBoxWithHistory> {
  final _textFieldKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final Map<String, List<String>> _searchHistories = {
    'dashboard': ['Dashboard 1', 'Dashboard 2', 'Dashboard 3'],
    'collections': ['Collection 1', 'Collection 2', 'Collection 3'],
    // More categories can be added here
  };

  List<String> get _searchHistory => _searchHistories[widget.searchKey] ?? [];

  // This method is used to initialize the state of the search box with history.
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusListener);
  }

  // This method is used to listen to the focus of the search box.
  void _focusListener() {
    if (_focusNode.hasFocus) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  // This method is used to create an overlay entry for the search box.
  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: _searchHistory
                .map((history) => ListTile(
                      title: Text(history),
                      onTap: () {
                        _controller.text = history;
                        _focusNode.unfocus();
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _searchHistories[widget.searchKey]?.remove(history);
                          });
                          _overlayEntry?.remove();
                          if (_focusNode.hasFocus) {
                            _overlayEntry = _createOverlayEntry();
                            Overlay.of(context).insert(_overlayEntry!);
                          } else {
                            _overlayEntry = null;
                          }
                        },
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
          key: _textFieldKey,
          focusNode: _focusNode,
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            contentPadding: EdgeInsets.all(10),
          ),
          onSubmitted: (value) => setState(() {
                setState(() {
                  if (value.isNotEmpty &&
                      !(_searchHistories[widget.searchKey]?.contains(value) ??
                          false)) {
                    _searchHistories[widget.searchKey] =
                        (_searchHistories[widget.searchKey] ?? [])..add(value);
                  }
                });
              })),
    );
  }

  // This method is used to dispose the search box with history.
  @override
  void dispose() {
    _focusNode.removeListener(_focusListener);
    _focusNode.dispose();
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }
}
