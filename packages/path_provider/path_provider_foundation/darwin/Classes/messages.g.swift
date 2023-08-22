// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v10.1.3), do not edit directly.
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
  return [result]
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

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum DirectoryType: Int {
  case applicationDocuments = 0
  case applicationSupport = 1
  case downloads = 2
  case library = 3
  case temp = 4
  case applicationCache = 5
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol PathProviderApi {
  func getDirectoryPath(type: DirectoryType) throws -> String?
  func getContainerPath(appGroupIdentifier: String) throws -> String?
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PathProviderApiSetup {
  /// The codec used by PathProviderApi.
  /// Sets up an instance of `PathProviderApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PathProviderApi?) {
    let getDirectoryPathChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.PathProviderApi.getDirectoryPath", binaryMessenger: binaryMessenger)
    if let api = api {
      getDirectoryPathChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let typeArg = DirectoryType(rawValue: args[0] as! Int)!
        do {
          let result = try api.getDirectoryPath(type: typeArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getDirectoryPathChannel.setMessageHandler(nil)
    }
    let getContainerPathChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.PathProviderApi.getContainerPath", binaryMessenger: binaryMessenger)
    if let api = api {
      getContainerPathChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let appGroupIdentifierArg = args[0] as! String
        do {
          let result = try api.getContainerPath(appGroupIdentifier: appGroupIdentifierArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getContainerPathChannel.setMessageHandler(nil)
    }
  }
}
