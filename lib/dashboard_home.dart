import 'package:flutter/material.dart';
import 'package:revision_master/commons/constants.dart';
import 'package:revision_master/state_management/provider/simple/simple_provider_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'commons/home_navigation_tile.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final Uri _url = Uri.parse(Constants.shubhamLinkedIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Flutter by Shubham'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.link),
                tooltip: 'Shubham Bane LinkedIn',
                onPressed: _launchUrl,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeNavigationTile(
                  title: "State Management",

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SimpleProviderView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
