//
//  ViewController.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 04/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var url : String = ""
    var allQuizzes : [QuizType] = []
    var images : [UIImage] = [UIImage(named: "Science")!, UIImage(named: "superheroes")!, UIImage(named: "add")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // print(self.tableView.dequeueReusableCell(withIdentifier: "quizCell")!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! TableViewCell
        
        if (allQuizzes.count != 0) {
            let quiz = allQuizzes[indexPath.row]
            cell.subjectLabel.text = quiz.quizName
            cell.descriptionLabel.text = quiz.quizDesc
            cell.imageLabel.image = images[indexPath.row]
        }
        
        return cell
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "URL Reciver", message: "Enter URL to recieve quiz from", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alert.addTextField{ (url : UITextField!) in
            url.placeholder = "Type URL..."
        }
        
        let processURL : UIAlertAction = UIAlertAction(title: "Check Now", style: .default, handler: { (action) -> Void in
            self.url = (alert.textFields?.first?.text!)!
            self.getData((alert.textFields?.first?.text)!)
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(processURL)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func getData(_ urlEntered: String) {
        
        let url = URL(string: urlEntered)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                if let urlContent = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        self.parseJsonFile(JSON(jsonResult))
                        
                    } catch {
                        
                        print ("JSON Failed")
                    }
                }
            }
        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func parseJsonFile(_ input: JSON) {
        var allQuiz = [QuizType]()
        
        for (_, data):(String, JSON) in input {
            let newQuiz : QuizType = QuizType()
            newQuiz.quizName = data["title"].stringValue
            newQuiz.quizDesc = data["desc"].stringValue
            
            for (_, questions):(String, JSON) in data {
                for (_, question): (String, JSON) in questions {
                    
                    let newQuestion : Question = Question(question: question["text"].stringValue, answers: question["answers"].arrayValue, correctAnswer: question["answer"].intValue)
                    newQuiz.questions.append(newQuestion)
                }
            }
            allQuiz.append(newQuiz)
        }
        // all data available in allQuiz
        self.allQuizzes = allQuiz
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let questionController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
        questionController.allQuizzes = self.allQuizzes
        questionController.currentQuiz = allQuizzes[(tableView.indexPathForSelectedRow!.row)]
        self.present(questionController, animated: true, completion: nil)
        
    }
}
