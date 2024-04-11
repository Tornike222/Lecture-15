//
//  CustomButton.swift
//  HW15Horoscope
//
//  Created by telkanishvili on 10.04.24.
//

import UIKit

class CustomButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        touch()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        touch()
    }
    
    func setupButton(){
        backgroundColor = UIColor.purple
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func touch(){
        addTarget(self, action: #selector(buttonTouchedDown(_:)), for: .touchDown)
        addTarget(self, action: #selector(buttonTouchedUp(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTouchedDown(_ sender: CustomButton ){
        layer.opacity = 0.5
    }
    
    @objc func buttonTouchedUp(_ sender: CustomButton ){
        layer.opacity = 1
    }
    
}
