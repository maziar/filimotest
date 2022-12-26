//
//  Theme.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/25/22.
//

import Foundation
import UIKit

struct Theme {}

extension UIFont {
    class func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontStyleMulish.regular.rawValue, size: size)!
    }
    class func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontStyleMulish.bold.rawValue, size: size)!
    }
    class func semiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontStyleMulish.semi_bold.rawValue, size: size)!
    }
}

enum FontStyleMulish: String {
    case regular = "Mulish Regular"
    case bold = "Mulish Bold"
    case semi_bold = "Mulish SemiBold"
}

enum ColorPalette {
    static let searchBackGroundColor = UIColor(named: ColorName.searchBackGroundColor.rawValue) ?? UIColor.gray
    static let keyboardDoneColor = UIColor(r: 100, g: 100, b: 100, a: 0.9)
}

enum ColorName: String {
    case searchBackGroundColor = "searchBackGroundColor"
}
