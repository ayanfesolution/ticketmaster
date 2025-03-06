import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/model/ticket_model.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/provider/ticket/ticket_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  static final fullPath = '/homepage';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadMoreTickets();
    }
  }

  void _loadMoreTickets() {
    print('doning anothre call');
    // Call the network request to fetch more tickets
    //ref.read(ticketProvider.notifier).loadMore();
  }

  @override
  Widget build(BuildContext context) {
    TicketModel ticketModel = ref.watch(ticketProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Master',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController, // Attach the ScrollController
        itemCount: (ticketModel.events ?? []).length,
        itemBuilder: (context, index) {
          Event event = (ticketModel.events ?? [])[index];

          return ListTile(
            leading: ProfilePicture(imageUrl: event.images?.first.url ?? ''),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, this.imageUrl, this.size = 50.0});

  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        size / 2,
      ), // Half of size for circular effect
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        width: size.ww(context),
        height: size.hh(context),
        fit: BoxFit.cover, // Ensure the image covers the area
        placeholder:
            (context, url) => const CircularProgressIndicator.adaptive(),
        errorWidget:
            (context, url, error) => CircleAvatar(
              backgroundImage: AssetImage(' Assets.images.avatarEmma.path'),
            ),
      ),
    );
  }
}
