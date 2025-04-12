import 'package:flutter/material.dart';

import 'package:fl_nodes/fl_nodes.dart';

class SearchWidget extends StatefulWidget {
  final FlNodeEditorController controller;

  const SearchWidget({required this.controller, super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchResults = [];
  final FocusNode _focusNode = FocusNode();
  String? _currentFocus;
  bool _isSearching = false;
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toNextResult() async {
    final idx = _searchResults.indexOf(_currentFocus!);

    if (idx < _searchResults.length - 1) {
      _currentFocus = _searchResults[idx + 1];
    } else {
      _currentFocus = _searchResults[0];
    }

    widget.controller.focusNodesById({_currentFocus!});
  }

  void _toPreviousResult() async {
    final idx = _searchResults.indexOf(_currentFocus!);

    if (idx > 0) {
      _currentFocus = _searchResults[idx - 1];
    } else {
      _currentFocus = _searchResults[_searchResults.length - 1];
    }

    widget.controller.focusNodesById({_currentFocus!});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 50,
      duration: const Duration(milliseconds: 900),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.search, size: 32, color: Colors.white),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
              });
            },
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child:
                _showSearch
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            key: ValueKey<bool>(_showSearch),
                            width: 200,
                            child: TextField(
                              autofocus: true,
                              focusNode: _focusNode,
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search nodes by name...',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) async {
                                if (value.isEmpty) {
                                  setState(() {
                                    _isSearching = false;
                                    _searchResults.clear();
                                  });
                                  return;
                                }

                                setState(() {
                                  _isSearching = true;
                                  _searchResults.clear();
                                });

                                _searchResults.addAll(
                                  await widget.controller.searchNodesByName(
                                    value,
                                  ),
                                );

                                setState(() {
                                  _isSearching = false;
                                });
                              },
                              onSubmitted: (value) {
                                if (_searchResults.isEmpty) return;

                                if (_currentFocus == null) {
                                  _currentFocus = _searchResults.first;

                                  widget.controller.focusNodesById({
                                    _currentFocus!,
                                  });
                                } else {
                                  _toNextResult();
                                }

                                _focusNode.requestFocus();
                              },
                              onTapOutside: (event) => _focusNode.unfocus(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (_currentFocus != null)
                            IconButton(
                              icon: const Icon(
                                Icons.navigate_before,
                                color: Colors.white,
                              ),
                              onPressed: _toPreviousResult,
                            ),
                          if (_currentFocus != null)
                            IconButton(
                              icon: const Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              ),
                              onPressed: _toNextResult,
                            ),
                          const SizedBox(width: 8),
                          Text(
                            _isSearching
                                ? 'Searching...'
                                : '${_searchResults.length} results',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
