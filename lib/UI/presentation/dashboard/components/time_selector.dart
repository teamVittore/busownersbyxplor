import 'package:admin_app/UI/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePeriodSelector extends StatefulWidget {
  const TimePeriodSelector({super.key});

  @override
  _TimePeriodSelectorState createState() => _TimePeriodSelectorState();
}

class _TimePeriodSelectorState extends State<TimePeriodSelector> {
  String _selectedPeriod = 'Today';
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          _selectedPeriod = value;
        });
        var epochTimes = handleSelection(value);
        BlocProvider.of<DashboardCubit>(context).getRevenue(
          start: epochTimes['startEpoch'].toString(),
          end: epochTimes['endEpoch'].toString(),
          selectedPeriod: _selectedPeriod,
        );
        print('Selected period: $value');
        print('From (epoch): ${epochTimes['startEpoch']}');
        print('To (epoch): ${epochTimes['endEpoch']}');
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Today',
          child: Text('Today'),
        ),
        const PopupMenuItem<String>(
          value: 'Yesterday',
          child: Text('Yesterday'),
        ),
        const PopupMenuItem<String>(
          value: 'Last 7 days',
          child: Text('Last 7 days'),
        ),
        const PopupMenuItem<String>(
          value: 'Last 30 days',
          child: Text('Last 30 days'),
        ),
      ],
      child: Container(
        //  width: 120.w,
        height: 32.h,
        padding:
            EdgeInsets.only(top: 7.h, left: 15.w, right: 13.w, bottom: 7.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFEBEDF8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEBEDF8)),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedPeriod,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
            SizedBox(width: 5.w),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  handleSelection(String value) {
    DateTime now = DateTime.now();
    DateTime startDate;
    DateTime endDate = now;

    switch (value) {
      case 'Today':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case 'Yesterday':
        startDate = DateTime(now.year, now.month, now.day - 1);
        endDate = DateTime(now.year, now.month, now.day - 1, 23, 59, 59);
        break;
      case 'Last 7 days':
        startDate = now.subtract(const Duration(days: 7));
        break;
      case 'Last 30 days':
        startDate = now.subtract(const Duration(days: 30));
        break;
      default:
        startDate = now;
        break;
    }

    int startEpoch = startDate.millisecondsSinceEpoch;
    int endEpoch = endDate.millisecondsSinceEpoch;

    return {
      'startEpoch': startEpoch,
      'endEpoch': endEpoch,
    };

    // Add your custom logic here, for example, fetch data based on the selected period
  }

  @override
  void initState() {
    super.initState();
    var epochTimes = handleSelection(_selectedPeriod);
    BlocProvider.of<DashboardCubit>(context).getRevenue(
        selectedPeriod: _selectedPeriod,
        start: epochTimes['startEpoch'].toString(),
        end: epochTimes['endEpoch'].toString());
  }
}
