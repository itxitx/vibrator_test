
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 128 (64.0 per locale)
 *
 * Built on 2022-10-26 at 14:48 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	id, // 'id'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TrsEn _t = _currLocale.translations;
_TrsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TrsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _TrsEn _translationsEn = _TrsEn.build();
late _TrsId _translationsId = _TrsId.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_TrsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.id: return _translationsId;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_TrsEn build() {
		switch (this) {
			case AppLocale.en: return _TrsEn.build();
			case AppLocale.id: return _TrsId.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.id: return 'id';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.id: return const Locale.fromSubtags(languageCode: 'id');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'id': return AppLocale.id;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _TrsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _TrsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TrsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _TrsEn _root = this; // ignore: unused_field

	// Translations
	late final _TrsMainEn main = _TrsMainEn._(_root);
	late final _TrsGensetEn genset = _TrsGensetEn._(_root);
	late final _TrsHalsettingEn halsetting = _TrsHalsettingEn._(_root);
	late final _TrsStopEn stop = _TrsStopEn._(_root);
}

// Path: main
class _TrsMainEn {
	_TrsMainEn._(this._root);

	final _TrsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Money Stopwatch';
	String get nostop => 'No stopwatch saved, please add a stopwatch using + button';
	String get every => 'Every';
	String get overtime => 'Overtime';
	String get ovstart => 'Overtime Start';
	String get second => 'second';
	String get seconds => 'seconds';
	String get minute => 'minute';
	String get minutes => 'minutes';
	String get hour => 'hour';
	String get hours => 'hours';
	String get paused => 'Paused at';
	String get ongoing => 'Ongoing. Started at';
	String get stoppr => 'Stopped. Previous record';
	String get stopped => 'Stopped';
}

// Path: genset
class _TrsGensetEn {
	_TrsGensetEn._(this._root);

	final _TrsEn _root; // ignore: unused_field

	// Translations
	String get off => 'Off';
	String get alarm => 'Use Alarm';
	String get notif => 'Use Notification';
	String get ring => 'Use Ringtone';
	String get once => 'Play Once';
	String get s5 => 'Play 5 seconds';
	String get s10 => 'Play 10 seconds';
	String get s30 => 'Play 30 seconds';
	String get m1 => 'Play 1 minute';
	String get genset => 'General Setting';
	String get language => 'Language';
	String get dark => 'Always Use Dark Theme';
	String get fol => 'Follows system settings';
	String get light => 'Always Use Light Theme';
	String get onov => 'When Entering Overtime';
	String get play => 'Play sound';
	String get repeat => 'Repeat Sound';
	String get vib => 'Vibrate';
}

// Path: halsetting
class _TrsHalsettingEn {
	_TrsHalsettingEn._(this._root);

	final _TrsEn _root; // ignore: unused_field

	// Translations
	String get stopset => 'Stopwatch Settings';
	String get adstop => 'Add New Stopwatch';
	String get del => 'Delete This Stopwatch';
	String get conf => 'Are you sure?';
	String get dele => 'Delete';
	String get no => 'No';
	String get yes => 'Yes';
	String get enter => 'Enter the title';
	String get second => 'Second';
	String get minute => 'Minute';
	String get hour => 'Hour';
	String get cursim => 'Currency symbol';
	String get monval => 'Money value';
	String get imov => 'Implement Overtime';
	String get ovstart => 'Overtime Start Time';
	String get min => 'Min';
	String get sec => 'Sec';
	String get ovmonval => 'Overtime Money Value';
	String get incmon => 'Increment Money/Value Every';
	String get errors => 'Error, please enter overtime start time';
	String get errorn => 'Error, please enter non zero values';
	String get save => 'Save';
}

// Path: stop
class _TrsStopEn {
	_TrsStopEn._(this._root);

	final _TrsEn _root; // ignore: unused_field

	// Translations
	String get startfrom => 'Start from';
	String get prevrec => 'Previous record';
	String get started => 'Started';
	String get paused => 'Paused';
	String get resumed => 'Resumed';
	String get resetbut => 'Reset Stopwatch';
	String get playbut => 'Start Stopwatch';
	String get pausebut => 'Pause Stopwatch';
	String get lapbut => 'Make a Lap';
}

// Path: <root>
class _TrsId implements _TrsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TrsId.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _TrsId _root = this; // ignore: unused_field

	// Translations
	@override late final _TrsMainId main = _TrsMainId._(_root);
	@override late final _TrsGensetId genset = _TrsGensetId._(_root);
	@override late final _TrsHalsettingId halsetting = _TrsHalsettingId._(_root);
	@override late final _TrsStopId stop = _TrsStopId._(_root);
}

// Path: main
class _TrsMainId implements _TrsMainEn {
	_TrsMainId._(this._root);

	@override final _TrsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Stopwatch Uang';
	@override String get nostop => 'Tidak ada stopwatch tersimpan, silahkan menambahkan stopwatch dengan mengetuk tombol +';
	@override String get every => 'tiap';
	@override String get overtime => 'Overtime';
	@override String get ovstart => 'Overtime Mulai';
	@override String get second => 'detik';
	@override String get seconds => 'detik';
	@override String get minute => 'menit';
	@override String get minutes => 'menit';
	@override String get hour => 'jam';
	@override String get hours => 'jam';
	@override String get paused => 'Dijeda pada';
	@override String get ongoing => 'Berlangsung. Dimulai pada';
	@override String get stoppr => 'Berhenti. Catatan sebelumnya';
	@override String get stopped => 'Berhenti';
}

// Path: genset
class _TrsGensetId implements _TrsGensetEn {
	_TrsGensetId._(this._root);

	@override final _TrsId _root; // ignore: unused_field

	// Translations
	@override String get off => 'Matikan';
	@override String get alarm => 'Gunakan Alarm';
	@override String get notif => 'Gunakan Notifikasi';
	@override String get ring => 'Gunakan Nada Dering';
	@override String get once => 'Putar Sekali';
	@override String get s5 => 'Putar 5 detik';
	@override String get s10 => 'Putar 10 detik';
	@override String get s30 => 'Putar 30 detik';
	@override String get m1 => 'Putar 1 menit';
	@override String get genset => 'Pengaturan Umum';
	@override String get language => 'Language';
	@override String get dark => 'Selalu Gunakan Tema Gelap';
	@override String get fol => 'Ikuti/sesuai pengaturan di perangkat';
	@override String get light => 'Selalu Gunakan Tema Terang';
	@override String get onov => 'Ketika Masuk Overtime';
	@override String get play => 'Putar Suara';
	@override String get repeat => 'Ulangi Suara';
	@override String get vib => 'Getar';
}

// Path: halsetting
class _TrsHalsettingId implements _TrsHalsettingEn {
	_TrsHalsettingId._(this._root);

	@override final _TrsId _root; // ignore: unused_field

	// Translations
	@override String get stopset => 'Pengaturan Stopwatch';
	@override String get adstop => 'Tambahkan Stopwatch Baru';
	@override String get del => 'Hapus Stopwatch Ini';
	@override String get conf => 'Anda yakin?';
	@override String get dele => 'Hapus';
	@override String get no => 'Tidak';
	@override String get yes => 'Ya';
	@override String get enter => 'Masukkan Judul';
	@override String get second => 'Detik';
	@override String get minute => 'Menit';
	@override String get hour => 'Jam';
	@override String get cursim => 'Simbol mata uang';
	@override String get monval => 'Nilai uang';
	@override String get imov => 'Ada Overtime';
	@override String get ovstart => 'Waktu Masuk Overtime';
	@override String get min => 'Menit';
	@override String get sec => 'Detik';
	@override String get ovmonval => 'Nilai Uang Overtime';
	@override String get incmon => 'Kenaikan nilai uang tiap';
	@override String get errors => 'Kesalahan, masukkan waktu masuk overtime';
	@override String get errorn => 'Kesalahan, masukkan nilai lebih dari nol';
	@override String get save => 'Simpan';
}

// Path: stop
class _TrsStopId implements _TrsStopEn {
	_TrsStopId._(this._root);

	@override final _TrsId _root; // ignore: unused_field

	// Translations
	@override String get startfrom => 'Mulai dari';
	@override String get prevrec => 'Catatan sebelumnya';
	@override String get started => 'Dimulai';
	@override String get paused => 'Dijeda';
	@override String get resumed => 'Dilanjutkan';
	@override String get resetbut => 'Reset Stopwatch';
	@override String get playbut => 'Mulai Stopwatch';
	@override String get pausebut => 'Jeda Stopwatch';
	@override String get lapbut => 'Buat putaran';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TrsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'main.title': 'Money Stopwatch',
			'main.nostop': 'No stopwatch saved, please add a stopwatch using + button',
			'main.every': 'Every',
			'main.overtime': 'Overtime',
			'main.ovstart': 'Overtime Start',
			'main.second': 'second',
			'main.seconds': 'seconds',
			'main.minute': 'minute',
			'main.minutes': 'minutes',
			'main.hour': 'hour',
			'main.hours': 'hours',
			'main.paused': 'Paused at',
			'main.ongoing': 'Ongoing. Started at',
			'main.stoppr': 'Stopped. Previous record',
			'main.stopped': 'Stopped',
			'genset.off': 'Off',
			'genset.alarm': 'Use Alarm',
			'genset.notif': 'Use Notification',
			'genset.ring': 'Use Ringtone',
			'genset.once': 'Play Once',
			'genset.s5': 'Play 5 seconds',
			'genset.s10': 'Play 10 seconds',
			'genset.s30': 'Play 30 seconds',
			'genset.m1': 'Play 1 minute',
			'genset.genset': 'General Setting',
			'genset.language': 'Language',
			'genset.dark': 'Always Use Dark Theme',
			'genset.fol': 'Follows system settings',
			'genset.light': 'Always Use Light Theme',
			'genset.onov': 'When Entering Overtime',
			'genset.play': 'Play sound',
			'genset.repeat': 'Repeat Sound',
			'genset.vib': 'Vibrate',
			'halsetting.stopset': 'Stopwatch Settings',
			'halsetting.adstop': 'Add New Stopwatch',
			'halsetting.del': 'Delete This Stopwatch',
			'halsetting.conf': 'Are you sure?',
			'halsetting.dele': 'Delete',
			'halsetting.no': 'No',
			'halsetting.yes': 'Yes',
			'halsetting.enter': 'Enter the title',
			'halsetting.second': 'Second',
			'halsetting.minute': 'Minute',
			'halsetting.hour': 'Hour',
			'halsetting.cursim': 'Currency symbol',
			'halsetting.monval': 'Money value',
			'halsetting.imov': 'Implement Overtime',
			'halsetting.ovstart': 'Overtime Start Time',
			'halsetting.min': 'Min',
			'halsetting.sec': 'Sec',
			'halsetting.ovmonval': 'Overtime Money Value',
			'halsetting.incmon': 'Increment Money/Value Every',
			'halsetting.errors': 'Error, please enter overtime start time',
			'halsetting.errorn': 'Error, please enter non zero values',
			'halsetting.save': 'Save',
			'stop.startfrom': 'Start from',
			'stop.prevrec': 'Previous record',
			'stop.started': 'Started',
			'stop.paused': 'Paused',
			'stop.resumed': 'Resumed',
			'stop.resetbut': 'Reset Stopwatch',
			'stop.playbut': 'Start Stopwatch',
			'stop.pausebut': 'Pause Stopwatch',
			'stop.lapbut': 'Make a Lap',
		};
	}
}

extension on _TrsId {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'main.title': 'Stopwatch Uang',
			'main.nostop': 'Tidak ada stopwatch tersimpan, silahkan menambahkan stopwatch dengan mengetuk tombol +',
			'main.every': 'tiap',
			'main.overtime': 'Overtime',
			'main.ovstart': 'Overtime Mulai',
			'main.second': 'detik',
			'main.seconds': 'detik',
			'main.minute': 'menit',
			'main.minutes': 'menit',
			'main.hour': 'jam',
			'main.hours': 'jam',
			'main.paused': 'Dijeda pada',
			'main.ongoing': 'Berlangsung. Dimulai pada',
			'main.stoppr': 'Berhenti. Catatan sebelumnya',
			'main.stopped': 'Berhenti',
			'genset.off': 'Matikan',
			'genset.alarm': 'Gunakan Alarm',
			'genset.notif': 'Gunakan Notifikasi',
			'genset.ring': 'Gunakan Nada Dering',
			'genset.once': 'Putar Sekali',
			'genset.s5': 'Putar 5 detik',
			'genset.s10': 'Putar 10 detik',
			'genset.s30': 'Putar 30 detik',
			'genset.m1': 'Putar 1 menit',
			'genset.genset': 'Pengaturan Umum',
			'genset.language': 'Language',
			'genset.dark': 'Selalu Gunakan Tema Gelap',
			'genset.fol': 'Ikuti/sesuai pengaturan di perangkat',
			'genset.light': 'Selalu Gunakan Tema Terang',
			'genset.onov': 'Ketika Masuk Overtime',
			'genset.play': 'Putar Suara',
			'genset.repeat': 'Ulangi Suara',
			'genset.vib': 'Getar',
			'halsetting.stopset': 'Pengaturan Stopwatch',
			'halsetting.adstop': 'Tambahkan Stopwatch Baru',
			'halsetting.del': 'Hapus Stopwatch Ini',
			'halsetting.conf': 'Anda yakin?',
			'halsetting.dele': 'Hapus',
			'halsetting.no': 'Tidak',
			'halsetting.yes': 'Ya',
			'halsetting.enter': 'Masukkan Judul',
			'halsetting.second': 'Detik',
			'halsetting.minute': 'Menit',
			'halsetting.hour': 'Jam',
			'halsetting.cursim': 'Simbol mata uang',
			'halsetting.monval': 'Nilai uang',
			'halsetting.imov': 'Ada Overtime',
			'halsetting.ovstart': 'Waktu Masuk Overtime',
			'halsetting.min': 'Menit',
			'halsetting.sec': 'Detik',
			'halsetting.ovmonval': 'Nilai Uang Overtime',
			'halsetting.incmon': 'Kenaikan nilai uang tiap',
			'halsetting.errors': 'Kesalahan, masukkan waktu masuk overtime',
			'halsetting.errorn': 'Kesalahan, masukkan nilai lebih dari nol',
			'halsetting.save': 'Simpan',
			'stop.startfrom': 'Mulai dari',
			'stop.prevrec': 'Catatan sebelumnya',
			'stop.started': 'Dimulai',
			'stop.paused': 'Dijeda',
			'stop.resumed': 'Dilanjutkan',
			'stop.resetbut': 'Reset Stopwatch',
			'stop.playbut': 'Mulai Stopwatch',
			'stop.pausebut': 'Jeda Stopwatch',
			'stop.lapbut': 'Buat putaran',
		};
	}
}
