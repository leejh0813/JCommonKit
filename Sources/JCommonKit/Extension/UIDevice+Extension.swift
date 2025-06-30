//
//  UIDevice.swift
//  JCommonKit
//
//  Created by 이재홍 on 6/15/25.
//

import UIKit

public extension UIDevice {
    
    var modelIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0, value > 0 else { return identifier }
            return identifier + String(Character(UnicodeScalar(UInt8(value))))
        }
        return identifier
    }
    
    var modelName: String {
        let identifier = modelIdentifier
        
        switch identifier {
            // iPhone XS/XR 시리즈 (2018년)
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
        case "iPhone11,8": return "iPhone XR"
            
            // iPhone 11 시리즈 (2019년)
        case "iPhone12,1": return "iPhone 11"
        case "iPhone12,3": return "iPhone 11 Pro"
        case "iPhone12,5": return "iPhone 11 Pro Max"
            
            // iPhone SE 2세대 (2020년)
        case "iPhone12,8": return "iPhone SE (2nd generation)"
            
            // iPhone 12 시리즈
        case "iPhone13,1": return "iPhone 12 mini"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,4": return "iPhone 12 Pro Max"
            
            // iPhone 13 시리즈
        case "iPhone14,4": return "iPhone 13 mini"
        case "iPhone14,5": return "iPhone 13"
        case "iPhone14,2": return "iPhone 13 Pro"
        case "iPhone14,3": return "iPhone 13 Pro Max"
            
            // iPhone SE 3세대
        case "iPhone14,6": return "iPhone SE (3rd generation)"
            
            // iPhone 14 시리즈
        case "iPhone14,7": return "iPhone 14"
        case "iPhone14,8": return "iPhone 14 Plus"
        case "iPhone15,2": return "iPhone 14 Pro"
        case "iPhone15,3": return "iPhone 14 Pro Max"
            
            // iPhone 15 시리즈
        case "iPhone15,4": return "iPhone 15"
        case "iPhone15,5": return "iPhone 15 Plus"
        case "iPhone16,1": return "iPhone 15 Pro"
        case "iPhone16,2": return "iPhone 15 Pro Max"
            
            // iPhone 16 시리즈
        case "iPhone17,3": return "iPhone 16"
        case "iPhone17,4": return "iPhone 16 Plus"
        case "iPhone17,1": return "iPhone 16 Pro"
        case "iPhone17,2": return "iPhone 16 Pro Max"
            
            // iPad (iOS 17 지원 모델들)
        case "iPad12,1", "iPad12,2": return "iPad (9th generation)"
        case "iPad13,18", "iPad13,19": return "iPad (10th generation)"
            
            // iPad Air
        case "iPad11,3", "iPad11,4": return "iPad Air (3rd generation)"
        case "iPad13,1", "iPad13,2": return "iPad Air (4th generation)"
        case "iPad13,16", "iPad13,17": return "iPad Air (5th generation)"
            
            // iPad Pro 11인치
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro 11-inch (1st generation)"
        case "iPad8,9", "iPad8,10": return "iPad Pro 11-inch (2nd generation)"
        case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return "iPad Pro 11-inch (3rd generation)"
        case "iPad14,3", "iPad14,4": return "iPad Pro 11-inch (4th generation)"
            
            // iPad Pro 12.9인치
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return "iPad Pro 12.9-inch (3rd generation)"
        case "iPad8,11", "iPad8,12": return "iPad Pro 12.9-inch (4th generation)"
        case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11": return "iPad Pro 12.9-inch (5th generation)"
        case "iPad14,5", "iPad14,6": return "iPad Pro 12.9-inch (6th generation)"
            
            // iPad mini
        case "iPad11,1", "iPad11,2": return "iPad mini (5th generation)"
        case "iPad14,1", "iPad14,2": return "iPad mini (6th generation)"
            
            // 시뮬레이터
        case "i386", "x86_64", "arm64": return "Simulator"
            
        default: return "unknown"
        }
    }
}
