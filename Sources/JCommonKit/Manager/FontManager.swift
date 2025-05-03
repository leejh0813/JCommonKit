//
//  FontManager.swift
//  JCommonKit
//
//  Created by 이재홍 on 5/3/25.
//

import SwiftUI

public final class FontManager: ObservableObject {
    
    // MARK: - Properties
    
    /// 폰트 FamilyName
    static private let fontFamily = "fontFamily"
    /// 폰트 Weight
    static private let defaultFontWeight = "defaultFontWeight"
    
    @AppStorage(fontFamily) private var fontFamilyRawValue: String = FontFamily.pretendard .rawValue
    @AppStorage(defaultFontWeight) private var fontWeightRawValue: String = FontWeight.regular.rawValue
    
    var fontFamily: FontFamily {
        get { FontFamily(rawValue: fontFamilyRawValue) ?? .pretendard }
        set { fontFamilyRawValue = newValue.rawValue }
    }
    
    var fontWeight: FontWeight {
        get { FontWeight(rawValue: fontWeightRawValue) ?? .regular }
        set { fontWeightRawValue = newValue.rawValue }
    }
}

public extension FontManager {
    
    enum FontFamily: String, CaseIterable {
        case pretendard
        case apppleSDGothicNeo
        case dailyokja
        case meetme
        case ongeulipUiyeonche
        case kimjungchul
        case oTLaundryGothic
        case iMHyemin
        
        var koreanName: String {
            switch self {
            case .pretendard: "프리텐다드"
            case .apppleSDGothicNeo: "애플 산돌고딕 네오"
            case .dailyokja: "온글잎 매일옥자체"
            case .meetme: "밑미"
            case .ongeulipUiyeonche: "온글잎 의연체"
            case .kimjungchul: "김정철명조"
            case .oTLaundryGothic: "런드릭 고딕"
            case .iMHyemin: "IM혜민체"
            }
        }
    }
    
    enum FontWeight: String {
        case light
        case regular
        case medium
        case semibold
        case bold
    }
    
    static func fontName(for family: FontFamily, weight: FontWeight) -> String {
        switch family {
        case .pretendard:
            return pretendardFontName(for: weight)
            
        case .apppleSDGothicNeo:
            return appleGothicNeoFontName(for: weight)
            
        case .dailyokja:
            return dailyokjaFontName(for: weight)
            
        case .meetme:
            return meetmeFontName(for: weight)
            
        case .ongeulipUiyeonche:
            return ongeulipUiyeoncheFontName(for: weight)
            
        case .kimjungchul:
            return kimjungchulFontName(for: weight)
            
        case .oTLaundryGothic:
            return oTLaundryGothicFontName(for: weight)
            
        case .iMHyemin:
            return IMHyeminFontName(for: weight)
        }
    }
    
    static func pretendardFontName(for weight: FontManager.FontWeight) -> String {
        switch weight {
        case .light, .regular: return "Pretendard-Regular"
        case .medium: return "Pretendard-Medium"
        case .semibold: return "Pretendard-SemiBold"
        case .bold: return "Pretendard-Bold"
        }
    }
    
    static func appleGothicNeoFontName(for weight: FontManager.FontWeight) -> String {
        switch weight {
        case .light, .regular: return "AppleSDGothicNeo-Regular"
        case .medium: return "AppleSDGothicNeo-Medium"
        case .semibold: return "AppleSDGothicNeo-SemiBold"
        case .bold: return "AppleSDGothicNeo-Bold"
        }
    }
    
    static func dailyokjaFontName(for weight: FontManager.FontWeight) -> String {
        return "Ownglyph_Dailyokja-Rg"
    }
    
    static func meetmeFontName(for weight: FontManager.FontWeight) -> String {
        return "Ownglyph_meetme-Rg"
    }
    
    static func ongeulipUiyeoncheFontName(for weight: FontManager.FontWeight) -> String {
        return "OwnglyphEuiyeonChae"
    }
    
    static func kimjungchulFontName(for weight: FontManager.FontWeight) -> String {
        switch weight {
        case .light: return "KimjungchulMyungjo-Light"
        case .regular, .semibold, .medium: return "KimjungchulMyungjo-Regular"
        case .bold: return "KimjungchulMyungjo-Bold"
        }
    }
    
    static func oTLaundryGothicFontName(for weight: FontManager.FontWeight) -> String {
        switch weight {
        case .light, .regular, .medium, .semibold: return "OTLaundryGothicR"
        case .bold: return "OTLaundryGothicB"
        }
    }
    
    static func IMHyeminFontName(for weight: FontManager.FontWeight) -> String {
        switch weight {
        case .light, .regular, .medium, .semibold: return "IMHyemin-Regular"
        case .bold: return "IMHyemin-Bold"
        }
    }
}
