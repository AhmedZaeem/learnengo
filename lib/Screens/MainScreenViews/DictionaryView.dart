import 'package:dictionaryx/dictentry.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Widget/MyInput.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({super.key});

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void lookupWord() async {
    DictEntry? tmp;

    final txt = searchController.text.trim();
    if (await dMSAJson.hasEntry(txt)) {
      tmp = await dMSAJson.getEntry(txt);
    }
    setState(() {
      if (tmp != null) {
        _entry = tmp;
      } else {
        _entry = DictEntry('', [], [], []);
      }
    });
  }

  final dMSAJson = DictionaryMSAFlutter();
  late DictEntry _entry = DictEntry('', [], [], []);
  bool searched = false;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    searched = !(_entry.word == '');
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 83.h, end: 24.w, start: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInput(
              fillColor: Theme.of(context).colorScheme.onSecondary,
              suffix: 'search',
              onSubmit: (value) {
                lookupWord();
              },
              controller: searchController,
              hintColor: Theme.of(context).colorScheme.onBackground,
              hint: appLocale.wordSearchHint,
              hasBoarder: false,
            ),
            SizedBox(height: 20.h),
            searched
                ? Text(
                    '${_entry.word.toUpperCase()} :',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 20.h),
            searched
                ? Text(
                    'Means ${_entry.synonyms.first}  ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
