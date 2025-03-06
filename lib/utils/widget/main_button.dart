import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticketmaster/utils/extension/auto_resize.dart';
import 'package:ticketmaster/utils/injector.dart';

class MainButton extends StatefulHookConsumerWidget {
  const MainButton({
    super.key,
    this.backgroundColor,
    this.cornerRadius = 16,
    this.borderColor,
    this.child,
    this.height = 30,
    this.elevation = 3,
    required this.text,
    this.textColor = Colors.white,
    this.useCustom = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color? backgroundColor;
  final double cornerRadius;
  final Color? borderColor;

  final double height;
  final double elevation;
  final Widget? child;
  final Function() onTap;

  @override
  ConsumerState<MainButton> createState() => _EpawooMainButtonState();
}

class _EpawooMainButtonState extends ConsumerState<MainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: injector.palette.primaryColor,

          borderRadius: BorderRadius.circular(widget.cornerRadius.hh(context)),
        ),
        height: (widget.height).hh(context),
        child: Center(
          child:
              widget.useCustom
                  ? widget.child
                  : Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
        ),
      ),
    );
  }
}
