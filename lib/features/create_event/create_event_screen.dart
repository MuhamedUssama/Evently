import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/features/create_event/provider/create_event_screen_provider.dart';
import 'package:evently/features/create_event/widgets/category_image_widget.dart';
import 'package:evently/features/create_event/widgets/category_tab_item.dart';
import 'package:evently/features/create_event/widgets/choose_location_button.dart';
import 'package:evently/features/create_event/widgets/custom_date_and_time_widget.dart';
import 'package:evently/features/create_event/widgets/event_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatelessWidget {
  static const String routeName = '/createEvent';
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventScreenProvider(),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Event'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_rounded, color: AppTheme.primary),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<CreateEventScreenProvider>(
            builder: (context, provider, child) {
              return Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 16),
                  CategoryImageWidget(
                    imagePath:
                        CategoryTabModel
                            .tabs[provider.currentIndex]
                            .lightImagePath,
                  ),
                  SizedBox(
                    height: 46.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return CategoryTabItem(
                          tabModel:
                              CategoryTabModel.tabs[index +
                                  provider.startIndex],
                          isSelected:
                              provider.currentIndex ==
                              index + provider.startIndex,
                          onTap: () {
                            provider.onCategoryClicked(index);
                          },
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(width: 10.w),
                      itemCount:
                          CategoryTabModel.tabs.length - provider.startIndex,
                    ),
                  ),
                  EventFormWidget(provider: provider),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDateAndTimeWidget(
                          icon: Icons.date_range_outlined,
                          title: 'Event Date',
                          buttonTitle:
                              provider.selectedDate == null
                                  ? 'Choose Date'
                                  : provider.dateFormat.format(
                                    provider.selectedDate!,
                                  ),
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              initialDate: provider.selectedDate,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            );

                            if (date != null) provider.selectedDate = date;
                          },
                        ),
                        CustomDateAndTimeWidget(
                          icon: Icons.access_time,
                          title: 'Event Time',
                          buttonTitle:
                              provider.timeOfDay == null
                                  ? 'Choose Time'
                                  : provider.formatTimeOfDay(
                                    provider.timeOfDay!,
                                  ),
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(
                                    context,
                                  ).copyWith(alwaysUse24HourFormat: false),
                                  child: child!,
                                );
                              },
                            );

                            if (time != null) provider.timeOfDay = time;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Location',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                        ),
                        const SizedBox(height: 8),
                        ChooseLocationButton(onPressed: () {}),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'Add Event',
                          onPressed: () {
                            provider.createEvent();
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
