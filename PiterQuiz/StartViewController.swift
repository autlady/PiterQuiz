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
        stackView.spacing = 400
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var startLabel: UILabel = {
        let label = UILabel()
        label.text = "Piter Quiz"
        label.textAlignment = NSTextAlignment.center
        //label.font = UIFont(name: "Marker Felt Thin", size: 55)
        label.font = UIFont(name: "LYON-CREST-SVG", size: 55)
        // кастомный шрифт надо добавить в info.plist потом по имени пользоваться
        // "Fonts provided by application"
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.black, for: .normal)
        //button.titleLabel?.font = UIFont(name: "LYON-CREST-SVG", size: 40)
        button.titleLabel?.font = UIFont(name: "Marker Felt Thin", size: 40)
        // не получилось кастомный шрифт использовать в кнопке
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
        self.stackView.addArrangedSubview(startLabel)
        self.stackView.addArrangedSubview(startButton)
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

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 60)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -60)

        let startLabelHeightAnchor = self.startLabel.heightAnchor.constraint(equalToConstant: 50)
        let buttonHeightAnchor = self.startButton.heightAnchor.constraint(equalToConstant: 50)


        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
            leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, stackViewCenterXConstraint,  stackViewCenterYConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint,
            startLabelHeightAnchor, buttonHeightAnchor
        ])
    }


    @objc private func didTapButton() {

        let questionVC = QuestionViewController()
        questionVC.modalPresentationStyle = .fullScreen
        self.present(questionVC, animated: true)
//        self.navigationController?.pushViewController(questionVC, animated: true)
    }
}

//struct SwiftUIController: UIViewControllerRepresentable {
//    typealias UIViewControllerType = StartViewController
//        func makeUIViewController(context: Context) -> UIViewControllerType  {
//            let viewController = UIViewControllerType()
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//        }
//    }
//
//struct SwiftUIController_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIController()
//    }
//}

