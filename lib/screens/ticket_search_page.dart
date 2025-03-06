import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/provider/ticket/ticket_provider.dart';
import 'package:ticketmaster/screens/home_page.dart';
import 'package:ticketmaster/utils/constants.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';
import 'package:ticketmaster/utils/injector.dart';

class TicketSearchPage extends StatefulHookConsumerWidget {
  const TicketSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketSearchPageState();
}

class _TicketSearchPageState extends ConsumerState<TicketSearchPage> {
  @override
  Widget build(BuildContext context) {
    var listOfEvents = useState<List<Event>>(
      ref.read(ticketProvider).events ?? [],
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.ww(context)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    listOfEvents.value = ref.read(ticketProvider).events ?? [];
                  } else {
                    List<Event> newEventList =
                        ref.read(ticketProvider).events ?? [];
                    List<Event> filterList =
                        newEventList
                            .where(
                              (element) => ((element.name ?? '').toLowerCase())
                                  .contains(value.toLowerCase()),
                            )
                            .toList();
                    listOfEvents.value = filterList;
                  }
                },
                style: TextStyle(
                  color:
                      (isDarkMode(context))
                          ? injector.palette.pureWhite
                          : injector.palette.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                decoration: InputDecoration(
                  labelText: 'Search Events',
                  labelStyle: TextStyle(
                    color:
                        (isDarkMode(context))
                            ? injector.palette.pureWhite
                            : injector.palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),

                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listOfEvents.value.length,
                itemBuilder: (context, index) {
                  Event event = listOfEvents.value[index];

                  return ListTile(
                    onTap: () {
                      context.push('/ticketDetails', extra: event);
                    },
                    leading: ProfilePicture(
                      imageUrl: event.images?.first.url ?? '',
                    ),

                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Venue',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '${event.embedded?.venues?.first.name ?? ''}, ${event.embedded?.venues?.first.address?.line1 ?? ''},  ${event.embedded?.venues?.first.city?.name ?? ''}, ${event.embedded?.venues?.first.country?.name ?? ''}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(10.ww(context)),
                            SizedBox(
                              width: 100.ww(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date and Time',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '${(event.dates?.start?.localDate ?? DateTime.now()).day}:${(event.dates?.start?.localDate ?? DateTime.now()).month}:${(event.dates?.start?.localDate ?? DateTime.now()).year} : (${(event.dates?.start?.dateTime ?? DateTime.now()).hour} : ${(event.dates?.start?.dateTime ?? DateTime.now()).minute})',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
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
