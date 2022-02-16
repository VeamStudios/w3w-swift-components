//
//  File.swift
//  
//
//  Created by Dave Duprey on 29/09/2020.
//

import W3WSwiftApi
import UIKit


/// mertic imperial or default from the system
public enum W3WMesurementSystem {
  case metric
  case imperial
  case system
}


public extension W3WSettings {

  static let W3WSwiftComponentsVersion = "2.2.2"
  
  // mutable settings
  static var measurement = W3WMesurementSystem.system
  static var leftToRight = (NSLocale.characterDirection(forLanguage: NSLocale.preferredLanguages.first ?? W3WSettings.defaultLanguage) == Locale.LanguageDirection.leftToRight)
  
  // MARK:- Colours
  
  static internal var colorPalette:W3WColorPalette =
    [
      "SlashesColor"        : [.light: W3WColorScheme.w3wRed],
      "DashesColor"         : [.light: W3WColorScheme.w3wSupportLightGrey],
      "CheckMarkColor"      : [.light: W3WColorScheme.w3wSecondaryGreen],
      "ErrorTextColor"      : [.light: W3WColorScheme.w3wRed,                 .dark: W3WColorScheme.w3wDarkBlue],
      "ErrorBackground"     : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.w3wSecondaryCoral],
      "WarningTextColor"    : [.light: W3WColorScheme.w3wRed,                 .dark: W3WColorScheme.w3wDarkBlue],
      "WarningBackground"   : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.w3wSecondaryCoral],
      "BorderColor"         : [.light: W3WColorScheme.w3wSupportMediumGrey],
      "SeparatorColor"      : [.light: W3WColorScheme.w3wSupportLightGrey,    .dark: W3WColorScheme.w3wSupportMediumGrey],
      "MicTextSecondary"    : [.light: W3WColorScheme.w3wSupportMediumGrey],
      "MicShadow"           : [.light: W3WColorScheme.w3wSupportDarkGrey],
      "CloseIconColor"      : [.light: W3WColorScheme.w3wBlack,               .dark: W3WColorScheme.w3wSupportMediumGrey],
      "MicTextColor"        : [.light: W3WColorScheme.w3wBlack,               .dark: W3WColorScheme.w3wWhite],
      "MicBackground"       : [.light: W3WColorScheme.componentOffWhite,      .dark: W3WColorScheme.w3wDarkBlue],
      "NearestPlaceColor"   : [.light: W3WColorScheme.componentSubheading,    .dark: W3WColorScheme.w3wSupportLightGrey],
      "AddressTextColor"    : [.light: W3WColorScheme.w3wDarkBlue,            .dark: W3WColorScheme.w3wWhite],
      "HighlightBacking"    : [.light: W3WColorScheme.w3wSecondaryLightBlue,  .dark: W3WColorScheme.w3wDarkBlue],
      "TableCellBacking"    : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.w3wBlack],
      "TextfieldText"       : [.light: W3WColorScheme.w3wBlack,               .dark: W3WColorScheme.w3wWhite],
      "TextfieldBackground" : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.componentOffBlack],
      "TextfieldPlaceholder": [.light: W3WColorScheme.w3wSupportMediumGrey,   .dark: W3WColorScheme.w3wSupportMediumGrey],
      "HintBackground"      : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.componentOffBlack],
      "HintTextColor"       : [.light: W3WColorScheme.w3wDarkBlue,            .dark: W3WColorScheme.w3wWhite],
      "HintTopLine"         : [.light: W3WColorScheme.w3wDarkBlue,            .dark: .clear],
      "MicOnColor"          : [.light: W3WColorScheme.w3wRed,                 .dark: W3WColorScheme.w3wRed],
      "MicOffColor"         : [.light: W3WColorScheme.w3wWhite,               .dark: W3WColorScheme.w3wWhite],
      "VoiceIconColor"      : [.light: W3WColorScheme.w3wBlack,               .dark: W3WColorScheme.w3wWhite],
      
      "MapGridColor"        : [.light: W3WColorScheme.w3wSupportMediumGrey,   .dark: W3WColorScheme.w3wSupportMediumGrey],
      "MapSquareColor"      : [.light: W3WColorScheme.w3wDarkBlue,            .dark: W3WColorScheme.w3wSupportLightGrey],
      "MapPinColor"         : [.light: W3WColorScheme.w3wDarkBlue,            .dark: W3WColorScheme.w3wRed]
    ]

  
  /// the colour information for all components
  static internal var colors = W3WColorScheme(colors: colorPalette)
  
  
  /// set a colour for a colour mode
  static func set(color: UIColor, named: String, forMode: W3WColourMode) {
    colorPalette[named]?[forMode] = color
  }
  
  
  /// return a color of a particular name, in the current colour mode (dark/light), failing that return in any colour mode, failing that, return black
  static func color(named: String) -> UIColor {
    return color(named: named, forMode: W3WColorScheme.colourMode)
  }

  
  /// return a color of a particular name, for a specific colour mode, if no such colour exists, return the light mode colour, failing that, return any colour for that name, failing that, return black
  static func color(named: String, forMode: W3WColourMode) -> UIColor {
    if let color = colorPalette[named]?[forMode] {
      return color
    } else {
      return (colorPalette[named]?[.light] ?? colorPalette[named]?.first?.value) ?? W3WColorScheme.w3wBlack
    }
  }
  
  
  // MARK: Text
  
  // text sizes
  static let componentsAddressTextSize    = CGFloat(18.0)
  static let componentsTableCellHeight    = CGFloat(64.0)
  static let componentsMaxTableHeight     = CGFloat(300.0)
  static let componentsTableTopMargin     = CGFloat(8.0)
  static let componentsSlashesIconSize    = CGFloat(100.0)
  static let componentsSlashesPadding     = CGFloat(10.0)
  static let componentsIconPadding        = CGFloat(10.0)
  static let componentsLogoSize           = CGFloat(64.0)
  static let componentsTextFieldWidth     = CGFloat(300.0)
  static let componentsTextFieldHeight    = CGFloat(48.0)

  // display text
  static let componentsPlaceholderText    = NSLocalizedString("input_hint",               bundle: Bundle.module, comment: "e.g. ///lock.spout.radar")
  static let componentsNearFormatText     = NSLocalizedString("near",                     bundle: Bundle.module, comment: "near %@")  // used to say NSLocalizedString("near %@", comment: "near %@"), but we need translations for this
  static let technicalErrorText           = NSLocalizedString("error_message", 	          bundle: Bundle.module, comment: "There was some technical problem")
  static let apiErrorText                 = NSLocalizedString("invalid_address_message",  bundle: Bundle.module, comment: "The API didn't have an answer for the given input")
  static let didYouMeanText               = NSLocalizedString("correction_message",       bundle: Bundle.module, comment: "Asks if the user meant to write a different addres that is presented below this text")
  
}
