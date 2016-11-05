//
//  ViewController.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 04/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var subjects : [String] = ["Mathematics", "Marvel Superheroes", "Science"]
    var descriptions : [String] = [
                        "Practice simple math",
                       "Learn cool superheroes",
                       "Understand the world better"]
    var images : [UIImage] = [UIImage(named: "add")!, UIImage(named: "superheroes")!, UIImage(named: "Science")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // print(self.tableView.dequeueReusableCell(withIdentifier: "quizCell")!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! TableViewCell
        let number = (indexPath as NSIndexPath).row
        
        cell.subjectLabel.text = self.subjects[number]
        cell.descriptionLabel.text = self.descriptions[number]
        cell.imageLabel.image = self.images[number]
        
        return cell
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

