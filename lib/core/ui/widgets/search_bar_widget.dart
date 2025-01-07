import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SearchBarWidget extends StatefulWidget {
  final String? description;
  final int? count;
  final VoidCallback func;

  const SearchBarWidget({
    super.key,
    required this.func,
    this.description,
    this.count,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _textEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .92,
              child: TextFormField(
                controller: _textEC,
                decoration: InputDecoration(
                  fillColor: AppTheme.greyColor.withOpacity(0.3),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: AppTheme.blueColor,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    size: 24,
                    color: AppTheme.greyColor,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  contentPadding: const EdgeInsets.all(10.0),
                  hintStyle: AppTheme.textNormal.copyWith(
                    color: AppTheme.greyColor,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
