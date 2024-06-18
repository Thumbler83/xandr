// Autogenerated from Pigeon (v19.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
  }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> PigeonError {
  PigeonError(
    code: "channel-error",
    message: "Unable to establish connection on channel: '\(channelName)'.",
    details: ""
  )
}

private func isNullish(_ value: Any?) -> Bool {
  value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum HostAPIUserIdSource: Int {
  case criteo = 0
  case theTradeDesk = 1
  case netId = 2
  case liveramp = 3
  case uid2 = 4
}

/// Generated class from Pigeon that represents data sent in messages.
struct HostAPIUserId {
  var source: HostAPIUserIdSource
  var userId: String

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> HostAPIUserId? {
    let source = HostAPIUserIdSource(rawValue: __pigeon_list[0] as! Int)!
    let userId = __pigeon_list[1] as! String

    return HostAPIUserId(
      source: source,
      userId: userId
    )
  }

  func toList() -> [Any?] {
    [
      source.rawValue,
      userId,
    ]
  }
}

private class XandrHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return HostAPIUserId.fromList(readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class XandrHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? HostAPIUserId {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class XandrHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    XandrHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    XandrHostApiCodecWriter(data: data)
  }
}

class XandrHostApiCodec: FlutterStandardMessageCodec {
  static let shared = XandrHostApiCodec(readerWriter: XandrHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol XandrHostApi {
  func initXandrSdk(memberId: Int64, completion: @escaping (Result<Bool, Error>) -> Void)
  func loadInterstitialAd(widgetId: Int64, placementID: String?, inventoryCode: String?,
                          customKeywords: [String: [String]]?,
                          completion: @escaping (Result<Bool, Error>) -> Void)
  func showInterstitialAd(autoDismissDelay: Int64?,
                          completion: @escaping (Result<Bool, Error>) -> Void)
  func setPublisherUserId(publisherUserId: String,
                          completion: @escaping (Result<Bool, Error>) -> Void)
  func initMultiAdRequest(completion: @escaping (Result<String, Error>) -> Void)
  func disposeMultiAdRequest(multiAdRequestID: String,
                             completion: @escaping (Result<Bool, Error>) -> Void)
  func loadAdsForMultiAdRequest(multiAdRequestID: String,
                                completion: @escaping (Result<Bool, Error>) -> Void)
  func getPublisherUserId(completion: @escaping (Result<String, Error>) -> Void)
  func setUserIds(userIds: [HostAPIUserId], completion: @escaping (Result<Bool, Error>) -> Void)
  func getUserIds(completion: @escaping (Result<[HostAPIUserId], Error>) -> Void)
  func setGDPRConsentRequired(isConsentRequired: Bool,
                              completion: @escaping (Result<Bool, Error>) -> Void)
  func setGDPRConsentString(consentString: String,
                            completion: @escaping (Result<Bool, Error>) -> Void)
  func setGDPRPurposeConsents(purposeConsents: String,
                              completion: @escaping (Result<Bool, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class XandrHostApiSetup {
  /// The codec used by XandrHostApi.
  static var codec: FlutterStandardMessageCodec { XandrHostApiCodec.shared }
  /// Sets up an instance of `XandrHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: XandrHostApi?,
                    messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let initXandrSdkChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.initXandrSdk\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      initXandrSdkChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let memberIdArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        api.initXandrSdk(memberId: memberIdArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      initXandrSdkChannel.setMessageHandler(nil)
    }
    let loadInterstitialAdChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.loadInterstitialAd\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      loadInterstitialAdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let widgetIdArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let placementIDArg: String? = nilOrValue(args[1])
        let inventoryCodeArg: String? = nilOrValue(args[2])
        let customKeywordsArg: [String: [String]]? = nilOrValue(args[3])
        api.loadInterstitialAd(
          widgetId: widgetIdArg,
          placementID: placementIDArg,
          inventoryCode: inventoryCodeArg,
          customKeywords: customKeywordsArg
        ) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      loadInterstitialAdChannel.setMessageHandler(nil)
    }
    let showInterstitialAdChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.showInterstitialAd\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      showInterstitialAdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let autoDismissDelayArg: Int64? = isNullish(args[0]) ? nil :
          (args[0] is Int64? ? args[0] as! Int64? : Int64(args[0] as! Int32))
        api.showInterstitialAd(autoDismissDelay: autoDismissDelayArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      showInterstitialAdChannel.setMessageHandler(nil)
    }
    let setPublisherUserIdChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.setPublisherUserId\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      setPublisherUserIdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let publisherUserIdArg = args[0] as! String
        api.setPublisherUserId(publisherUserId: publisherUserIdArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setPublisherUserIdChannel.setMessageHandler(nil)
    }
    let initMultiAdRequestChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.initMultiAdRequest\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      initMultiAdRequestChannel.setMessageHandler { _, reply in
        api.initMultiAdRequest { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      initMultiAdRequestChannel.setMessageHandler(nil)
    }
    let disposeMultiAdRequestChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.disposeMultiAdRequest\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      disposeMultiAdRequestChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let multiAdRequestIDArg = args[0] as! String
        api.disposeMultiAdRequest(multiAdRequestID: multiAdRequestIDArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      disposeMultiAdRequestChannel.setMessageHandler(nil)
    }
    let loadAdsForMultiAdRequestChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.loadAdsForMultiAdRequest\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      loadAdsForMultiAdRequestChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let multiAdRequestIDArg = args[0] as! String
        api.loadAdsForMultiAdRequest(multiAdRequestID: multiAdRequestIDArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      loadAdsForMultiAdRequestChannel.setMessageHandler(nil)
    }
    let getPublisherUserIdChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.getPublisherUserId\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      getPublisherUserIdChannel.setMessageHandler { _, reply in
        api.getPublisherUserId { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      getPublisherUserIdChannel.setMessageHandler(nil)
    }
    let setUserIdsChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.setUserIds\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      setUserIdsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userIdsArg = args[0] as! [HostAPIUserId]
        api.setUserIds(userIds: userIdsArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setUserIdsChannel.setMessageHandler(nil)
    }
    let getUserIdsChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.getUserIds\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      getUserIdsChannel.setMessageHandler { _, reply in
        api.getUserIds { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      getUserIdsChannel.setMessageHandler(nil)
    }
    let setGDPRConsentRequiredChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.setGDPRConsentRequired\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      setGDPRConsentRequiredChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let isConsentRequiredArg = args[0] as! Bool
        api.setGDPRConsentRequired(isConsentRequired: isConsentRequiredArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setGDPRConsentRequiredChannel.setMessageHandler(nil)
    }
    let setGDPRConsentStringChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.setGDPRConsentString\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      setGDPRConsentStringChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let consentStringArg = args[0] as! String
        api.setGDPRConsentString(consentString: consentStringArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setGDPRConsentStringChannel.setMessageHandler(nil)
    }
    let setGDPRPurposeConsentsChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.setGDPRPurposeConsents\(channelSuffix)",
      binaryMessenger: binaryMessenger,
      codec: codec
    )
    if let api {
      setGDPRPurposeConsentsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let purposeConsentsArg = args[0] as! String
        api.setGDPRPurposeConsents(purposeConsents: purposeConsentsArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setGDPRPurposeConsentsChannel.setMessageHandler(nil)
    }
  }
}

/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol XandrFlutterApiProtocol {
  func onAdLoaded(viewId viewIdArg: Int64, width widthArg: Int64, height heightArg: Int64,
                  creativeId creativeIdArg: String, adType adTypeArg: String,
                  tagId tagIdArg: String, auctionId auctionIdArg: String, cpm cpmArg: Double,
                  memberId memberIdArg: Int64,
                  completion: @escaping (Result<Void, PigeonError>) -> Void)
  func onAdLoadedError(viewId viewIdArg: Int64, reason reasonArg: String,
                       completion: @escaping (Result<Void, PigeonError>) -> Void)
  func onNativeAdLoaded(viewId viewIdArg: Int64, title titleArg: String,
                        description descriptionArg: String, imageUrl imageUrlArg: String,
                        completion: @escaping (Result<Void, PigeonError>) -> Void)
  func onNativeAdLoadedError(viewId viewIdArg: Int64, reason reasonArg: String,
                             completion: @escaping (Result<Void, PigeonError>) -> Void)
}

class XandrFlutterApi: XandrFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }

  func onAdLoaded(viewId viewIdArg: Int64, width widthArg: Int64, height heightArg: Int64,
                  creativeId creativeIdArg: String, adType adTypeArg: String,
                  tagId tagIdArg: String, auctionId auctionIdArg: String, cpm cpmArg: Double,
                  memberId memberIdArg: Int64,
                  completion: @escaping (Result<Void, PigeonError>) -> Void) {
    let channelName =
      "dev.flutter.pigeon.xandr_ios.XandrFlutterApi.onAdLoaded\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([
      viewIdArg,
      widthArg,
      heightArg,
      creativeIdArg,
      adTypeArg,
      tagIdArg,
      auctionIdArg,
      cpmArg,
      memberIdArg,
    ] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(PigeonError(code: code, message: message, details: details)))
      } else {
        completion(.success(()))
      }
    }
  }

  func onAdLoadedError(viewId viewIdArg: Int64, reason reasonArg: String,
                       completion: @escaping (Result<Void, PigeonError>) -> Void) {
    let channelName =
      "dev.flutter.pigeon.xandr_ios.XandrFlutterApi.onAdLoadedError\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([viewIdArg, reasonArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(PigeonError(code: code, message: message, details: details)))
      } else {
        completion(.success(()))
      }
    }
  }

  func onNativeAdLoaded(viewId viewIdArg: Int64, title titleArg: String,
                        description descriptionArg: String, imageUrl imageUrlArg: String,
                        completion: @escaping (Result<Void, PigeonError>) -> Void) {
    let channelName =
      "dev.flutter.pigeon.xandr_ios.XandrFlutterApi.onNativeAdLoaded\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([viewIdArg, titleArg, descriptionArg, imageUrlArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(PigeonError(code: code, message: message, details: details)))
      } else {
        completion(.success(()))
      }
    }
  }

  func onNativeAdLoadedError(viewId viewIdArg: Int64, reason reasonArg: String,
                             completion: @escaping (Result<Void, PigeonError>) -> Void) {
    let channelName =
      "dev.flutter.pigeon.xandr_ios.XandrFlutterApi.onNativeAdLoadedError\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([viewIdArg, reasonArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(PigeonError(code: code, message: message, details: details)))
      } else {
        completion(.success(()))
      }
    }
  }
}
