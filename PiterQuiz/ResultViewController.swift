//
//  ResultViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 12.04.2022.
//

import UIKit

class ResultViewController: UIViewController {

    var score = 10
    var result = "Вы"

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
    stackView.spacing = 0
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()

private lazy var congratulationLabel: UILabel = {

    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping 
    label.text = "Поздравляем! \nВы прошли Quiz"
    label.textAlignment = NSTextAlignment.center
    label.font = UIFont(name: "Hyatheus", size: 35)
    label.backgroundColor = .clear
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
}()

private lazy var resultLabel: UILabel = {

    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = NSTextAlignment.center
    label.font = UIFont(name: "Hyatheus", size: 25)
    label.backgroundColor = UIColor(named: "Color")
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

let transmissionButton: UIButton = {

    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapTransmissionButton), for: .touchUpInside)
    button.layer.cornerRadius = 12
    button.backgroundColor = UIColor(named: "Color")
    button.setTitle("Пройти еще раз", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont(name: "Hyatheus", size: 20)
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 4, height: 4)
    button.layer.shadowRadius = 4
    button.layer.shadowOpacity = 0.7
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
    }()

override func viewDidLoad() {
    super.viewDidLoad()
    resultLabel.text = "Ваш результат: \(score) из 13\n" + result
    self.view.addSubview(backView)
    self.backView.addSubview(backgroundImageView)
    self.backView.addSubview(stackView)
    self.stackView.addArrangedSubview(congratulationLabel)
    self.stackView.addArrangedSubview(resultLabel)
    self.backView.addSubview(transmissionButton)
    self.activateConstraints()
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
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

    let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 50)
    let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
    let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 50)
    let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -50)

    let congratulationLabelHeightAnchor = self.congratulationLabel.heightAnchor.constraint(equalToConstant: 200)
    let resultLabelHeightAnchor = self.resultLabel.heightAnchor.constraint(equalToConstant: 200)

    let transmissionButtonHeightAnchor = self.transmissionButton.heightAnchor.constraint(equalToConstant: 50)
    let transmissionButtonLeadingConstraint = self.transmissionButton.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 50)
    let transmissionButtonBottomConstraint = self.transmissionButton.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -100)
    let transmissionButtonTrailingConstraint = self.transmissionButton.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -50)

    NSLayoutConstraint.activate([
        topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
        leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, stackViewTopConstraint,  stackViewCenterXConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, transmissionButtonHeightAnchor, transmissionButtonLeadingConstraint, transmissionButtonBottomConstraint, transmissionButtonTrailingConstraint, congratulationLabelHeightAnchor,   resultLabelHeightAnchor  ])
}

    @objc private func didTapTransmissionButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


