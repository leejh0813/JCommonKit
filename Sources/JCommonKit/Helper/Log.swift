//
//  Log.swift
//  DailyInsights
//
//  Created by 이재홍 on 8/17/24.
//

import Foundation

public enum LogLevel: String {
    /// 디버그
    case debug = "DEBUG"
    /// 일반 정보
    case info = "INFO"
    /// 워닝
    case warning = "WARNING"
    /// 에러
    case error = "ERROR"
    /// 중요 정보
    case important = "IMPORTANT"
    
    var imoji: String {
        switch self {
        case .debug: return ""
        case .info: return ""
        case .warning: return ""
        case .error: return "❗️"
        case .important: return "❤️"
        }
    }
}

public func log(
    _ message: String,
    _ level: LogLevel,
    file: String = #file,
    line: Int = #line,
    function: String = #function
) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    
    print("[\(timestamp)][\(level.imoji)\(level.rawValue)][\(fileName):\(line)] \(message)")
}

public func log(
    _ message: String,
    level: LogLevel,
    file: String = #file,
    line: Int = #line,
    function: String = #function
) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    
    print("[\(timestamp)][\(level.imoji)\(level.rawValue)][\(fileName):\(line)] \(message)")
}
