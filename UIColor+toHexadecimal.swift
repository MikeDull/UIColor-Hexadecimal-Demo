//
//  UIColor+toHexadecimal.swift
//  UIColor-Hexadecimal
//
//  Created by 颜值怪兽 on 2019/7/9.
//  Copyright © 2019 MikeDull. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(hexString: String){
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#"){
            scanner.scanLocation += 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        print(color)
        
        let mask = 0x000000FF
        let r = CGFloat(Int(color >> 16) & mask)
        let g = CGFloat(Int(color >> 8) & mask)
        let b = CGFloat(Int(color) & mask)
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    var hexString: String?{
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let multiplier = CGFloat(255.999999)
        
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        return String(format: "#%02X%02X%02X",
                          Int(red * multiplier),
                          Int(green * multiplier),
                          Int(blue * multiplier))
    }
}
