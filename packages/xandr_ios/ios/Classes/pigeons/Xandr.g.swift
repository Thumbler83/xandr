// Autogenerated from Pigeon (v17.1.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  [result]
}

private func wrapError(_ error: Any) -> [Any?] {
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

private func isNullish(_ value: Any?) -> Bool {
  value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol XandrHostApi {
  func init(memberId: Int64, completion: @escaping (Result<Bool, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class XandrHostApiSetup {
  /// The codec used by XandrHostApi.
  /// Sets up an instance of `XandrHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: XandrHostApi?) {
    let initChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.xandr_ios.XandrHostApi.init",
      binaryMessenger: binaryMessenger
    )
    if let api {
      initChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let memberIdArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        api.init(memberId: memberIdArg) { result in
          switch result {
          case let .success(res):
            reply(wrapResult(res))
          case let .failure(error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      initChannel.setMessageHandler(nil)
    }
  }
}
