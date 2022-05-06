//
//  QuestionViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 10.04.2022.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {

    var quizBrain = QuizBrain()
    var timer = Timer()
    var player: AVAudioPlayer!

    func playSound() {
            do {
                self.player =  try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "Mumijj_Troll_-_Takie_devchonki", withExtension: "mp3")!)
                self.player.play()

            } catch {
                print("Error")
            }
        }
    var score = 0
    var result = ""

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

    private lazy var musicButton: UIButton = {

        let button = UIButton(frame: CGRect(x: 300, y: 75, width: 50, height: 50))
        button.addTarget(self, action: #selector(didTapMusicButton), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        let image = UIImage(named: "musicspb")
        button.setBackgroundImage(image, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = true

        return button
        }()

    private lazy var progressBar: UIProgressView = {

        let bar = UIProgressView()
        bar.backgroundColor = .white
        bar.progressViewStyle = .bar
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping 
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Hyatheus", size: 30)
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var firstButton: UIButton = {

        let button = UIButton(type: .system)
        settingButtons(button: button)

        return button
    }()

    private lazy var secondButton: UIButton = {

        let button = UIButton(type: .system)
        settingButtons(button: button)

        return button
    }()


    private lazy var thirdButton: UIButton = {

        let button = UIButton(type: .system)
        settingButtons(button: button)

        return button
        }()

    private func settingButtons (button: UIButton) {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "Color")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Hyatheus", size: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
        updateUI()
        self.view.addSubview(backView)
        self.backView.addSubview(backgroundImageView)
        self.backView.addSubview(musicButton)
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

        let bottomBarConstraint = self.progressBar.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -50)
        let leadingBarConstraint = self.progressBar.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 60)
        let trailingBarConstraint = self.progressBar.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -60)
        let heightBarConstraint = self.progressBar.heightAnchor.constraint(equalToConstant: 15)
        let barCenterXConstraint = self.progressBar.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)

        let topLabelConstraint = self.questionLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: -50)
        let leadingLabelConstraint = self.questionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 20)
        let trailingLabelConstraint = self.questionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -20)
        let bottomLabelConstraint = self.questionLabel.bottomAnchor.constraint(equalTo: self.stackView.topAnchor)

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 60)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -60)
        let stackViewBottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -100)

        let firstButtonHeightAnchor = self.firstButton.heightAnchor.constraint(equalToConstant: 50)
        let secondButtonHeightAnchor = self.secondButton.heightAnchor.constraint(equalToConstant: 50)
        let thirdButtonHeightAnchor = self.secondButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([ barCenterXConstraint, bottomBarConstraint, leadingBarConstraint, trailingBarConstraint, heightBarConstraint,
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

    @objc private func didTapMusicButton(_ sender: UIButton) {
        if player.isPlaying {
            player.stop()
        } else {
            player.play()
        }
    }

   @objc private func didTapButton(_ sender: UIButton) {
       sender.alpha = 0.5
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
              sender.alpha = 1.0
          }

       let userAnswer = sender.currentTitle!
       let userGotItRight = quizBrain.checkAnswer(userAnswer)
       if userGotItRight {
           score += 1
       }

       if  quizBrain.questionNumber + 1 < quizBrain.quiz.count {
           quizBrain.questionNumber += 1

           Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

            } else {
                let vc = ResultViewController()
                vc.score = score
                if score >= 0 && score < 6 {
                    vc.result = "Узнайте Питер лучше"
                } else if score >= 6 && score < 10 {
                    vc.result = "Вы хорошо знаете Питер"
                } else if score >= 10 && score < 14 {
                    vc.result = "Вы - знаток Питера!"
                } else {
                vc.result = "Нет результата"
                }

                self.navigationController?.pushViewController(vc, animated: true)

            }
    }
}
