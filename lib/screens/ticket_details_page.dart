import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/screens/map_screen_widget.dart';
import 'package:ticketmaster/utils/constants.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ticketmaster/utils/widget/main_button.dart';

class TicketDetailsPage extends StatefulHookConsumerWidget {
  const TicketDetailsPage({super.key, required this.event});
  final Event event;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketDetailsPageState();
}

class _TicketDetailsPageState extends ConsumerState<TicketDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<ImageFile> imageData =
        (widget.event.images ?? [])
            .where(
              (element) =>
                  (element.ratio != Ratio.THE_32) &&
                  element.ratio != Ratio.THE_43,
            )
            .toList();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.ww(context)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 25.ww(context),
                //bottom: 10.hh(context),
              ),
              child: Text(
                widget.event.name ?? '',
                style: TextStyle(
                  color:
                      (isDarkMode(context))
                          ? injector.palette.pureWhite
                          : injector.palette.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy:
                    CenterPageEnlargeStrategy
                        .zoom, // Enlarge proportionally by height
                viewportFraction:
                    1, // Adjust how much of the width each item takes
                aspectRatio: 4 / 3,
                enlargeFactor: 1,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items:
                  (imageData).map((imagePath) {
                    return CachedNetworkImage(
                      imageUrl: imagePath.url ?? '',
                      fit: BoxFit.fill,

                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                    );
                  }).toList(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.ww(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ticket Sales Start',
                        style: TextStyle(
                          color:
                              (isDarkMode(context))
                                  ? injector.palette.pureWhite
                                  : injector.palette.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        formatDateTime(
                          widget.event.sales?.public?.startDateTime ??
                              DateTime.now(),
                        ),
                        style: TextStyle(
                          color:
                              (isDarkMode(context))
                                  ? injector.palette.pureWhite
                                  : injector.palette.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150.ww(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ticket Sales End',
                        style: TextStyle(
                          color:
                              (isDarkMode(context))
                                  ? injector.palette.pureWhite
                                  : injector.palette.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        formatDateTime(
                          widget.event.sales?.public?.endDateTime ??
                              DateTime.now(),
                        ),
                        style: TextStyle(
                          color:
                              (isDarkMode(context))
                                  ? injector.palette.pureWhite
                                  : injector.palette.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Row(
              children: [
                Text(
                  'Event Date:',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(20.ww(context)),
                Expanded(
                  child: Text(
                    formatDateTime(
                      widget.event.dates?.start?.dateTime ?? DateTime.now(),
                    ),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Row(
              children: [
                Text(
                  'Event Price:',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(20.ww(context)),
                Expanded(
                  child: Column(
                    children: [
                      for (
                        var index = 0;
                        index < (widget.event.priceRanges ?? []).length;
                        index++
                      )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Minimum\n${widget.event.priceRanges?[index].min ?? 'USD'} ${widget.event.priceRanges?[index].currency ?? 'USD'}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:
                                    (isDarkMode(context))
                                        ? injector.palette.pureWhite
                                        : injector.palette.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Gap(25.hh(context)),
                            Text(
                              'Maximum\n${widget.event.priceRanges?[index].max ?? 'USD'} ${widget.event.priceRanges?[index].currency ?? 'USD'}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:
                                    (isDarkMode(context))
                                        ? injector.palette.pureWhite
                                        : injector.palette.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Row(
              children: [
                Text(
                  'Is there age limit:',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(20.ww(context)),
                Expanded(
                  child: Text(
                    (widget.event.ageRestrictions?.legalAgeEnforced ?? false)
                        ? 'Yes'
                        : 'No',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Row(
              children: [
                Text(
                  'Lead Promoters',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(20.ww(context)),
                Expanded(
                  child: Text(
                    (widget.event.promoter?.name ?? ''),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ticket Limit',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  widget.event.ticketLimit?.info ?? '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Promoters',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                for (
                  var index = 0;
                  index < (widget.event.promoters ?? []).length;
                  index++
                )
                  ListTile(
                    leading: Icon(Icons.circle, size: 10),
                    title: Text(
                      (widget.event.promoters ?? [])[index].name ?? '',
                      style: TextStyle(
                        color:
                            (isDarkMode(context))
                                ? injector.palette.pureWhite
                                : injector.palette.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            Gap(15.hh(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ticket Limit',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  widget.event.ticketLimit?.info ?? '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  widget.event.info ?? '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(15.hh(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Important Info',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  widget.event.pleaseNote ?? '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(15),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.ww(context),
                vertical: 16.hh(context),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      (isDarkMode(context))
                          ? injector.palette.pureWhite
                          : injector.palette.textColor,
                ),
                borderRadius: BorderRadius.circular(16.ww(context)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Venue',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                    ),
                  ),
                  Text(
                    '${widget.event.embedded?.venues?.first.name ?? ''}, ${widget.event.embedded?.venues?.first.address?.line1 ?? ''},  ${widget.event.embedded?.venues?.first.city?.name ?? ''}, ${widget.event.embedded?.venues?.first.country?.name ?? ''}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                    ),
                  ),
                  Gap(25.hh(context)),
                  Text(
                    'SiteMap',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: widget.event.seatmap?.staticUrl ?? '',
                    fit: BoxFit.fill,

                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                  ),
                  Gap(15),
                  Text(
                    'Direction Map',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color:
                          (isDarkMode(context))
                              ? injector.palette.pureWhite
                              : injector.palette.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 300.hh(context),
                    width: double.maxFinite,
                    child: OpenMapScreen(
                      lat: double.parse(
                        widget
                                .event
                                .embedded
                                ?.venues
                                ?.first
                                .location
                                ?.latitude ??
                            '0.0',
                      ),
                      long: double.parse(
                        widget
                                .event
                                .embedded
                                ?.venues
                                ?.first
                                .location
                                ?.longitude ??
                            '0.0',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(16),
            MainButton(
              text: 'Buy Ticket Now',
              onTap: () {
                context.push('/ticketPurchase', extra: widget.event.url);
              },
              height: 50,
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Accessible Seating Detail',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget
                          .event
                          .embedded
                          ?.venues
                          ?.first
                          .accessibleSeatingDetail ??
                      '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Parking Details',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.event.embedded?.venues?.first.parkingDetail ?? '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General Infomation',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${widget.event.embedded?.venues?.first.generalInfo?.generalRule ?? ''} \n\n${widget.event.embedded?.venues?.first.generalInfo?.childRule ?? ''}',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number Detail',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget
                          .event
                          .embedded
                          ?.venues
                          ?.first
                          .boxOfficeInfo
                          ?.phoneNumberDetail ??
                      '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Open Hours Detail',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget
                          .event
                          .embedded
                          ?.venues
                          ?.first
                          .boxOfficeInfo
                          ?.openHoursDetail ??
                      '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Accepted Payment Detail',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget
                          .event
                          .embedded
                          ?.venues
                          ?.first
                          .boxOfficeInfo
                          ?.acceptedPaymentDetail ??
                      '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Will Call Detail',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget
                          .event
                          .embedded
                          ?.venues
                          ?.first
                          .boxOfficeInfo
                          ?.willCallDetail ??
                      '',
                  style: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(80),
          ],
        ),
      ),
    );
  }
}
