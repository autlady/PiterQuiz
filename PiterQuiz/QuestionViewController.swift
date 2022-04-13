//
//  QuestionViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 10.04.2022.
//

import UIKit

class QuestionViewController: UIViewController {

    var quizBrain = QuizBrain()

    var timer = Timer()

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

    private lazy var progressBar: UIProgressView = {

        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false

        return bar

    }()

    private lazy var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // переносится неправильно
        label.lineBreakMode = .byWordWrapping // переносится неправильн
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Marker Felt Thin", size: 30)
//        label.font = UIFont(name: "LYON-CREST-SVG", size: 20)
        // кастомный шрифт надо добавить в info.plist потом по имени пользоваться
        // "Fonts provided by application"
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let firstButton: UIButton = {

        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Marker Felt Thin", size: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    let secondButton: UIButton = {

        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Marker Felt Thin", size: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()


    let thirdButton: UIButton = {

        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
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
        updateUI()
        self.view.addSubview(backView)
        self.backView.addSubview(backgroundImageView)
        self.backView.addSubview(progressBar)
        self.backView.addSubview(questionLabel)
        self.backView.addSubview(stackView)
        self.stackView.addArrangedSubview(firstButton)
        self.stackView.addArrangedSubview(secondButton)
        self.stackView.addArrangedSubview(thirdButton)
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

        let topBarConstraint = self.progressBar.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: -10)
        let leadingBarConstraint = self.progressBar.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 15)
        let trailingBarConstraint = self.progressBar.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -15)
        let heightBarConstraint = self.progressBar.heightAnchor.constraint(equalToConstant: 20)

//        let topLabelConstraint = self.questionLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: -20)
        let topLabelConstraint = self.questionLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: -50)

        let leadingLabelConstraint = self.questionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 20)
        let trailingLabelConstraint = self.questionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -20)
        let bottomLabelConstraint = self.questionLabel.bottomAnchor.constraint(equalTo: self.stackView.topAnchor)

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
//        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 60)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -60)
        let stackViewBottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -100)

        let firstButtonHeightAnchor = self.firstButton.heightAnchor.constraint(equalToConstant: 50)
        let secondButtonHeightAnchor = self.secondButton.heightAnchor.constraint(equalToConstant: 50)
        let thirdButtonHeightAnchor = self.secondButton.heightAnchor.constraint(equalToConstant: 50)


        NSLayoutConstraint.activate([ topBarConstraint, leadingBarConstraint, trailingBarConstraint, heightBarConstraint,
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
            leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, stackViewCenterXConstraint, stackViewBottomConstraint,   stackViewLeadingConstraint, stackViewTrailingConstraint, topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, bottomLabelConstraint,
            firstButtonHeightAnchor, secondButtonHeightAnchor, thirdButtonHeightAnchor
        ])
    }

    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        firstButton.setTitle(quizBrain.getFirstButtonText(), for: .normal)
        secondButton.setTitle(quizBrain.getSecondButtonText(), for: .normal)
        thirdButton.setTitle(quizBrain.getThirdButtonText(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
    }

   @objc private func didTapButton() {

       quizBrain.nextQuestion()

       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

}

