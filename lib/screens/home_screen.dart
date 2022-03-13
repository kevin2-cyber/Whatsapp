import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/constants-and-themes/constants_themes.dart';
import 'package:whatsapp_clone/screens/screens.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: const <Icon>[
              Icon(
                  Icons.search,
                color: WhatsAppTheme.kdarkTextThemeColor,
              ),
              Icon(
                  Icons.more_vert,
                color: WhatsAppTheme.kdarkTextThemeColor,
              ),
            ],
            backgroundColor: WhatsAppTheme.kdarkAppBarColor,
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                      'Chats',
                    style: GoogleFonts.poppins(
                      color: WhatsAppTheme.kdarkTextThemeColor,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                      'Status',
                    style: GoogleFonts.poppins(
                      color: WhatsAppTheme.kdarkTextThemeColor,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Calls',
                    style: GoogleFonts.poppins(
                      color: WhatsAppTheme.kdarkTextThemeColor,
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              WhatsAppConstants.title,
              style: GoogleFonts.poppins(
                color: WhatsAppTheme.kdarkTextThemeColor,
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              ChatScreen(),
              StatusScreen(),
              CallScreen(),
            ],
          ),
      floatingActionButton: _bottomButtons(),
    );
  }
  Widget _bottomButtons() {
    return _tabController.index == 0
        ? FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: (){},
        backgroundColor: WhatsAppTheme.kfabColor,
        child: const Icon(
          Icons.message,
          size: 20.0,
          color: Colors.white,
        ))
         ? _tabController.index == 1
        ? FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: () {},
      backgroundColor: WhatsAppTheme.kfabColor,
      child: const Icon(
        Icons.edit,
        size: 20.0,
        color: Colors.white,
      ))
    : FloatingActionButton(
    shape: const StadiumBorder(),
    onPressed: () {},
    backgroundColor: Colors.redAccent,
    child: const Icon(
    Icons.height,
    size: 20.0,
    ),
    );
  }
}
