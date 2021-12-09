//
//  MainFont.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import UIKit
import BaseModules

enum MainFont: GenericValueProtocol {
    
    typealias Value = UIFont?
        
    case standard(CGFloat)
    case italic(CGFloat)
    case medium(CGFloat)
    case mediumItalic(CGFloat)
    case thin(CGFloat)
    case bold(CGFloat)
    case boldItalic(CGFloat)

    var value: UIFont? {
        switch self {
        case .standard(let size):
            return UIFont(name: "HelveticaNeue", size: size)
        case .italic(let size):
            return UIFont(name: "HelveticaNeue-Italic", size: size)
        case .medium(let size):
            return UIFont(name: "HelveticaNeue-Medium", size: size)
        case .mediumItalic(let size):
            return UIFont(name: "HelveticaNeue-MediumItalic", size: size)
        case .thin(let size):
            return UIFont(name: "HelveticaNeue-Thin", size: size)
        case .bold(let size):
            return UIFont(name: "HelveticaNeue-Bold", size: size)
        case .boldItalic(let size):
            return UIFont(name: "HelveticaNeue-BoldItalic", size: size)
        }
    }
}
