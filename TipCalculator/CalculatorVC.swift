//
//  ViewController.swift
//  TipCalculator
//
//  Created by SREEKANTH PS on 15/03/2023.
//

import UIKit
import SnapKit

private let logoView = LogoView()
private let resultView = ResultView()
private let billInputView = BillInputView()
private let tipInputView = TipInputView()
private let splitInputView = SplitInputView()

private var vStackView:UIStackView = {
   let stackView =  UIStackView.init(arrangedSubviews: [logoView, resultView, billInputView, tipInputView, splitInputView, UIView()])
    stackView.axis = .vertical
    stackView.spacing = 36
    return stackView
}()



class CalculatorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
        
    }
    
    func layout(){
        view.backgroundColor = .white
        self.view.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
        }
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+16)
        }
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }


}

