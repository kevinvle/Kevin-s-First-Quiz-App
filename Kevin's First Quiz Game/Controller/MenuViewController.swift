
//
//  ViewController.swift
//  Kevin's First Quiz Game
//
//  Created by Kevin Le on 11/30/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    private let contentView = UIView()  // contains all our different elements. private only lets that property content access to me.
    private let logoView = UIImageView() // Take an Image View and position it on the top of our screen
    private let buttonView = UIView()  // Contains 4 buttons for our 4 different types of quiz games
    private var gameButtons = [RoundedButton]()  // Related to Roundedbutton.swift
    private let scoreView = UIView()
    private let titleLabel = UILabel()
    private let recentScoreLabel = UILabel()  // Instance of UILabel
    private let highscoreLabel = UILabel()    // Instance of UILabel
    private let titles = [
        "Multiple Choice",
        "Image Quiz",
        "Right or Wrong",
        "Emoji Riddle"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .blackTranslucent    // Gives us a black nav bar
        navigationController?.navigationBar.tintColor = UIColor.white       // We have a black nav bar with white text on it
        // Navigation Controller should not be visible now
        view.backgroundColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0) // Background flat color - flatuicolors.com alpha determines opacity. 1.0 is full opacity
        layoutView()    // Calls layoutView function   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true  // Hides the navigation bar. We do this in viewWillAppear method not in viewDidLoad b/c viewDidLoad only loads once when the app is run. Later we will need to use this method to make sure the nav bar is hidden again.
    }

    func layoutView() { 
        contentView.translatesAutoresizingMaskIntoConstraints = false  // That is the first step we need for our anchor points when we do autolayoutencode
        view.addSubview(contentView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonView)

        for (index, title) in titles.enumerated() { // For loop will give us current title and index
            let button = RoundedButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            buttonView.addSubview(button)
            button.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // Set font of buttons
            button.setTitle(title, for: .normal)  // Set current title
            button.tag = index  // something we'll need later on
            gameButtons.append(button)
            // All we need to add out button view.
        }
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scoreView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        recentScoreLabel.translatesAutoresizingMaskIntoConstraints = false // SHows recent score
        highscoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreView.addSubview(titleLabel)
        scoreView.addSubview(recentScoreLabel)
        scoreView.addSubview(highscoreLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = UIColor.white
        recentScoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        recentScoreLabel.textColor = UIColor.white
        highscoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        highscoreLabel.textColor = UIColor.white
        titleLabel.text = "Multiple Choice"
        recentScoreLabel.text = "Recent: 0"
        highscoreLabel.text = "Highscore: 0"

        let constraints = [
            contentView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0), // top also: """"'topLayoutGuide' was deprecated in iOS 11.0: Use view.safeAreaLayoutGuide.topAnchor instead of topLayoutGuide.bottomAnchor""""
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),  // left anchor
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),  // right anchor
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),   // bottom
            // What this does is make sure that our content view is using the entire view 
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            logoView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            buttonView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20.0), // position it right at the bottom of logoView
            buttonView.bottomAnchor.constraint(equalTo: scoreView.topAnchor, constant: -20.0), // this time it's the other way around so negative constant
            buttonView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            buttonView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameButtons[0].topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 8.0),
            gameButtons[0].bottomAnchor.constraint(equalTo: gameButtons[1].topAnchor, constant: -8.0),
            gameButtons[0].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[0].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            gameButtons[1].bottomAnchor.constraint(equalTo: gameButtons[2].topAnchor, constant: -8.0),
            gameButtons[1].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[1].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            gameButtons[2].bottomAnchor.constraint(equalTo: gameButtons[3].topAnchor, constant: -8.0),
            gameButtons[2].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[2].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            gameButtons[3].bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -8.0),
            gameButtons[3].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[3].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            gameButtons[0].heightAnchor.constraint(equalTo: gameButtons[1].heightAnchor), // These 3 lines make sure all our buttons are positioned correctly and are equal in size
            gameButtons[1].heightAnchor.constraint(equalTo: gameButtons[2].heightAnchor),
            gameButtons[2].heightAnchor.constraint(equalTo: gameButtons[3].heightAnchor),
            scoreView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40.0),
            scoreView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            scoreView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            scoreView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: scoreView.topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: recentScoreLabel.topAnchor, constant: -8.0),
            recentScoreLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            recentScoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            recentScoreLabel.bottomAnchor.constraint(equalTo: highscoreLabel.topAnchor, constant: -8.0),
            highscoreLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            highscoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            highscoreLabel.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: -8.0),
            titleLabel.heightAnchor.constraint(equalTo: recentScoreLabel.heightAnchor),
            recentScoreLabel.heightAnchor.constraint(equalTo: highscoreLabel.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

