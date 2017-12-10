
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
        contentView.translateAutoresizingMaskIntoConstraints = false  // That is the first step we need for our anchor points when we do autolayoutencode
        view.addSubview(contentView)

        logoView.translateAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoView)

        buttonView.translateAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonView)

        for (index, title) in titles.enumerated() { // For loop will give us current title and index
            let button = Roundedbutton()
            button.translateAutoresizingMaskIntoConstraints = false
            buttonView.addSubview(button)
            button.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            button.titleLabel?.font = UI.Font.boldSystemFont(ofSize: 20)  // Set font of buttons
            button.setTitle(title, for: .normal)  // Set current title
            button.tag = index  // something we'll need later on
            gameButtons.append(button)  

            // All we need to add out button view.


        }
        
        scoreView.translateAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scoreView)

        titleLabel.translateAutoresizingMaskIntoConstraints = false
        recentScoreLabel.translateAutoresizingMaskIntoConstraints = false // SHows recent score
        highscoreLabel.translateAutoresizingMaskIntoConstraints = false
        scoreView.addSubview(titleLabel)
        scoreView.addSubview(recentScoreLabel)
        scoreView.addSubview(highscoreLabel)

        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = UI.Color.white
        recentScoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        recentScoreLabel.textColor = UIColor.white
        highscoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        highscoreLabel.textColor = UIColor.white


        titleLabel.text = "Multiple Choice"
        recentScoreLabel.text = "Recent: 0"
        highscoreLabel.textColor = "Highscore: 0"

        let constraints = [
            contentView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0), // top
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),  // left anchor
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),  // right anchor
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),   // bottom
            // What this does is make sure that our content view is using the entire view 
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            logoView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6)

        ]
    }



}

