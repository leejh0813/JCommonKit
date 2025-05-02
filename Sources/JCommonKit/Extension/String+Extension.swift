//
//  String+Extension.swift
//  DailyInsights
//
//  Created by 이재홍 on 9/28/24.
//

import Foundation

public extension String {
    
    /// 문자 사이에 가로폭 없는 공백(U+200B)을 삽입하여 텍스트가 글자 단위로 줄바꿈될 수 있게 함.
    var forceCharWrapping: Self {
        self.map({ String($0) }).joined(separator: "\u{200B}")
    }
}
