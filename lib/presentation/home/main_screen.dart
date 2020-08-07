import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/models/channel.dart';
import 'package:stockton/presentation/home/home_screen.dart';
import 'package:stockton/presentation/home/main_screen_view_model.dart';
import 'package:stockton/presentation/home/slide_out_screen.dart';
import 'package:stockton/redux/app_state.dart';

///
/// This screen loads the HomeScreen when there's data loaded
/// to avoid things like having null User, null Channel, etc.
///
/// Also holds the ValueNotifier for the side open/closed state
/// as it passes it to the SlideOut widget and the HomeScreen.
///
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<bool> _sideOpenController;

  @override
  void initState() {
    super.initState();
    _sideOpenController = ValueNotifier<bool>(false);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainScreenViewModel>(
      distinct: true,
      converter: MainScreenViewModel.fromStore,
      builder: (context, vm) {
        if (vm.hasData) {
          return SlideOutScreen(
            main: HomeScreen(sideOpenController: _sideOpenController),
            side: _buildDetails(vm),
            sideOpenController: _sideOpenController,
          );
        }
      },
    );
  }
}

Widget _buildDetails(MainScreenViewModel viewModel) {
  switch (viewModel.channelType) {
    case ChannelType.TOPIC:
      return TopicDetails(
        sideOpenController: _sideOpenController,
      );
    case ChannelType.EVENT:
      return EventDetails(
        sideOpenController: _sideOpenController,
      );
  }
  return null;
}
