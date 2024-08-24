import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HighlightPercentageText extends StatelessWidget {
  final String dynamicText;
  final String userName;
  const HighlightPercentageText(
      {super.key, required this.dynamicText, required this.userName});

  @override
  Widget build(BuildContext context) {
    final RegExp regex = RegExp(r'(-?\d+(\.\d+)?%)');
    final match = regex.firstMatch(dynamicText);

    if (match == null) {
      // If no percentage is found, display the text as is
      return Text(
        dynamicText,
        style: TextStyle(
          color: const Color(0xFF2C2C2C),
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    final String percentage = match.group(0)!;
    final int start = match.start;
    final int end = match.end;
    final double percentValue =
        double.tryParse(percentage.replaceAll('%', '')) ?? 0.0;

    // Determine color for percentage
    Color percentageColor =
        percentValue < 0 ? Colors.red : const Color(0xFF4E0BBB);

    // Split text before and after percentage
    String textBeforePercentage = dynamicText.substring(0, start);
    String textAfterPercentage = dynamicText.substring(end);

    // Determine if the word "down" or "better" should be highlighted
    String highlightWord;
    Color highlightColor;
    if (percentValue < 0) {
      highlightWord = "down";
      highlightColor = Colors.red;
    } else {
      highlightWord = "better";
      highlightColor = const Color(0xFF4E0BBB);
    }

    final highlightMatch = RegExp(r'\b' + RegExp.escape(highlightWord) + r'\b')
        .firstMatch(textBeforePercentage);

    // Define keywords and their styles
    const String keyword1 = "down";
    const String keyword2 = "better";

    // Text segments
    final String beforePercentage = dynamicText.substring(0, start);
    final String afterPercentage = dynamicText.substring(end);

    // Find and highlight keywords based on percentage context
    final bool containsKeyword1 =
        percentValue < 0 && afterPercentage.toLowerCase().contains(keyword1);
    final bool containsKeyword2 =
        percentValue >= 0 && afterPercentage.toLowerCase().contains(keyword2);

    final RegExp keywordRegex = RegExp(
      containsKeyword1 ? keyword1 : (containsKeyword2 ? keyword2 : ''),
      caseSensitive: false,
    );

    final keywordMatch = keywordRegex.firstMatch(afterPercentage);
    return percentValue < 0
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "$userName\n",
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    )),
                // Text before the percentage, with possible highlight
                if (highlightMatch != null) ...[
                  TextSpan(
                    text:
                        textBeforePercentage.substring(0, highlightMatch.start),
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: textBeforePercentage.substring(
                        highlightMatch.start, highlightMatch.end),
                    style: TextStyle(
                      color: highlightColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: textBeforePercentage.substring(highlightMatch.end),
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else
                  TextSpan(
                    text: textBeforePercentage,
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                // Percentage
                TextSpan(
                  text: percentage,
                  style: TextStyle(
                    color: percentageColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Text after the percentage
                TextSpan(
                  text: textAfterPercentage,
                  style: TextStyle(
                    color: const Color(0xFF2C2C2C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        : Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "$userName\n",
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    )),
                TextSpan(
                  text: beforePercentage,
                  style: TextStyle(
                    color: const Color(0xFF2C2C2C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: percentage,
                  style: TextStyle(
                    color: highlightColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (keywordMatch != null) ...[
                  TextSpan(
                    text: afterPercentage.substring(0, keywordMatch.start),
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: afterPercentage.substring(
                        keywordMatch.start, keywordMatch.end),
                    style: TextStyle(
                      color: highlightColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: afterPercentage.substring(keywordMatch.end),
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else
                  TextSpan(
                    text: afterPercentage,
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          );
  }
}
