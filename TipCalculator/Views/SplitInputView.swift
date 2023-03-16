//
//  SplitInputView.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import UIKit
import SnapKit

class SplitInputView:UIView{
    
    private let headerView: HeaderView = {
      let view = HeaderView()
      view.configure(topText: "Split", bottomText: "the total")
      return view
    }()
    
    private lazy var decrementButton: UIButton = {
      let button = buildButton(
        text: "-",
        corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner])
      return button
    }()
    
    private lazy var incrementButton: UIButton = {
      let button = buildButton(
        text: "+",
        corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
      let label = LabelFactory.build(
        text: "1",
        font: ThemeFont.bold(ofSize: 20),
        backgroundColor: .white)
      return label
    }()
    
    private lazy var stackView: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [
        decrementButton,
        quantityLabel,
        incrementButton
      ])
      stackView.axis = .horizontal
      stackView.spacing = 0
      return stackView
    }()
    private lazy var hstackView: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [
        headerView,
        stackView
      ])
      stackView.axis = .horizontal
      stackView.spacing = 24
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
       addSubview(hstackView)
        hstackView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalToSuperview()
        }
        headerView.snp.makeConstraints { make in
            make.width.equalTo(68)
        }
        [incrementButton, decrementButton].forEach { button in
          button.snp.makeConstraints { make in
            make.width.equalTo(button.snp.height)
          }
        }
    }
    
    private func buildButton(text: String, corners: CACornerMask) -> UIButton {
      let button = UIButton()
      button.setTitle(text, for: .normal)
      button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
      button.backgroundColor = ThemeColor.primary
      button.addRoundedCorners(corners: corners, radius: 8.0)
      return button
    }
    
}
