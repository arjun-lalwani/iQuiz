//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 10/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func option1(_ sender: Any) {
        option1.isSelected = true
    }
    
    @IBAction func option2(_ sender: Any) {
        option2.isSelected = true
    }
    
    @IBAction func option3(_ sender: Any) {
        option3.isSelected = true
    }
    
    @IBAction func option4(_ sender: Any) {
        option4.isSelected = true
    }

    @IBAction func submitButton(_ sender: Any) {
    
        
        if (option1.isSelected && !option2.isSelected && !option3.isSelected && !option4.isSelected) {
        
            let answerView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
        
            self.present(answerView, animated: true, completion: nil)
            
        } else if (option2.isSelected && !option1.isSelected && !option3.isSelected && !option4.isSelected) {
            
            let answerView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            
            self.present(answerView, animated: true, completion: nil)
            
            
        } else if (option3.isSelected && !option1.isSelected && !option2.isSelected && !option4.isSelected) {
            
            let answerView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            
            self.present(answerView, animated: true, completion: nil)
            
        } else if (option4.isSelected && !option1.isSelected && !option2.isSelected && !option3.isSelected) {
            
            let answerView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            
            self.present(answerView, animated: true, completion: nil)
            
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
}
