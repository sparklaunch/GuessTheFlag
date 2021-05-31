//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Jinwook Kim on 2021/05/31.
//

import UIKit

class ViewController: UIViewController {
    var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer: Int = 0
    var score: Int = 0
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil) {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
        self.title = self.countries[self.correctAnswer].uppercased()
        self.button1.setImage(UIImage(named: self.countries[0]), for: .normal)
        self.button2.setImage(UIImage(named: self.countries[1]), for: .normal)
        self.button3.setImage(UIImage(named: self.countries[2]), for: .normal)
        self.button1.layer.borderWidth = 1.0
        self.button2.layer.borderWidth = 1.0
        self.button3.layer.borderWidth = 1.0
        self.button1.layer.borderColor = UIColor.lightGray.cgColor
        self.button2.layer.borderColor = UIColor.lightGray.cgColor
        self.button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == self.correctAnswer {
            title = "Correct"
            self.score += 1
        }
        else {
            title = "Wrong"
            self.score -= 1
        }
        let alert: UIAlertController = UIAlertController(title: title, message: "Your current score is \(self.score).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: self.askQuestion))
        self.present(alert, animated: true)
    }
}

