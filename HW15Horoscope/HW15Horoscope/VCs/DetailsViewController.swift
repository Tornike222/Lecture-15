//
//  DetailsViewController.swift
//  HW15Horoscope
//
//  Created by telkanishvili on 10.04.24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK:  Object From Parent Screen and UI Objects
    var zodiacModel: ZodiacModel?
    
    let zodiacSign: UIImageView = {
        let zodiacSign = UIImageView()
        zodiacSign.translatesAutoresizingMaskIntoConstraints = false
        zodiacSign.tintColor = .white

        return zodiacSign
    }()
    
    let zodiacName: UILabel = {
        let zodiacName = UILabel()
        zodiacName.textColor = .white
        zodiacName.translatesAutoresizingMaskIntoConstraints = false
        
        return zodiacName
    }()
    
    let zodiacSV: UIStackView = {
        let zodiacSV = UIStackView()
        zodiacSV.translatesAutoresizingMaskIntoConstraints = false
        zodiacSV.axis = .vertical
        zodiacSV.spacing = 46
        
        return zodiacSV
    }()
    
    let zodiacDescription: UITextView = {
        let zodiacDescription = UITextView()
        zodiacDescription.textColor = .white
        zodiacDescription.translatesAutoresizingMaskIntoConstraints = false
        zodiacDescription.backgroundColor = .clear
        zodiacDescription.layer.opacity = 0.7
        zodiacDescription.font = UIFont.systemFont(ofSize: 19)
        
        return zodiacDescription
    }()
    
    let oppositeSignButton: CustomButton = {
        let oppositeSignButton = CustomButton()
        oppositeSignButton.translatesAutoresizingMaskIntoConstraints = false
        oppositeSignButton.setTitle("პოლარული ნიშანი", for: .normal)
        
        
        return oppositeSignButton
    }()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationControllerWhite()
        addBackgroundToView()
        addZodiacSign()
        addZodiacName()
        addZodiacSV()
        addZodiacDescriptionToSV()
        addOppositeSignButtonToSV()

    }
    
    //MARK: Functions
    func makeNavigationControllerWhite(){
        navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    func addBackgroundToView(){
        let backgroundImage = UIImage(named: "starryNightImage")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        view.layer.contentsGravity = .resizeAspectFill
        view.layer.contents = backgroundImage?.cgImage
    }
    
    func addZodiacSign(){
        view.addSubview(zodiacSign)
        
        zodiacSign.image = zodiacModel?.icon
        zodiacSign.widthAnchor.constraint(equalToConstant: 156).isActive = true
        zodiacSign.heightAnchor.constraint(equalToConstant: 156).isActive = true
        zodiacSign.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        zodiacSign.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func addZodiacName(){
        view.addSubview(zodiacName)
        
        zodiacName.text = zodiacModel?.name
        zodiacName.font = UIFont.systemFont(ofSize: 27)

        zodiacName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        zodiacName.topAnchor.constraint(equalTo: zodiacSign.bottomAnchor, constant: 0.9).isActive = true
        
    }
    
    func addZodiacSV(){
        view.addSubview(zodiacSV)
        
        zodiacSV.topAnchor.constraint(equalTo: zodiacName.bottomAnchor, constant: 30).isActive = true
        zodiacSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        zodiacSV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        zodiacSV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }
    
    func addZodiacDescriptionToSV(){
        zodiacSV.addArrangedSubview(zodiacDescription)
        zodiacDescription.text = zodiacModel?.description
    }
    
    func addOppositeSignButtonToSV(){
        zodiacSV.addArrangedSubview(oppositeSignButton)
        
        oppositeSignButton.addTarget(self, action: #selector(nextButtonTouchedUp(_:)), for: .touchUpInside)
    }
    
    @objc func nextButtonTouchedUp(_ sender: CustomButton) {
        let osvc = OppositeSignViewController()
        osvc.zodiacModel = zodiacModel
        osvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(osvc, animated: false)
    }
    
}

#Preview {
    DetailsViewController()
}
