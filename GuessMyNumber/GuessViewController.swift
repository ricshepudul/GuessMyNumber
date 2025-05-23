//
//  GuessViewController.swift
//  GuessMyNumber
//
//  Created by HPro2 on 12/19/24.
//

import UIKit

class GuessViewController: UIViewController {
    
    var number: Int!
    var guesses = 0
    var low = 100
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
   
    @IBOutlet weak var guessesLabel: UILabel!
    @IBOutlet weak var lowScoreLabel: UILabel!
    
    @IBOutlet weak var tl: UIImageView!
    @IBOutlet weak var tr: UIImageView!
    @IBOutlet weak var bl: UIImageView!
    @IBOutlet weak var br: UIImageView!
    
    @IBAction func guessButton(_ sender: UIButton) {
        check()
    }
    
    @IBOutlet weak var guessButton: UIButton!
    
    @IBAction func newGameButton(_ sender: UIButton) {
        newGame()
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "Unwind", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        newGame();
    }
    
    func newGame() {
        number = Int.random(in: 1...10)
        messageLabel.text = "Guess My Number"
        bottomLabel.text = "(1-10)"
        
        guesses = 0
        guessesLabel.text = "Guesses: \(guesses)"
        
        guessTextField.isEnabled = true
        guessTextField.text = ""
        guessButton.isEnabled = true
        
        tl.image = UIImage(named: "blank")
        tr.image = UIImage(named: "blank")
        bl.image = UIImage(named: "blank")
        br.image = UIImage(named: "blank")
    }
    
    func check() {
        if (guessTextField.text != "") {
            bottomLabel.text = ""
            guesses += 1
            guessesLabel.text = "Guesses: \(guesses)"
            
            let guess = Int(guessTextField.text!)!
            if (guess == number) {
                tl.image = UIImage(named: "green_down")
                tr.image = UIImage(named: "green_down")
                bl.image = UIImage(named: "green_up")
                br.image = UIImage(named: "green_up")
                guessTextField.isEnabled = false
                guessButton.isEnabled = false
                
                if (guesses < low) {
                    low = guesses
                    lowScoreLabel.text = "Low Score: \(low)"
                    messageLabel.text = "A New Low Score!"
                } else {
                    messageLabel.text = "You Guessed It!"
                }
            } else if (guess > number) {
                messageLabel.text = "Too High!"
                if (guess - number == 1) {
                    tl.image = UIImage(named: "green_down")
                    tr.image = UIImage(named: "green_down")
                    bl.image = UIImage(named: "green_down")
                    br.image = UIImage(named: "green_down")
                } else if (guess - number <= 3) {
                    tl.image = UIImage(named: "yellow_down")
                    tr.image = UIImage(named: "yellow_down")
                    bl.image = UIImage(named: "yellow_down")
                    br.image = UIImage(named: "yellow_down")
                } else {
                    tl.image = UIImage(named: "red_down")
                    tr.image = UIImage(named: "red_down")
                    bl.image = UIImage(named: "red_down")
                    br.image = UIImage(named: "red_down")
                }
            } else {
                messageLabel.text = "Too Low!"
                if (guess - number == -1) {
                    tl.image = UIImage(named: "green_up")
                    tr.image = UIImage(named: "green_up")
                    bl.image = UIImage(named: "green_up")
                    br.image = UIImage(named: "green_up")
                } else if (guess - number >= -3) {
                    tl.image = UIImage(named: "yellow_up")
                    tr.image = UIImage(named: "yellow_up")
                    bl.image = UIImage(named: "yellow_up")
                    br.image = UIImage(named: "yellow_up")
                } else {
                    tl.image = UIImage(named: "red_up")
                    tr.image = UIImage(named: "red_up")
                    bl.image = UIImage(named: "red_up")
                    br.image = UIImage(named: "red_up")
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
