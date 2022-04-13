//
//  ResultViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 12.04.2022.
//

import UIKit

class ResultViewController: UIViewController {

private lazy var backView: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false

    return view
}()

private lazy var backgroundImageView: UIImageView = {

    let imageView = UIImageView()
    imageView.image = UIImage(named: "spb_background")
    imageView.translatesAutoresizingMaskIntoConstraints = false

    return imageView

}()

private lazy var stackView: UIStackView = {

    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 30
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()

private lazy var congratulationLabel: UILabel = {

    let label = UILabel()
    label.numberOfLines = 0 // переносится неправильно
    label.lineBreakMode = .byWordWrapping // переносится неправильно
    label.text = "Поздравляем! Вы прошли Quiz"
    label.textAlignment = NSTextAlignment.center
    //label.font = UIFont(name: "Marker Felt Thin", size: 55)
    label.font = UIFont(name: "LYON-CREST-SVG", size: 35)
    label.backgroundColor = .clear
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
}()

let resultButton: UIButton = {

    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapResultButton), for: .touchUpInside)
    button.layer.cornerRadius = 12
    button.backgroundColor = UIColor(named: "Color")
    button.setTitle("Узнать результат", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont(name: "Marker Felt Thin", size: 20)
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 4, height: 4)
    button.layer.shadowRadius = 4
    button.layer.shadowOpacity = 0.7
    button.translatesAutoresizingMaskIntoConstraints = false

    return button
}()

let transmissionButton: UIButton = {

    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapTransmissionButton), for: .touchUpInside)
    button.layer.cornerRadius = 12
    button.backgroundColor = UIColor(named: "Color")
    button.setTitle("Пройти еще раз", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont(name: "Marker Felt Thin", size: 20)
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 4, height: 4)
    button.layer.shadowRadius = 4
    button.layer.shadowOpacity = 0.7
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
    }()


override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(backView)
    self.backView.addSubview(backgroundImageView)
    self.backView.addSubview(stackView)
    self.backView.addSubview(congratulationLabel)
    self.stackView.addArrangedSubview(resultButton)
    self.stackView.addArrangedSubview(transmissionButton)
    self.activateConstraints()
}

func activateConstraints() {
    let topConstraint = self.backView.topAnchor.constraint(equalTo: self.view.topAnchor)
    let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
    let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

    let topImageConstraint = self.backgroundImageView.topAnchor.constraint(equalTo: self.backView.topAnchor)
    let leadingImageConstraint = self.backgroundImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
    let trailingImageConstraint = self.backgroundImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
    let bottomImageConstraint = self.backgroundImageView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

    let topLabelConstraint = self.congratulationLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 100)
    let leadingLabelConstraint = self.congratulationLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
    let trailingLabelConstraint = self.congratulationLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
    let congratulationLabelHeightAnchor = self.congratulationLabel.heightAnchor.constraint(equalToConstant: 200)

    let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
//    let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
    let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 50)
    let stackViewBottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -100)
    let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -50)


    let resultButtonHeightAnchor = self.resultButton.heightAnchor.constraint(equalToConstant: 50)
    let transmissionButtonHeightAnchor = self.transmissionButton.heightAnchor.constraint(equalToConstant: 50)


    NSLayoutConstraint.activate([
        topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
        leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint,   stackViewCenterXConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewBottomConstraint,
        congratulationLabelHeightAnchor, resultButtonHeightAnchor, transmissionButtonHeightAnchor
    ])
}


@objc private func didTapResultButton() {
    let alert = UIAlertController(title: "Ваш результат:", message: "Вы знаток Питера", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
}

    @objc private func didTapTransmissionButton() {
        let startVC = StartViewController()
        self.navigationController?.pushViewController(startVC, animated: true)
    }
}


