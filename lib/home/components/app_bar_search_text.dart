import 'package:flutter/material.dart';

class AppBarSearchText extends StatefulWidget {
  final TextEditingController controller;
  final Function onPressedSearch;
  final bool iconMic;
  final Function onPressedMic;

  const AppBarSearchText(
      {Key key,
      this.controller,
      this.onPressedSearch,
      this.iconMic,
      this.onPressedMic})
      : super(key: key);

  @override
  _AppBarSearchTextState createState() => _AppBarSearchTextState();
}

class _AppBarSearchTextState extends State<AppBarSearchText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      color: Colors.white,
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: Container(
              margin: EdgeInsets.all(16),
              child: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextFormField(
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) {
                widget.onPressedSearch();
              },
              cursorColor: Colors.black,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 12, top: 12),
                hintText: 'Pesquisa aqui',
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: IconButton(
              icon: Icon(
                widget.iconMic ? Icons.mic : Icons.mic_none,
                color: Colors.black,
              ),
              onPressed: widget.onPressedMic,
            ),
          ),
        ],
      ),
    );
  }
}
