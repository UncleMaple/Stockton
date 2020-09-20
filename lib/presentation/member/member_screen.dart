import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockton/presentation/common/common_app_bar.dart';
import 'package:stockton/presentation/common/error_label_text_form_field.dart';
import 'package:stockton/presentation/common/modal_item.dart';
import 'package:stockton/presentation/common/profile_avatar.dart';
import 'package:stockton/presentation/common/round_button.dart';
import 'package:stockton/presentation/member/member_screen_view_model.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/attachment/attachment_actions.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/theme.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  bool _editMode = false;
  final _controllerNickname = TextEditingController();
  final _controllerStatus = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _controllerNickname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int memberId = ModalRoute.of(context).settings.arguments;

    return StoreConnector<AppState, MemberScreenViewModel>(
      builder: (context, vm) => _buildScaffold(context, vm),
      converter: MemberScreenViewModel.fromStore(memberId),
      distinct: true,
      onInitialBuild: _setInitialEditState,
    );
  }

  Scaffold _buildScaffold(BuildContext context, MemberScreenViewModel vm) {
    return Scaffold(
      appBar: CommonAppBar(
        title: vm.member.nickname,
        leftAction: _buildLeftAction(vm),
        action: _buildRightAction(vm),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _buildMemberAvatar(vm),
            ...buildMemberSection(vm),
            ..._buildEditSection(vm),
            _buildDirectMessageButton(vm, context),
            _buildLogoutButton(vm, context),
          ],
        ),
      ),
    );
  }

  _buildLeftAction(MemberScreenViewModel vm) =>
      _editMode ? _buildCancelButton(vm) : null;

  Widget _buildCancelButton(MemberScreenViewModel vm) {
    return FlatButton(
      onPressed: () {
        _setInitialEditState(vm);
        setState(() {
          _editMode = false;
        });
      },
      child: Text(
        "Cancel",
        style: AppTheme.buttonTextStyle,
      ),
    );
  }

  Widget _buildRightAction(MemberScreenViewModel vm) {
    return Visibility(
      visible: vm.isMe,
      child: AnimatedSwitcher(
        child: _editMode ? _buildSaveButton(vm) : _buildEditButton(vm),
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  FlatButton _buildSaveButton(MemberScreenViewModel vm) {
    return FlatButton(
      onPressed: () {
        setState(() {
          _validateAndSubmit(vm);
        });
      },
      child: Text(
        StocktonLocalizations.of(context).save,
        style: AppTheme.buttonTextStyle,
      ),
    );
  }

  FlatButton _buildEditButton(MemberScreenViewModel vm) {
    return FlatButton(
      onPressed: () {
        setState(() {
          _editMode = true;
        });
      },
      child: Text(
        StocktonLocalizations.of(context).edit,
        style: AppTheme.buttonTextStyle,
      ),
    );
  }

  void _setInitialEditState(MemberScreenViewModel vm) {
    _controllerNickname.text = vm.member.nickname;
  }

  void _validateAndSubmit(MemberScreenViewModel vm) {
    if (_formKey.currentState.validate()) {
      final completer = Completer();
      completer.future.whenComplete(() {
        setState(() {
          _editMode = false;
        });
      });
      vm.submit(
        vm.member.rebuild((m) => m..nickname = _controllerNickname.text),
        completer,
      );
    }
  }

  Widget _buildMemberAvatar(MemberScreenViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ProfileAvatar(
        imgUrl: vm.member.avatar,
        picIconButton: _buildPicIconButton(vm),
      ),
    );
  }

  Widget _buildPicIconButton(MemberScreenViewModel vm) {
    return Visibility(
      visible: vm.isMe,
      child: Material(
        color: AppTheme.colorShallowBlack,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        child: InkWell(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    onPressed: () {
                      _changeMemberAvatar(ImageSource.gallery, context, vm);
                    },
                    child: ModalItem(
                      label:
                          StocktonLocalizations.of(context).attachModalGallery,
                      iconData: Icons.photo,
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      _changeMemberAvatar(ImageSource.camera, context, vm);
                    },
                    child: ModalItem(
                      label:
                          StocktonLocalizations.of(context).attachModalCamera,
                      iconData: Icons.camera_alt,
                    ),
                  ),
                ],
              ),
            );
          },
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                color: AppTheme.colorBrightWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _changeMemberAvatar(ImageSource source, BuildContext context,
      MemberScreenViewModel vm) async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(source: source);
    StoreProvider.of<AppState>(context).dispatch(ChangeAvatarAction(
      file: File(imageFile.path),
      member: vm.member,
    ));
    await Navigator.of(context).maybePop();
  }

  List<Widget> buildMemberSection(MemberScreenViewModel vm) {
    if (_editMode) return [];
    return [
      Text(
        vm.member.nickname,
        style: AppTheme.messageAuthorNameTextStyle,
        textAlign: TextAlign.center,
      )
    ];
  }

  List<Widget> _buildEditSection(MemberScreenViewModel vm) {
    if (!_editMode) return [];
    return [
      Padding(
        padding: const EdgeInsets.all(AppTheme.appMargin),
        child: ErrorLabelTextFormField(
          labelText: StocktonLocalizations.of(context).userEditNameLabel,
          helperText: StocktonLocalizations.of(context).userEditNameHelper,
          maxCharacters: 30,
          controller: _controllerNickname,
          validator: (value) {
            if (value.isEmpty) {
              return StocktonLocalizations.of(context).userEditNameError;
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(AppTheme.appMargin),
        child: ErrorLabelTextFormField(
          labelText: StocktonLocalizations.of(context).userEditStatusLabel,
          helperText: StocktonLocalizations.of(context).userEditStatusHelper,
          controller: _controllerStatus,
          maxCharacters: 200,
          validator: (value) {
            return null;
          },
        ),
      )
    ];
  }

  Visibility _buildDirectMessageButton(MemberScreenViewModel vm, context) {
    return Visibility(
      visible: !vm.isMe,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.appMargin),
        child: Center(
          child: RoundButton(
            text: StocktonLocalizations.of(context).sendDirectMessage,
            onTap: () {
              showPlatformDialog(
                context: context,
                builder: (_) => PlatformAlertDialog(
                  title: Text(
                      StocktonLocalizations.of(context).genericSoonAlertTitle),
                  content: Text(StocktonLocalizations.of(context)
                      .genericSoonAlertMessage),
                  actions: <Widget>[
                    PlatformDialogAction(
                        child: PlatformText(
                            StocktonLocalizations.of(context).cancel),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(MemberScreenViewModel vm, context) {
    return Visibility(
      visible: vm.isMe && !_editMode,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.appMargin),
        child: Center(
          child: RoundButton(
            text: "Logout",
            onTap: () {
              showPlatformDialog(
                context: context,
                builder: (context) => PlatformAlertDialog(
                  content: Text(StocktonLocalizations.of(context).logOut),
                  actions: <Widget>[
                    PlatformDialogAction(
                      child: PlatformText(
                          StocktonLocalizations.of(context).cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    PlatformDialogAction(
                      child: PlatformText(
                          StocktonLocalizations.of(context).logOut),
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(LogOutAction());
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
} // end class
