// Mocks generated by Mockito 5.4.4 from annotations
// in xandr_ios/test/xandr_ios_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:xandr_ios/src/messages.g.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [XandrHostApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockXandrHostApi extends _i1.Mock implements _i2.XandrHostApi {
  @override
  _i3.Future<bool> initXandrSdk({
    required int? memberId,
    int? publisherId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initXandrSdk,
          [],
          {
            #memberId: memberId,
            #publisherId: publisherId,
          },
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> loadInterstitialAd({
    required int? widgetId,
    String? placementID,
    String? inventoryCode,
    Map<String?, List<String?>?>? customKeywords,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadInterstitialAd,
          [],
          {
            #widgetId: widgetId,
            #placementID: placementID,
            #inventoryCode: inventoryCode,
            #customKeywords: customKeywords,
          },
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> showInterstitialAd({int? autoDismissDelay}) =>
      (super.noSuchMethod(
        Invocation.method(
          #showInterstitialAd,
          [],
          {#autoDismissDelay: autoDismissDelay},
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setPublisherUserId(String? publisherUserId) =>
      (super.noSuchMethod(
        Invocation.method(
          #setPublisherUserId,
          [publisherUserId],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<String> initMultiAdRequest() => (super.noSuchMethod(
        Invocation.method(
          #initMultiAdRequest,
          [],
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #initMultiAdRequest,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #initMultiAdRequest,
            [],
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<bool> disposeMultiAdRequest(String? multiAdRequestID) =>
      (super.noSuchMethod(
        Invocation.method(
          #disposeMultiAdRequest,
          [multiAdRequestID],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> loadAdsForMultiAdRequest(String? multiAdRequestID) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAdsForMultiAdRequest,
          [multiAdRequestID],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> loadAd({required int? widgetId}) => (super.noSuchMethod(
        Invocation.method(
          #loadAd,
          [],
          {#widgetId: widgetId},
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<String> getPublisherUserId() => (super.noSuchMethod(
        Invocation.method(
          #getPublisherUserId,
          [],
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getPublisherUserId,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getPublisherUserId,
            [],
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<bool> setUserIds(List<_i2.HostAPIUserId?>? userIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #setUserIds,
          [userIds],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<List<_i2.HostAPIUserId?>> getUserIds() => (super.noSuchMethod(
        Invocation.method(
          #getUserIds,
          [],
        ),
        returnValue:
            _i3.Future<List<_i2.HostAPIUserId?>>.value(<_i2.HostAPIUserId?>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i2.HostAPIUserId?>>.value(<_i2.HostAPIUserId?>[]),
      ) as _i3.Future<List<_i2.HostAPIUserId?>>);

  @override
  _i3.Future<bool> setGDPRConsentRequired(bool? isConsentRequired) =>
      (super.noSuchMethod(
        Invocation.method(
          #setGDPRConsentRequired,
          [isConsentRequired],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setGDPRConsentString(String? consentString) =>
      (super.noSuchMethod(
        Invocation.method(
          #setGDPRConsentString,
          [consentString],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setGDPRPurposeConsents(String? purposeConsents) =>
      (super.noSuchMethod(
        Invocation.method(
          #setGDPRPurposeConsents,
          [purposeConsents],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
