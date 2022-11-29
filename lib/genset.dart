import 'package:flutter/material.dart';
import 'trs.g.dart';
import 'main.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Genset extends StatefulWidget {
  const Genset({Key? key, required this.genset}) : super(key: key);
  final Map genset;

  @override
  State<Genset> createState() => _Genset();
}

class _Genset extends State<Genset> {
  final _formKey = GlobalKey<FormState>();
  bool darktheme = false, autotheme = true, light = false, vibtarc = true;
  String ringtar = 'n', locale = 'en', ringrepeat = '';
  double vibtar = 200;

  void updateset(t) async {
    final prefs = await SharedPreferences.getInstance();
    if (t == 'darktheme') {
      prefs.setBool('darktheme', darktheme);
    } else if (t == 'autotheme') {
      prefs.setBool('autotheme', autotheme);
    } else if (t == 'ringtar') {
      prefs.setString('ringtar', ringtar);
    } else if (t == 'ringrepeat') {
      prefs.setInt('ringrepeat', int.parse(ringrepeat));
    } else if (t == 'vibtar') {
      prefs.setInt('vibtar', vibtar.toInt());
    } else if (t == 'vibtarc') {
      prefs.setBool('vibtarc', vibtarc);
    } else if (t == 'locale') {
      prefs.setString('locale', locale);
    }
    //debugPrint('updategenset: $t');
  }

  List<DropdownMenuItem<String>> get localeitems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("English"), value: "en"),
      const DropdownMenuItem(child: Text("Bahasa Indonesia"), value: "id"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get ringitems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text(t.genset.off), value: "off"),
      DropdownMenuItem(child: Text(t.genset.alarm), value: "a"),
      DropdownMenuItem(child: Text(t.genset.notif), value: "n"),
      DropdownMenuItem(child: Text(t.genset.ring), value: "r"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get repeatitems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text(t.genset.once), value: "1"),
      DropdownMenuItem(child: Text(t.genset.s5), value: "5"),
      DropdownMenuItem(child: Text(t.genset.s10), value: "10"),
      DropdownMenuItem(child: Text(t.genset.s30), value: "30"),
      DropdownMenuItem(child: Text(t.genset.m1), value: "60"),
    ];
    return menuItems;
  }

  bool init = true;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    // final fsize = theme.textTheme.bodyMedium!.fontSize ?? 20;
    final psize = sqrt(swidth * sheight) / 200; //uk

    if (init) {
      init = false;
      autotheme = widget.genset['autotheme'];
      if (autotheme == true) {
        darktheme = false;
      } else {
        darktheme = widget.genset['darktheme'];
      }
      if (darktheme == false && autotheme == false) light = true;
      vibtar = widget.genset['vibtar'];
      ringtar = widget.genset['ringtar'];
      ringrepeat = widget.genset['ringrepeat'].toString();
      locale = (widget.genset['locale'] == '') ? 'en' : widget.genset['locale'];
    }

    return Form(
        key: _formKey,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(t.genset.genset),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(2 * psize),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: EdgeInsets.only(top: 4 * psize, bottom: 2 * psize, left: 2 * psize),
                      child: Text(t.genset.language)),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 4 * psize, left: 6 * psize, right: 8 * psize),
                      child: DropdownButtonFormField(
                          value: locale,
                          onChanged: (String? newValue) {
                            Ringme(newValue!, false);
                            setState(() {
                              locale = newValue;
                              updateset('locale');
                            });
                          },
                          items: localeitems)),
                  Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))),
                  Padding(
                      padding: EdgeInsets.only(top: 6 * psize, bottom: 2 * psize, left: 2 * psize),
                      child: Text(t.genset.dark)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4 * psize),
                      child: SwitchListTile(
                        title: Text(t.genset.fol),
                        value: autotheme,
                        onChanged: (bool? value) {
                          setState(() {
                            autotheme = value!;
                            if (autotheme == true) {
                              darktheme = false;
                              light = false;
                            } else if (darktheme == false && light == false) {
                              darktheme = false;
                              light = true;
                            }
                            updateset('darktheme');
                            updateset('autotheme');
                          });
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4 * psize),
                      child: SwitchListTile(
                        title: Text(t.genset.dark),
                        value: darktheme,
                        onChanged: (bool? value) {
                          setState(() {
                            darktheme = value!;
                            if (darktheme == true) {
                              updateset('autotheme');
                              autotheme = false;
                              light = false;
                            } else {
                              light = true;
                            }
                            updateset('darktheme');
                          });
                        },
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 4 * psize, right: 4 * psize, bottom: 4 * psize),
                      child: SwitchListTile(
                        title: Text(t.genset.light),
                        value: light,
                        onChanged: (bool? value) {
                          setState(() {
                            light = value!;
                            if (light == true) {
                              updateset('autotheme');
                              autotheme = false;
                              darktheme = false;
                            } else {
                              darktheme = true;
                            }
                            updateset('darktheme');
                          });
                        },
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))),
                  Padding(
                      padding: EdgeInsets.only(left: 2 * psize, top: 6 * psize, bottom: psize),
                      child: Text(t.genset.onov)),
                  Padding(
                      padding: EdgeInsets.only(left: 6 * psize, top: 4 * psize, bottom: psize),
                      child: Text(t.genset.play)),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 4 * psize, left: 6 * psize, right: 8 * psize),
                      child: DropdownButtonFormField(
                          value: ringtar,
                          onChanged: (String? newValue) {
                            Ringme(newValue!, false);
                            setState(() {
                              ringtar = newValue;
                              updateset('ringtar');
                            });
                          },
                          items: ringitems)),
                  Padding(
                      padding: EdgeInsets.only(left: 6 * psize, top: 4 * psize, bottom: psize),
                      child: Text(t.genset.repeat)),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 4 * psize, left: 6 * psize, right: 8 * psize),
                      child: DropdownButtonFormField(
                          value: ringrepeat,
                          onChanged: (String? newValue) {
                            setState(() {
                              ringrepeat = newValue!;
                              updateset('ringrepeat');
                            });
                          },
                          items: repeatitems)),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 4 * psize, right: 6 * psize, top: 0, bottom: psize),
                    child: SwitchListTile(
                      title: Text(
                        t.genset.vib,
                      ),
                      value: vibtarc,
                      onChanged: (bool value) {
                        setState(() {
                          vibtarc = value;
                          updateset('vibtarc');
                        });
                      },
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 4 * psize, left: 4 * psize, right: 4 * psize),
                      child: Slider(
                        value: vibtar,
                        max: 1200,
                        min: 100,
                        divisions: 11,
                        label: vibtar.round().toString() + ' ms',
                        onChanged: (vibtarc == true)
                            ? (double value) {
                                setState(() {
                                  vibtar = value;
                                });
                                //debugPrint('$vibtar');
                              }
                            : null,
                        onChangeEnd: (getar) {
                          Vibme(getar.toInt());
                          updateset('vibtar');
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 4 * psize),
                      child: Center(
                          child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {});
                          }
                          Ringme('', false);

                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2 * psize),
                          child: Text(
                            t.halsetting.save,
                          ),
                        ),
                      )))
                ]))));
  }
}
