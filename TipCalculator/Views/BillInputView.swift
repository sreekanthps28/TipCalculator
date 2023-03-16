//
//  BillInputView.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import Foundation
import SnapKit

import UIKit

class BillInputView:UIView{
    
    private let headerView: HeaderView = {
      let view = HeaderView()
      view.configure(
        topText: "Enter",
        bottomText: "your bill")
      return view
    }()
    
    private let textFieldContainerView: UIView = {
      let view = UIView()
      view.backgroundColor = .systemFill
      view.addCornerRadius(radius: 8.0)
      return view
    }()
    
    private let currencyDenominationLabel: UILabel = {
      let label = LabelFactory.build(
        text: "$",
        font: ThemeFont.bold(ofSize: 24))
      label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
      return label
    }()
    
    private lazy var textField: UITextField = {
      let textField = UITextField()
      textField.borderStyle = .none
      textField.font = ThemeFont.demibold(ofSize: 28)
      textField.keyboardType = .decimalPad
      textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
      textField.tintColor = ThemeColor.text
      textField.textColor = ThemeColor.text
      // Add toolbar
      let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
      toolBar.barStyle = .default
      toolBar.sizeToFit()
      let doneButton = UIBarButtonItem(
        title: "Done",
        style: .plain,
        target: self,
        action: #selector(doneButtonTapped))
      toolBar.items = [
        UIBarButtonItem(
          barButtonSystemItem: .flexibleSpace,
          target: nil,
          action: nil),
        doneButton
      ]
      toolBar.isUserInteractionEnabled = true
      textField.inputAccessoryView = toolBar
      return textField
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout(){
        [headerView, textFieldContainerView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
          make.leading.equalToSuperview()
          make.centerY.equalTo(textFieldContainerView.snp.centerY)
          make.width.equalTo(68)
          make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        
        textFieldContainerView.snp.makeConstraints { make in
          make.top.trailing.bottom.equalToSuperview()
        }
        
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyDenominationLabel.snp.makeConstraints { make in
          make.top.bottom.equalToSuperview()
          make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        
        textField.snp.makeConstraints { make in
          make.top.bottom.equalToSuperview()
          make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
          make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }
    @objc private func doneButtonTapped() {
      textField.endEditing(true)
    }
}

class HeaderView: UIView {
  
  private let topLabel: UILabel = {
    LabelFactory.build(
      text: nil,
      font: ThemeFont.bold(ofSize: 18))
  }()
  
  private let bottomLabel: UILabel = {
    LabelFactory.build(
      text: nil,
      font: ThemeFont.regular(ofSize: 16))
  }()
  
  private let topSpacerView = UIView()
  private let bottomSpacerView = UIView()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      topSpacerView,
      topLabel,
      bottomLabel,
      bottomSpacerView
    ])
    stackView.axis = .vertical
    stackView.alignment = .leading
    stackView.spacing = -4
    return stackView
  }()

  init() {
    super.init(frame: .zero)
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        topSpacerView.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacerView)
        }
    }
    
    func configure(topText: String, bottomText: String) {
      topLabel.text = topText
      bottomLabel.text = bottomText
    }
  
}
