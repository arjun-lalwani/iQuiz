//
//  Question.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 14/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import Foundation
import SwiftyJSON

class Question {
    
    var question: String
    var answers: [JSON] 
    var correctAnswer: Int
    
    init(question: String, answers: [JSON], correctAnswer: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
