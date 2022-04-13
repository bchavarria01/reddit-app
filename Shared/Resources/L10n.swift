// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Allow
  internal static let allowButtonText = L10n.tr("Localizable", "allowButtonText")
  /// Please allow access to your camera to take photos
  internal static let cameraAccessDescription = L10n.tr("Localizable", "cameraAccessDescription")
  /// Camera Access
  internal static let cameraAccessTitle = L10n.tr("Localizable", "cameraAccessTitle")
  /// Cancel
  internal static let cancelButtonText = L10n.tr("Localizable", "cancelButtonText")
  /// Sorry, there are no results for this search. Please try another phrase
  internal static let emptyStateDesctiption = L10n.tr("Localizable", "emptyStateDesctiption")
  /// No Results
  internal static let emptyStateTitle = L10n.tr("Localizable", "emptyStateTitle")
  /// Enable
  internal static let enableButtonText = L10n.tr("Localizable", "enableButtonText")
  /// We wants to access your location only to provide a better experience by helping you find new friends nearby.
  internal static let enableLocationDescription = L10n.tr("Localizable", "enableLocationDescription")
  /// Enable location services
  internal static let enableLocationTitle = L10n.tr("Localizable", "enableLocationTitle")
  /// Enable push notifications to let \nsend you personal news and updates.
  internal static let enablePushNotificationsDescription = L10n.tr("Localizable", "enablePushNotificationsDescription")
  /// Enable push notifications
  internal static let enablePushNotificationsTitle = L10n.tr("Localizable", "enablePushNotificationsTitle")
  /// Search
  internal static let searchText = L10n.tr("Localizable", "searchText")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
