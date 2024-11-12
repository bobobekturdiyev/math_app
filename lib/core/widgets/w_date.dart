//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../resources/app_colors.dart';
// import '../resources/app_icons.dart';
// import '../resources/styles.dart';
// import 'w_form_field_holder.dart';
//
// class WDate extends StatefulWidget {
//   final Function(DateTime) onDateChange;
//  final String? date;
//  final String? errorText;
//   const WDate({
//     Key? key,
//     required this.onDateChange,
//     this.date, this.errorText
//   }) : super(key: key);
//
//   @override
//   State<WDate> createState() => _WDateState();
// }
//
// class _WDateState extends State<WDate> {
//   late CalendarController calendarController;
//   String? time;
//   @override
//   void initState() {
//
//     super.initState();
//     calendarController = CalendarController();
//     time=widget.date;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (ctx) => AlertDialog(
//                   backgroundColor: AppColors.white,
//                   contentPadding: EdgeInsets.zero,
//                   content: Container(
//                     width: 200,
//                     height: 400,
//                     color: AppColors.white,
//                     child: SfCalendar(
//                       showDatePickerButton: true,
//                       view: CalendarView.month,
//                       showNavigationArrow: true,
//                       controller: calendarController,
//
//                       onTap: (CalendarTapDetails details) {
//                         print(" bu ishladiku axire");
//
//                         if(details.date!=null){
//                           widget.onDateChange(details.date!);
//                           time= DateFormat("yyyy-MM-dd").format(details.date!);
//                         }
//                                 setState(() {});
//                       },
//                     ),
//                   ),
//                 ));
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           if (widget.errorText!=null)...{
//             Text(widget.errorText!,style: Styles.getTextStyle(color: AppColors.danger),)
//           },
//
//
//           WFormFieldHolder(
//             verticalPadding: 16,
//             isError: widget.errorText!=null,
//
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   AppIcons.calendar,
//                   width: 16,
//                   height: 16,
//                 ),
//                 const SizedBox(width: 4),
//                 Expanded(
//                   child: Text(
//                     // user.account.birthday ??
//                     (widget.date==null&&time==null)?
//                     "select_date".tr():time!,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: Styles.getTextStyle(
//                       color: AppColors.black.withOpacity(0.3),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
