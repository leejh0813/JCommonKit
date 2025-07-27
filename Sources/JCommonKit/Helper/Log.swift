//
//  Log.swift
//  DailyInsights
//
//  Created by 이재홍 on 8/17/24.
//

import Foundation

// MARK: - Properties

nonisolated(unsafe) public var enabledLogLevels: Set<LogLevel> = Set(LogLevel.allCases)

// MARK: - LogLevel

public enum LogLevel: String, CaseIterable {
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
    /// 이벤트
    case event = "EVENT"
    /// 측정
    case measure = "MEASURE"
    
    var imoji: String {
        switch self {
        case .debug: return ""
        case .info: return "ℹ️"
        case .warning: return "⚠️"
        case .error: return "❗️"
        case .important: return "❤️"
        case .event: return "🎯"
        case .measure: return "📊"
        }
    }
}

// MARK: - Function

public func log(
    _ message: String,
    _ level: LogLevel,
    file: String = #file,
    line: Int = #line,
    function: String = #function
) {
    guard enabledLogLevels.contains(level) else { return }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    
#if DEBUG
    print("[\(timestamp)][\(level.imoji)\(level.rawValue)][\(fileName):\(line)] \(message)")
#endif
}

public func log(
    _ message: String,
    level: LogLevel,
    file: String = #file,
    line: Int = #line,
    function: String = #function
) {
    guard enabledLogLevels.contains(level) else { return }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    
#if DEBUG
    print("[\(timestamp)][\(level.imoji)\(level.rawValue)][\(fileName):\(line)] \(message)")
#endif
}
