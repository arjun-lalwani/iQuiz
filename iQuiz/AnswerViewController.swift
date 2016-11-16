//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 10/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var allQuizzes : [QuizType] = []
    var currentQuiz: QuizType = QuizType()
    var userSelectedAnswers: [Int] = []
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = currentQuiz.questions[userSelectedAnswers.count - 1].question
        
        let answers : [JSON] = currentQuiz.questions[userSelectedAnswers.count - 1].answers
        let correctNumber = currentQuiz.questions[userSelectedAnswers.count - 1].correctAnswer - 1
        
        print(userSelectedAnswers[userSelectedAnswers.count - 1])
        print(currentQuiz.questions[userSelectedAnswers.count - 1].correctAnswer)
        
        if ((userSelectedAnswers[userSelectedAnswers.count - 1]) == currentQuiz.questions[userSelectedAnswers.count - 1].correctAnswer) {
            answerLabel.text = "You got it right. The correct answer was \(answers[correctNumber])."
        } else {
            answerLabel.text = "You got it wrong. The correct answer was \(answers[correctNumber])."
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        print("user \(userSelectedAnswers.count))")
        print("quiz \(currentQuiz.questions.count)")
        
        if (userSelectedAnswers.count < currentQuiz.questions.count) {
            print("user \(userSelectedAnswers.count))")
            print("quiz \(currentQuiz.questions.count)")
            self.performSegue(withIdentifier: "QuestionVC", sender: nil)
        } else {
            print("user \(userSelectedAnswers.count))")
            print("quiz \(currentQuiz.questions.count)")
            self.performSegue(withIdentifier: "FinishVC", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "QuestionVC") {
            let questionController = segue.destination as! QuestionViewController
            questionController.allQuizzes = self.allQuizzes
            questionController.currentQuiz = self.currentQuiz
            questionController.userSelectedAnswers = self.userSelectedAnswers
        } else if (segue.identifier == "FinishVC"){
            let resultController = segue.destination as! FinishedViewController
            resultController.allQuizzes = self.allQuizzes
            resultController.currentQuiz = self.currentQuiz
            resultController.userSelectedAnswers = self.userSelectedAnswers
        } else {
            let mainController = segue.destination as! ViewController
            mainController.allQuizzes = self.allQuizzes
        }
    }
    
}
