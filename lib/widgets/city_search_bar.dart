import 'package:flutter/material.dart';

class CitySearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const CitySearchBar({super.key, required this.onSearch});

  @override
  State<CitySearchBar> createState() => _CitySearchBarState();
}

class _CitySearchBarState extends State<CitySearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: 'Search City',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            iconSize: 32,
            color: Colors.black87,
            onPressed: () {
              widget.onSearch(_textController.text);
              _textController.clear();
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      onSubmitted: (text) {
        widget.onSearch(text);
      },
    );
  }
}
