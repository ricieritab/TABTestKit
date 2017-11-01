//
//  App.swift
//  TABTestKit
//
//  The MIT License (MIT)
//
//  Created by Zachary Borrelli on 14/09/2017.
//  Copyright © 2017 The App Business LTD. All rights reserved.
//

import XCTest

/**
 Singleton in charge of creating XCUIApplication instance and managing the global app state,
 This is created so the same application instance can be used accross different pages of the app and
 the instance we are calling is the one that got launched.
 */
public final class App {
  
  public static let shared = App()
  
  fileprivate var currentApp: XCUIApplication?
  fileprivate var globalCalendar: Calendar = {
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    return cal
  }()
  
  fileprivate init () {}
  
  /// Function to terminate the currentApp singleton
  public func terminate() {
    currentApp?.terminate()
    currentApp = nil
  }
  
  /// Creates the currentApp instance and launches it
  public func launchWithOptions() {
    currentApp = XCUIApplication()
    currentApp?.launch()
  }
  
  /// Function that sets up and returns the singleton instance of the app
  ///
  /// - Returns: XCUIApplication object which serves as the current app under test
  public func current() -> XCUIApplication {
    if let app = currentApp {
      return app
    }
    let app = XCUIApplication()
    currentApp = app
    return app
  }
}