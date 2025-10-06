//
//  AppLog.swift
//  dragonfly
//
//  Created by Narayan Panthi on 10/1/25.
//

import Foundation
import Willow

import Foundation
import Willow

enum AppLog {
    private static let log = Logger(logLevels: [.all], writers: [ConsoleWriter()])

    static func showLog(_ message: @autoclosure @escaping () -> String) {
        log.debugMessage(message)
    }

    static func showInfo(_ message: @autoclosure @escaping () -> String) {
        log.infoMessage(message)
    }

    static func showWarning(_ message: @autoclosure @escaping () -> String) {
        log.warnMessage(message)
    }

    static func showError(_ message: @autoclosure @escaping () -> String) {
        log.errorMessage(message)
    }
}
