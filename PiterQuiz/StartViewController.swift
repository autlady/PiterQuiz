//
//  StartViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 11.04.2022.
//

import UIKit

class StartViewController: UIViewController {

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
        stackView.spacing = 200
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var buttonStackView: UIStackView = {

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var startLabel: UILabel = {
        let label = UILabel()
//        label.text = "Piter Quiz"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "LYON-CREST-SVG", size: 55)
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var startQuizButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapQuizButton), for: .touchUpInside)
        button.setTitle("Piter Quiz", for: .normal)
        settingButtons(button: button)
        return button
    }()

    private lazy var datingButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapDateButton), for: .touchUpInside)
        button.setTitle("Perfect Date", for: .normal)
        settingButtons(button: button)
        return button
    }()

    private func settingButtons (button: UIButton) {
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Hyatheus", size: 30)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backView)
        self.backView.addSubview(backgroundImageView)
        self.backView.addSubview(startLabel)
        self.backView.addSubview(buttonStackView)
        self.buttonStackView.addArrangedSubview(startQuizButton)
        self.buttonStackView.addArrangedSubview(datingButton)
        self.activateConstraints()

        startLabel.text = ""
        var charIndex = 0.0
        let titleText = "Magic Piter"
        for letter in titleText {

            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.startLabel.text?.append(letter)
            }
            charIndex += 1
        }
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

        let topLabelConstraint = self.startLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 150)
        let leadingLabelConstraint = self.startLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 30)
        let trailingLabelConstraint = self.startLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -30)
        let heightLabelConstraint = self.startLabel.heightAnchor.constraint(equalToConstant: 50)

        let stackViewCenterXConstraint = self.buttonStackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
        let stackViewCenterYConstraint = self.buttonStackView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
        let stackViewLeadingConstraint = self.buttonStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 60)
        let stackViewTrailingConstraint = self.buttonStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -60)

        let buttonHeightAnchor = self.startQuizButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonTwoHeightAnchor = self.datingButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
            leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, stackViewCenterXConstraint,  stackViewCenterYConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, buttonHeightAnchor, buttonTwoHeightAnchor, topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, heightLabelConstraint
        ])
    }

    @objc private func didTapQuizButton() {
        let questionVC = QuestionViewController()
        self.navigationController?.pushViewController(questionVC, animated: true)
    }

    @objc private func didTapDateButton() {
        let datingVC = DatingViewController()
        self.navigationController?.pushViewController(datingVC, animated: true)
    }
}

//
//import SwiftUI
//
//struct SwiftUIController: UIViewControllerRepresentable {
//    typealias UIViewControllerType = StartViewController
//        func makeUIViewController(context: Context) -> UIViewControllerType  {
//            let viewController = UIViewControllerType()
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        }
//    }
//
//struct SwiftUIController_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIController()
//            .previewInterfaceOrientation(.portraitUpsideDown)
//    }
//}



