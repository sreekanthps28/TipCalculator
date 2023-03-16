//
//  LogoView.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import UIKit
import SnapKit

class LogoView:UIView{
    
    private let imageView:UIImageView = {
        let imageView = UIImageView(image: .init(named: "icCalculatorBW"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let topLabel:UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Mr TIP", attributes: [.font: ThemeFont.demibold(ofSize: 16)])
        text.addAttributes([.font:ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()
    private let bottomLabel:UILabel = {
        LabelFactory.build(text: "Calculator",
                           font: ThemeFont.demibold(ofSize: 18),
                           textAlignment: .left)
    }()
    private lazy var vStack:UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [topLabel, bottomLabel])
        vStack.axis = .vertical
        vStack.spacing = -4
        return vStack
    }()
    private lazy var hStack:UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [imageView, vStack])
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.alignment = .center
        return hStack
    }()
   
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout(){
        self.addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
        }
    }
}
