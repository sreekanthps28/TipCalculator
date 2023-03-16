//
//  ResultView.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import UIKit
import SnapKit

class ResultView:UIView{
    
    private let headerLabel:UILabel = {
        LabelFactory.build(
            text:"Total p/person",
            font: ThemeFont.demibold(ofSize: 18))
    }()
    
    private let amountPerPersonLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        var text = NSMutableAttributedString(string:"$0", attributes:[.font:ThemeFont.bold(ofSize: 24)])
        text.addAttributes([.font:ThemeFont.bold(ofSize: 18)], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    private let seperatorView:UIView = {
        let seperatorView = UIView()
        seperatorView.backgroundColor = ThemeColor.separator
        return seperatorView
    }()
    
    private lazy var hstackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [AmountView(withTitle: "Totla bill", andAlignemnt: .left), UIView(), AmountView(withTitle: "Total tip", andAlignemnt: .right)])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var vstackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, amountPerPersonLabel, seperatorView,  buildSpacerView(height: 0), hstackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout(){
        backgroundColor = .white
        addSubview(vstackView)
        
        vstackView.snp.makeConstraints { make in
            make.top.leading.equalTo(24)
            make.trailing.bottom.equalTo(-24)
        }
        seperatorView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        addShadow(
          offset: CGSize(width: 0, height: 3),
          color: .black,
          radius: 12.0,
          opacity: 0.1)
    }
    
    private func buildSpacerView(height: CGFloat) -> UIView {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: height).isActive = true
      return view
    }
}

class AmountView:UIView{
    
    private let title:String
    private let textAlignment:NSTextAlignment
    
    private lazy var titleLabel:UILabel = {
        LabelFactory.build(
            text:title,
            font: ThemeFont.regular(ofSize: 18),textAlignment: textAlignment)
    }()
    
    private lazy var amountLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.textColor = ThemeColor.primary
        var text = NSMutableAttributedString(string:"$0", attributes:[.font:ThemeFont.bold(ofSize: 24)])
        text.addAttributes([.font:ThemeFont.bold(ofSize: 16)], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    private lazy var vStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, amountLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    init(withTitle title:String, andAlignemnt alignment:NSTextAlignment) {
        self.title = title
        self.textAlignment = alignment
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
