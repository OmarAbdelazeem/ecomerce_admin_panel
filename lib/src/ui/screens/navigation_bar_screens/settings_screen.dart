import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/language_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin {
  final languageNotifier = getItInstance<LanguageNotifier>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            adminProfilePhoto(),
            SizedBox(
              height: 15,
            ),
            optionItem(getTranslated(context, languageNotifier.languageOption!.name),
                chooseLanguageDialogue, Icon(Icons.language)),
            SizedBox(
              height: 15,
            ),
            optionItem(getTranslated(context, StringsConstants.changePassword),
                () {}, Icon(Icons.lock)),
            SizedBox(
              height: 15,
            ),
            optionItem(
                getTranslated(context, StringsConstants.logout),
                () {},
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                Colors.red),
          ],
        ),
      ),
    );
  }

  Widget adminProfilePhoto() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              'O',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              'Omar Abdelazeem',
                              style: AppTextStyles.medium22Black,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.mode_edit,
                                  color: Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  // Navigator.of(context).pushNamed(
                                  //     Routes
                                  //         .addUserDetailScreen,
                                  //     arguments:
                                  //     AddUserDetailScreenArguments(
                                  //         newAddress:
                                  //         false));
                                })
                          ],
                        ),
                        Text(
                          '+201092476084',
                          style: AppTextStyles.normal14Color4C4C6F,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget optionItem(String? title, Function()? onTap, Icon? icon,
      [Color? textColor]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            icon!,
            SizedBox(
              width: 10,
            ),
            Text(
              title!,
              style: TextStyle(fontSize: 17, color: textColor ?? Colors.black),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void chooseLanguageDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            void onLanguageOptionChanged(LanguageModel? value) {
              setState(() {
                languageNotifier.languageOption = value;
              });
            }

            languageRadioButton(LanguageModel languageModel) {
              return ListTile(
                title: Text(getTranslated(context, languageModel.name)!),
                leading: Radio(
                  value: languageModel,
                  groupValue: languageNotifier.languageOption,
                  onChanged: onLanguageOptionChanged,
                ),
              );
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title:
                  Text(getTranslated(context, StringsConstants.choosePhoto)!),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    languageRadioButton(LanguageModel.languageList()[0]),
                    languageRadioButton(LanguageModel.languageList()[1]),
                    ElevatedButton(
                      onPressed: () {
                        changeLanguage(context, languageNotifier.languageOption);
                        Navigator.pop(context);
                      },
                      child: Text(getTranslated(
                          context, StringsConstants.changeLanguage)!),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
