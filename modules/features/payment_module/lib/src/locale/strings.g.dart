/// Generated file. Do not edit.
///
/// Original: lib/src/locale
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 47
///
/// Built on 2025-02-23 at 18:36 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.id;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.id) // set locale
/// - Locale locale = AppLocale.id.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.id) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	id(languageCode: 'id', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of locale).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = locale.someKey.anotherKey;
/// String b = locale['someKey.anotherKey']; // Only for edge cases!
Translations get locale => LocaleSettings.instance.currentTranslations;

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
/// final locale = Translations.of(context); // Get locale variable.
/// String a = locale.someKey.anotherKey; // Use locale variable.
/// String b = locale['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.locale.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get locale => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final locale = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsGeneralId general = _StringsGeneralId._(_root);
	late final _StringsPartnerListPageId partnerListPage = _StringsPartnerListPageId._(_root);
	late final _StringsPaymentDetailPageId paymentDetailPage = _StringsPaymentDetailPageId._(_root);
	late final _StringsBankAccountFormPageId bankAccountFormPage = _StringsBankAccountFormPageId._(_root);
	late final _StringsListBankPageId listBankPage = _StringsListBankPageId._(_root);
	late final _StringsPaymentMethodPageId paymentMethodPage = _StringsPaymentMethodPageId._(_root);
	late final _StringsPendingPaymentPageId pendingPaymentPage = _StringsPendingPaymentPageId._(_root);
	late final _StringsSuccessPaymentPageId successPaymentPage = _StringsSuccessPaymentPageId._(_root);
}

// Path: general
class _StringsGeneralId {
	_StringsGeneralId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralLabelsId labels = _StringsGeneralLabelsId._(_root);
	late final _StringsGeneralButtonsId buttons = _StringsGeneralButtonsId._(_root);
}

// Path: partnerListPage
class _StringsPartnerListPageId {
	_StringsPartnerListPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pilih Mitra';
	late final _StringsPartnerListPageLabelsId labels = _StringsPartnerListPageLabelsId._(_root);
	late final _StringsPartnerListPagePlaceholdersId placeholders = _StringsPartnerListPagePlaceholdersId._(_root);
}

// Path: paymentDetailPage
class _StringsPaymentDetailPageId {
	_StringsPaymentDetailPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pembayaran Invoice';
	late final _StringsPaymentDetailPageLabelsId labels = _StringsPaymentDetailPageLabelsId._(_root);
	late final _StringsPaymentDetailPagePlaceholdersId placeholders = _StringsPaymentDetailPagePlaceholdersId._(_root);
	late final _StringsPaymentDetailPageButtonsId buttons = _StringsPaymentDetailPageButtonsId._(_root);
}

// Path: bankAccountFormPage
class _StringsBankAccountFormPageId {
	_StringsBankAccountFormPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Tambah Rekening';
	late final _StringsBankAccountFormPageLabelsId labels = _StringsBankAccountFormPageLabelsId._(_root);
	late final _StringsBankAccountFormPagePlaceholdersId placeholders = _StringsBankAccountFormPagePlaceholdersId._(_root);
	late final _StringsBankAccountFormPageButtonsId buttons = _StringsBankAccountFormPageButtonsId._(_root);
	late final _StringsBankAccountFormPageMessagesId messages = _StringsBankAccountFormPageMessagesId._(_root);
}

// Path: listBankPage
class _StringsListBankPageId {
	_StringsListBankPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Bank Penerima';
	late final _StringsListBankPagePlaceholdersId placeholders = _StringsListBankPagePlaceholdersId._(_root);
}

// Path: paymentMethodPage
class _StringsPaymentMethodPageId {
	_StringsPaymentMethodPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pilih Metode Pembayaran';
	late final _StringsPaymentMethodPageLabelsId labels = _StringsPaymentMethodPageLabelsId._(_root);
	late final _StringsPaymentMethodPageButtonsId buttons = _StringsPaymentMethodPageButtonsId._(_root);
}

// Path: pendingPaymentPage
class _StringsPendingPaymentPageId {
	_StringsPendingPaymentPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Kirim Pembayaran';
	late final _StringsPendingPaymentPageLabelsId labels = _StringsPendingPaymentPageLabelsId._(_root);
	late final _StringsPendingPaymentPageButtonsId buttons = _StringsPendingPaymentPageButtonsId._(_root);
}

// Path: successPaymentPage
class _StringsSuccessPaymentPageId {
	_StringsSuccessPaymentPageId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Rincian Pembayaran';
	late final _StringsSuccessPaymentPageLabelsId labels = _StringsSuccessPaymentPageLabelsId._(_root);
	late final _StringsSuccessPaymentPageButtonsId buttons = _StringsSuccessPaymentPageButtonsId._(_root);
}

// Path: general.labels
class _StringsGeneralLabelsId {
	_StringsGeneralLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get emptyData => 'Tidak ada data';
}

// Path: general.buttons
class _StringsGeneralButtonsId {
	_StringsGeneralButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get retry => 'Coba Lagi';
	String get copyText => 'Salin';
	String get share => 'Bagikan';
	String get download => 'Unduh';
}

// Path: partnerListPage.labels
class _StringsPartnerListPageLabelsId {
	_StringsPartnerListPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get target => 'Kirim Pembayaran Kepada:';
}

// Path: partnerListPage.placeholders
class _StringsPartnerListPagePlaceholdersId {
	_StringsPartnerListPagePlaceholdersId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get findPartner => 'Cari mitra Anda';
}

// Path: paymentDetailPage.labels
class _StringsPaymentDetailPageLabelsId {
	_StringsPaymentDetailPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get receiverInfo => 'Informasi Penerima';
	String get receiverBankInfo => 'Informasi Bank Penerima';
	String get selectNotificationMethod => 'Pilih Metode Notifikasi';
	String notificationMethodDesc({required Object value}) => 'Mitra akan menerima notifikasi pembayaran melalui ${value}';
	String get paymentAmount => 'Jumlah Pembayaran';
	String get notes => 'Berita Acara';
	String get addBankAccountInfo => 'Silahkan tambahkan rekening untuk melanjutkan bayar invoice.';
	String accountName({required Object value}) => 'a.n. ${value}';
	String get total => 'Total';
}

// Path: paymentDetailPage.placeholders
class _StringsPaymentDetailPagePlaceholdersId {
	_StringsPaymentDetailPagePlaceholdersId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get sampleAmount => '1.000.000';
	String get sampleNotes => 'cth. Biaya Perbaikan sepeda';
}

// Path: paymentDetailPage.buttons
class _StringsPaymentDetailPageButtonsId {
	_StringsPaymentDetailPageButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get addBankAccount => 'Tambah Rekening';
	String get next => 'Selanjutnya';
}

// Path: bankAccountFormPage.labels
class _StringsBankAccountFormPageLabelsId {
	_StringsBankAccountFormPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get bankName => 'Bank Penerima';
	String get accountNumber => 'Nomor Rekening Penerima';
	String get accountName => 'Nama Pemilik Rekening';
}

// Path: bankAccountFormPage.placeholders
class _StringsBankAccountFormPagePlaceholdersId {
	_StringsBankAccountFormPagePlaceholdersId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get selectBank => 'Pilih Bank Penerima';
	String get sampleAccountNumber => 'cth. 687654321';
	String get sampleAccountName => 'cth. Sunter';
}

// Path: bankAccountFormPage.buttons
class _StringsBankAccountFormPageButtonsId {
	_StringsBankAccountFormPageButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get saveAccount => 'Simpan Rekening';
}

// Path: bankAccountFormPage.messages
class _StringsBankAccountFormPageMessagesId {
	_StringsBankAccountFormPageMessagesId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get validationSuccess => 'Nama pemilik rekening berhasil ditemukan';
}

// Path: listBankPage.placeholders
class _StringsListBankPagePlaceholdersId {
	_StringsListBankPagePlaceholdersId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get findBank => 'Cari nama bank';
}

// Path: paymentMethodPage.labels
class _StringsPaymentMethodPageLabelsId {
	_StringsPaymentMethodPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get totalPayment => 'Total Pembayaran';
}

// Path: paymentMethodPage.buttons
class _StringsPaymentMethodPageButtonsId {
	_StringsPaymentMethodPageButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get next => 'Lanjutkan';
}

// Path: pendingPaymentPage.labels
class _StringsPendingPaymentPageLabelsId {
	_StringsPendingPaymentPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get transferTo => 'Lakukan Transfer ke';
	String get totalPayment => 'Total Pembayaran';
}

// Path: pendingPaymentPage.buttons
class _StringsPendingPaymentPageButtonsId {
	_StringsPendingPaymentPageButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get confirmPayment => 'Saya Sudah Bayar';
}

// Path: successPaymentPage.labels
class _StringsSuccessPaymentPageLabelsId {
	_StringsSuccessPaymentPageLabelsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get paymentSuccess => 'Pembayaran Berhasil';
	String get paymentMethod => 'Pembayaran Via';
	String get paymentDetail => 'Rincian Pembayaran';
	String get paymentCompleted => 'Dana Diteruskan ';
}

// Path: successPaymentPage.buttons
class _StringsSuccessPaymentPageButtonsId {
	_StringsSuccessPaymentPageButtonsId._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get seeStatus => 'Lihat Detail Status';
	String get newPayment => 'Buat pembayaran Baru';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.labels.emptyData': return 'Tidak ada data';
			case 'general.buttons.retry': return 'Coba Lagi';
			case 'general.buttons.copyText': return 'Salin';
			case 'general.buttons.share': return 'Bagikan';
			case 'general.buttons.download': return 'Unduh';
			case 'partnerListPage.title': return 'Pilih Mitra';
			case 'partnerListPage.labels.target': return 'Kirim Pembayaran Kepada:';
			case 'partnerListPage.placeholders.findPartner': return 'Cari mitra Anda';
			case 'paymentDetailPage.title': return 'Pembayaran Invoice';
			case 'paymentDetailPage.labels.receiverInfo': return 'Informasi Penerima';
			case 'paymentDetailPage.labels.receiverBankInfo': return 'Informasi Bank Penerima';
			case 'paymentDetailPage.labels.selectNotificationMethod': return 'Pilih Metode Notifikasi';
			case 'paymentDetailPage.labels.notificationMethodDesc': return ({required Object value}) => 'Mitra akan menerima notifikasi pembayaran melalui ${value}';
			case 'paymentDetailPage.labels.paymentAmount': return 'Jumlah Pembayaran';
			case 'paymentDetailPage.labels.notes': return 'Berita Acara';
			case 'paymentDetailPage.labels.addBankAccountInfo': return 'Silahkan tambahkan rekening untuk melanjutkan bayar invoice.';
			case 'paymentDetailPage.labels.accountName': return ({required Object value}) => 'a.n. ${value}';
			case 'paymentDetailPage.labels.total': return 'Total';
			case 'paymentDetailPage.placeholders.sampleAmount': return '1.000.000';
			case 'paymentDetailPage.placeholders.sampleNotes': return 'cth. Biaya Perbaikan sepeda';
			case 'paymentDetailPage.buttons.addBankAccount': return 'Tambah Rekening';
			case 'paymentDetailPage.buttons.next': return 'Selanjutnya';
			case 'bankAccountFormPage.title': return 'Tambah Rekening';
			case 'bankAccountFormPage.labels.bankName': return 'Bank Penerima';
			case 'bankAccountFormPage.labels.accountNumber': return 'Nomor Rekening Penerima';
			case 'bankAccountFormPage.labels.accountName': return 'Nama Pemilik Rekening';
			case 'bankAccountFormPage.placeholders.selectBank': return 'Pilih Bank Penerima';
			case 'bankAccountFormPage.placeholders.sampleAccountNumber': return 'cth. 687654321';
			case 'bankAccountFormPage.placeholders.sampleAccountName': return 'cth. Sunter';
			case 'bankAccountFormPage.buttons.saveAccount': return 'Simpan Rekening';
			case 'bankAccountFormPage.messages.validationSuccess': return 'Nama pemilik rekening berhasil ditemukan';
			case 'listBankPage.title': return 'Bank Penerima';
			case 'listBankPage.placeholders.findBank': return 'Cari nama bank';
			case 'paymentMethodPage.title': return 'Pilih Metode Pembayaran';
			case 'paymentMethodPage.labels.totalPayment': return 'Total Pembayaran';
			case 'paymentMethodPage.buttons.next': return 'Lanjutkan';
			case 'pendingPaymentPage.title': return 'Kirim Pembayaran';
			case 'pendingPaymentPage.labels.transferTo': return 'Lakukan Transfer ke';
			case 'pendingPaymentPage.labels.totalPayment': return 'Total Pembayaran';
			case 'pendingPaymentPage.buttons.confirmPayment': return 'Saya Sudah Bayar';
			case 'successPaymentPage.title': return 'Rincian Pembayaran';
			case 'successPaymentPage.labels.paymentSuccess': return 'Pembayaran Berhasil';
			case 'successPaymentPage.labels.paymentMethod': return 'Pembayaran Via';
			case 'successPaymentPage.labels.paymentDetail': return 'Rincian Pembayaran';
			case 'successPaymentPage.labels.paymentCompleted': return 'Dana Diteruskan ';
			case 'successPaymentPage.buttons.seeStatus': return 'Lihat Detail Status';
			case 'successPaymentPage.buttons.newPayment': return 'Buat pembayaran Baru';
			default: return null;
		}
	}
}
