//
//  ViewController.swift
//  Quizzler
//  Created by Branislav on 08/11/2017.


import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionProvider()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1){
            pickedAnswer = true
        } else if (sender.tag == 2){
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        print(questionNumber)
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if(questionNumber <= 12){
        questionLabel.text = allQuestions.list[questionNumber].questionText
            
        updateUI()
            
        }else{
            let alert = UIAlertController(title: "End of the quiz!", message: "You have answered all the questions. Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })

            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if (correctAnswer == pickedAnswer){
            ProgressHUD.showSuccess("Correct")
            print("Correct!")
            score += 1
        }else{
            ProgressHUD.showError("Wrong")
            print("Wrong!")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
        score = 0
        updateUI()
      
    }
    

    
}
