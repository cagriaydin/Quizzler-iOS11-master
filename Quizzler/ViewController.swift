//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
    }
    
    
    func checkAnswer() {
        if(allQuestions.list[questionNumber].answer == pickedAnswer){
            
            if(questionNumber < allQuestions.list.count - 1){
                questionNumber += 1
                nextQuestion()
            }
            else{
                let alert = UIAlertController(title: "Congratulations !", message: "You've finished all the questions, do you want to start over ?", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .default) { (action) in
                    self.startOver()
                }
                
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    
}
