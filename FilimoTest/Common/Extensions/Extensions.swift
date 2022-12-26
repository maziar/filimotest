//
//  Extensions.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

extension NSObject {
    @objc static
    var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell {
    @objc
    static func reuseIdentifier() -> String {
        return self.nameOfClass
    }
}

extension UICollectionViewCell {
    @objc
    static func reuseIdentifier() -> String {
        return self.nameOfClass
    }
}

extension UIView {
    func showShimmer(show: Bool) {
        DispatchQueue.main.async {
            self.setTemplateWithSubviews(show, animate: true, viewBackgroundColor: .systemBackground)
        }
    }
    
    func setCurvedView(cornerRadius: CGFloat, borderWidth: CGFloat , borderColor: UIColor, masksToBounds: Bool) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = masksToBounds
    }
    
    func setCurvedView(cornerRadius: CGFloat , masksToBounds: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
        self.layer.masksToBounds = masksToBounds
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red: .random(),
           green: .random(),
           blue: .random(),
           alpha: 1.0
        )
    }
    
    convenience init(r red: Int, g green: Int, b blue: Int) {
        assert(red >= .zero && red <= 255, "Invalid red component")
        assert(green >= .zero && green <= 255, "Invalid green component")
        assert(blue >= .zero && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(r red: Int, g green: Int, b blue: Int, a: CGFloat) {
        assert(red >= .zero && red <= 255, "Invalid red component")
        assert(green >= .zero && green <= 255, "Invalid green component")
        assert(blue >= .zero && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(rgb: Int) {
        self.init(
            r: (rgb >> 16) & 0xFF,
            g: (rgb >> 8) & 0xFF,
            b: rgb & 0xFF
        )
    }
    
    public convenience init?(hex: String) {
        let red, green, blue, alpha: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = .zero
                
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            }
        }
        
        return nil
    }
    
    public convenience init(hexString: String) {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 1

            let hexColor = hexString.replacingOccurrences(of: "#", with: "")
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            var valid = false

            if scanner.scanHexInt64(&hexNumber) {
                if hexColor.count == 8 {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255
                    valid = true
                } else if hexColor.count == 6 {
                    red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue = CGFloat(hexNumber & 0x0000ff) / 255
                    valid = true
                }
            }

            #if DEBUG
                assert(valid, "UIColor initialized with invalid hex string")
            #endif

            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
}


internal extension Array {
    
    @discardableResult
    mutating func append(_ newArray: Array) -> CountableRange<Int> {
        let range = count..<(count + newArray.count)
        self += newArray
        return range
    }
    
    @discardableResult
    mutating func insert(_ newArray: Array, at index: Int) -> CountableRange<Int> {
        let mIndex = Swift.max(0, index)
        let start = Swift.min(count, mIndex)
        let end = start + newArray.count
        
        let left = self[0..<start]
        let right = self[start..<count]
        self = left + newArray + right
        return start..<end
    }
    
    mutating func remove<T: AnyObject> (_ element: T) {
        let anotherSelf = self
        
        removeAll(keepingCapacity: true)
        
        anotherSelf.each { (index: Int, current: Element) in
            if (current as! T) !== element {
                self.append(current)
            }
        }
    }
    
    func each(_ exe: (Int, Element) -> ()) {
        for (index, item) in enumerated() {
            exe(index, item)
        }
    }
}

extension Array where Element: Equatable {
    var unique: [Element] {
        return self.reduce([]){ $0.contains($1) ? $0 : $0 + [$1] }
    }
    
    public func contains(_ elements: [Element]) -> Bool {
        guard !elements.isEmpty else {
            return false
        }
        var found = true
        for element in elements {
            if !contains(element) {
                found = false
            }
        }
        return found
    }
    
    public func indexes(of item: Element) -> [Int] {
        var indexes: [Int] = []
        for index in 0..<self.count {
            if self[index] == item {
                indexes.append(index)
            }
        }
        return indexes
    }
    
    public mutating func removeAll(_ item: Element) {
        self = self.filter { $0 != item }
    }
    
    public func chunk(size: Int = 1) -> [[Element]] {
        var result = [[Element]]()
        var chunk = -1
        for (index, elem) in self.enumerated() {
            if index % size == 0 {
                result.append([Element]())
                chunk += 1
            }
            result[chunk].append(elem)
        }
        return result
    }
}

public extension Array {
    var randomItem: Element? {
        if self.isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
    var shuffled: [Element] {
        var arr = self
        for _ in 0..<10 {
            arr.sort { (_,_) in arc4random() < arc4random() }
        }
        return arr
    }
    
    mutating func shuffle() {
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
    
    func item(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
