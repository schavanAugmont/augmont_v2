import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/services/app_session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  final _searchQuery = TextEditingController();

  @override
  void dispose() {
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
              ),
              titleSpacing: 0,
              title: Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: lightColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: _searchQuery,
                        style: CustomTheme.style(weight: FontWeight.w600),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "eg. Gold coin",
                          hintStyle: CustomTheme.style(color: Colors.grey, size: 13),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _searchQuery.clear();
                        });
                      },
                      icon: const Icon(Icons.highlight_remove_rounded, size: 20, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Recently Searched",
                  style: CustomTheme.style(
                    weight: FontWeight.w600,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: AppSessionService.instance.recentSearchList.length,
                itemBuilder: (context, index) {
                  final item = AppSessionService.instance.recentSearchList[index];
                  return ListTile(
                    leading: Image.asset(
                      "assets/icons/search.png",
                      width: 18,
                      color: Colors.grey,
                    ),
                    title: Text(
                      item,
                      style: CustomTheme.style(weight: FontWeight.w600),
                    ),
                    trailing: const Icon(
                      Icons.stacked_line_chart_rounded,
                      size: 18,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.back(result: item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
