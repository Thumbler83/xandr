// Mocks generated by Mockito 5.4.4 from annotations
// in xandr/test/xandr_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter/services.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:xandr_platform_interface/src/method_channel.dart' as _i3;
import 'package:xandr_platform_interface/xandr_platform_interface.dart' as _i5;

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

class _FakeMethodChannel_0 extends _i1.SmartFake implements _i2.MethodChannel {
  _FakeMethodChannel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MethodChannelXandr].
///
/// See the documentation for Mockito's code generation for more information.
class MockMethodChannelXandr extends _i1.Mock
    implements _i3.MethodChannelXandr {
  @override
  _i2.MethodChannel get methodChannel => (super.noSuchMethod(
        Invocation.getter(#methodChannel),
        returnValue: _FakeMethodChannel_0(
          this,
          Invocation.getter(#methodChannel),
        ),
        returnValueForMissingStub: _FakeMethodChannel_0(
          this,
          Invocation.getter(#methodChannel),
        ),
      ) as _i2.MethodChannel);

  @override
  _i4.Future<bool> init(int? memberId) => (super.noSuchMethod(
        Invocation.method(
          #init,
          [memberId],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> loadInterstitialAd(
    String? placementID,
    String? inventoryCode,
    Map<String, String>? customKeywords,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadInterstitialAd,
          [
            placementID,
            inventoryCode,
            customKeywords,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> showInterstitialAd(Duration? autoDismissDelay) =>
      (super.noSuchMethod(
        Invocation.method(
          #showInterstitialAd,
          [autoDismissDelay],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  void registerEventStream(
          {required _i4.StreamController<_i5.BannerAdEvent>? controller}) =>
      super.noSuchMethod(
        Invocation.method(
          #registerEventStream,
          [],
          {#controller: controller},
        ),
        returnValueForMissingStub: null,
      );
}
