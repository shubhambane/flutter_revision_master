import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:revision_master/core/contants.dart';
import 'package:url_launcher/url_launcher.dart';

class Myscaffold extends StatelessWidget {
  final String appBarText;
  final Widget scaffoldBody;
  final VoidCallback? fabOnPressed;
  final String? fabText;

  const Myscaffold({
    super.key,
    required this.appBarText,
    required this.scaffoldBody,
    this.fabOnPressed,
    this.fabText,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> launchMyUrl(String url) async {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $uri');
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(appBarText), centerTitle: false),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Center(child: scaffoldBody),
      ),
      floatingActionButton: fabText != null
          ? FloatingActionButton.extended(
              onPressed: fabOnPressed,
              label: Text(fabText ?? ""),
            )
          : SizedBox(),
      persistentFooterButtons: [
        Row(
          children: [
            Text(AppStrings.authorName),
            Spacer(),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedinIn),
              tooltip: '${AppStrings.authorName} LinkedIn',
              onPressed: () {
                launchMyUrl(AppStrings.linkedInUrl);
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.github),
              tooltip: '${AppStrings.authorName} Github',
              onPressed: () {
                launchMyUrl(AppStrings.githubUrl);
              },
            ),
          ],
        ),
      ],
    );
  }
}
