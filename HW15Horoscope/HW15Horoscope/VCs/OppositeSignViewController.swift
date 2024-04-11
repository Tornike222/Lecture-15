//
//  OppositeSignViewController.swift
//  HW15Horoscope
//
//  Created by telkanishvili on 11.04.24.
//

import UIKit


class OppositeSignViewController: UIViewController {
    //MARK:  Object From Parent Screen and UI Objects
    var zodiacModel: ZodiacModel?
    
    let oppositeSignSV: UIStackView = {
        let oppositeSignSV = UIStackView()
        oppositeSignSV.axis = .vertical
        oppositeSignSV.translatesAutoresizingMaskIntoConstraints = false
        oppositeSignSV.spacing = 1
        
        return oppositeSignSV
    }()
    
    let oppositeSignImage: UIImageView = {
        let oppositeSignImage = UIImageView()
        oppositeSignImage.translatesAutoresizingMaskIntoConstraints = false
        oppositeSignImage.tintColor = .white
        
        return oppositeSignImage
    }()
    
    let oppositeSignLabel: UILabel = {
        let oppositeSignLabel = UILabel()
        oppositeSignLabel.textColor = .white
        oppositeSignLabel.translatesAutoresizingMaskIntoConstraints = false
        oppositeSignLabel.textAlignment = .center
        oppositeSignLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(rawValue: 400))
        
        return oppositeSignLabel
    }()
    
    let actionButtonsStackView: UIStackView = {
        let actionButtonsStackView = UIStackView()
        actionButtonsStackView.axis = .vertical
        actionButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonsStackView.spacing = 32
        
        return actionButtonsStackView
    }()
    
    let redButton: CustomButton = {
        let redButton = CustomButton()
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.setTitle("წითელი", for: .normal)
        redButton.backgroundColor = .red
        
        return redButton
    }()
    
    let blueButton: CustomButton = {
        let blueButton = CustomButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("ლურჯი", for: .normal)
        blueButton.backgroundColor = .blue
        
        return blueButton
    }()
    
    //MARK: Override viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundToView()
        addOppositeSignSV()
        addOppositeSignToSV()
        addOppositeSignField()
        addActionButtonsStackView()
        addRedButton()
        addBlueButton()
    }
    
    //MARK: Add Functions To View
    func addBackgroundToView(){
        let backgroundImage = UIImage(named: "starryNightImage")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        view.layer.contentsGravity = .resizeAspectFill
        view.layer.contents = backgroundImage?.cgImage
    }
    
    func addOppositeSignSV(){
        view.addSubview(oppositeSignSV)
        
        oppositeSignSV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        oppositeSignSV.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func addOppositeSignToSV(){
        oppositeSignSV.addArrangedSubview(oppositeSignImage)
        
        oppositeSignImage.image = zodiacModel?.polarSign
        oppositeSignImage.widthAnchor.constraint(equalToConstant: 156).isActive = true
        oppositeSignImage.heightAnchor.constraint(equalToConstant: 156).isActive = true
    }
    
    func addOppositeSignField(){
        oppositeSignSV.addArrangedSubview(oppositeSignLabel)
        
        oppositeSignLabel.text = zodiacModel?.polarSignName
    }
    
    func addActionButtonsStackView(){
        view.addSubview(actionButtonsStackView)
        
        actionButtonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        actionButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        actionButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        
    }
    func addRedButton(){
        actionButtonsStackView.addArrangedSubview(redButton)
        
        redButton.addTarget(self, action: #selector(redButtonTouchedUp(_:)), for: .touchUpInside)
    }
    func addBlueButton(){
        actionButtonsStackView.addArrangedSubview(blueButton)

        blueButton.addTarget(self, action: #selector(blueButtonTouchedUp(_:)), for: .touchUpInside)

    }
    
    //MARK: OBJ C ის ფუნქციიები
    @objc func redButtonTouchedUp(_ sender: CustomButton) {
        if let firstViewController = navigationController?.viewControllers.first {
            firstViewController.view.backgroundColor = .red
            navigationController?.popToViewController(firstViewController, animated: false)
        }
     
    }
    @objc func blueButtonTouchedUp(_ sender: CustomButton) {
        if let firstViewController = navigationController?.viewControllers.first {
            firstViewController.view.backgroundColor = .blue
            navigationController?.popToViewController(firstViewController, animated: false)
        }
     
    }
    
    
    
    
}
#Preview {
    OppositeSignViewController()
}
