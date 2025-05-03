//
//  Utils.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public struct Utils {
    
    /// 입력 텍스트에서 특정 부분을 강조한 AttributedString을 생성
    /// - Parameters:
    ///   - text: 원본 텍스트 문자열
    ///   - highlight: 강조할 부분 문자열
    ///   - color: 강조할 부분에 적용할 색상
    /// - Returns: 강조 부분이 적용된 AttributedString
    public static func formattedText(for text: String, highlight: String, color: Color) -> AttributedString {
        var attributedString = AttributedString(text)
        
        if let range = attributedString.range(of: highlight) {
            attributedString[range].foregroundColor = color
        }
        
        return attributedString
    }
    
    public static func languageCode() -> String? {
        Locale.current.language.languageCode?.identifier
    }
    
    public static func isLocaleKo() -> Bool {
        languageCode() == "ko"
    }
}
