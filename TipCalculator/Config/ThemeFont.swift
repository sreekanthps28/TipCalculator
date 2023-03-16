//
//  ThemeFont.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import UIKit

struct ThemeFont{
    static func regular(ofSize size:CGFloat)->UIFont{
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    static func bold(ofSize size:CGFloat)->UIFont{
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    static func demibold(ofSize size:CGFloat)->UIFont{
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
    }
}
