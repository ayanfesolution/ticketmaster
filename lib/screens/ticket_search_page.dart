import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketSearchPage extends StatefulHookConsumerWidget {
  const TicketSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketSearchPageState();
}

class _TicketSearchPageState extends ConsumerState<TicketSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
