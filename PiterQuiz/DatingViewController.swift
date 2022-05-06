//
//  DatingViewController.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 04.05.2022.
//

import UIKit
import AVFoundation


class DatingViewController: UIViewController {

    var player: AVAudioPlayer!

    func playSound() {
            do {
                self.player =  try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "Purple_Avenue_-_Love_and_Sex_and_Magic", withExtension: "mp3")!)
                self.player.play()

            } catch {
                print("Error")
            }
        }

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "love_in_piter")
        imageView.contentMode = .scaleAspectFill
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

    private lazy var startLabel: UILabel = {
        let label = UILabel()
        label.text = "Perfect Date"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Hyatheus", size: 40)
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
        self.view.addSubview(backView)
        self.backView.addSubview(backgroundImageView)
        self.backView.addSubview(musicButton)
        self.backView.addSubview(startLabel)
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

        let topLabelConstraint = self.startLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 150)
        let leadingLabelConstraint = self.startLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 30)
        let trailingLabelConstraint = self.startLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -30)
        let heightLabelConstraint = self.startLabel.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, topImageConstraint,
            leadingImageConstraint, trailingImageConstraint, bottomImageConstraint, topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, heightLabelConstraint
        ])
}

    @objc private func didTapMusicButton(_ sender: UIButton) {
        if player.isPlaying {
            player.stop()
        } else {
            player.play()
        }
    }
}


