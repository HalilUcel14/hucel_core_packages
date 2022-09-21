import 'package:flutter/material.dart';

const emailProviders = [
  'gmail.com',
  'hotmail.com',
  'yahoo.com',
  'outlook.com',
];

const icons = [
  'https://bit.ly/3HsvvvB',
  'https://bit.ly/3n6GW4L',
  'https://bit.ly/3zf2RLy',
];

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/raw-auto-complete-in-flutter/raw-auto-complete-in-flutter.dart
class RawAutoCompleteFormField extends StatefulWidget {
  const RawAutoCompleteFormField({Key? key}) : super(key: key);

  @override
  State<RawAutoCompleteFormField> createState() =>
      _RawAutoCompleteFormFieldState();
}

class _RawAutoCompleteFormFieldState extends State<RawAutoCompleteFormField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  //
  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      textEditingController: _controller,
      focusNode: _focusNode,
      fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: (value) => onSubmitted,
        );
      },
      optionsBuilder: (textEditingValue) {
        final lastChar = textEditingValue.text.characters.last;
        if (lastChar == '@') {
          return emailProviders;
        } else {
          return [];
        }
      },
      optionsViewBuilder: (context, onSelected, options) {
        return OptionsList(
          onSelected: onSelected,
          options: options,
          controller: _controller,
        );
      },
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList(
      {Key? key,
      required this.options,
      required this.onSelected,
      required this.controller})
      : super(key: key);
  //
  final Iterable<String> options;
  final AutocompleteOnSelected<String> onSelected;
  final TextEditingController controller;
  //
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return GestureDetector(
                onTap: () => onSelected(controller.text + option),
                child: ListTile(
                  horizontalTitleGap: 2.0,
                  leading: Image.network(
                    icons[index],
                    width: 24,
                    height: 24,
                  ),
                  title: Text(option),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
