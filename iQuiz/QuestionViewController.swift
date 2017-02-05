//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 10/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var allQuizzes : [QuizType] = []
    var currentQuiz: QuizType = QuizType()
    var userSelectedAnswers: [Int] = []
    var currentAnswer: Int = 0
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = currentQuiz.questions[userSelectedAnswers.count]
        questionLabel.text = currentQuestion.question
        option1.setTitle(currentQuestion.answers[0].stringValue, for: .normal)
        option2.setTitle(currentQuestion.answers[1].stringValue, for: .normal)
        option3.setTitle(currentQuestion.answers[2].stringValue, for: .normal)
        option4.setTitle(currentQuestion.answers[3].stringValue, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func option1(_ sender: Any) {
        option1.isSelected = true
        currentAnswer = 1
    }
    
    @IBAction func option2(_ sender: Any) {
        option2.isSelected = true
        currentAnswer = 2
    }
    
    @IBAction func option3(_ sender: Any) {
        option3.isSelected = true
        currentAnswer = 3
    }
    
    @IBAction func option4(_ sender: Any) {
        option4.isSelected = true
        currentAnswer = 4
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (option1.isSelected && !option2.isSelected && !option3.isSelected && !option4.isSelected) {
            
            performSegue(withIdentifier: "AnswerVC", sender: self)
            
        } else if (option2.isSelected && !option1.isSelected && !option3.isSelected && !option4.isSelected) {
            
            performSegue(withIdentifier: "AnswerVC", sender: self)
            
        } else if (option3.isSelected && !option1.isSelected && !option2.isSelected && !option4.isSelected) {
            
            performSegue(withIdentifier: "AnswerVC", sender: self)
            
        } else if (option4.isSelected && !option1.isSelected && !option2.isSelected && !option3.isSelected) {
            
            performSegue(withIdentifier: "AnswerVC", sender: self)
            
        } else {
            
            option1.isSelected = false
            option2.isSelected = false
            option3.isSelected = false
            option4.isSelected = false
            let alertController = UIAlertController(title: "Error", message: "Select one of the 4 options", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        userSelectedAnswers.append(currentAnswer)
        print(userSelectedAnswers)
        if (segue.identifier == "AnswerVC") {
            let answerView = segue.destination as! AnswerViewController
            answerView.allQuizzes = self.allQuizzes
            answerView.currentQuiz = self.currentQuiz
            answerView.userSelectedAnswers = self.userSelectedAnswers
        }
    }
}
