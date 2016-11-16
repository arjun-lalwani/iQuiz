//
//  QuizType.swift
//  iQuiz
//
//  Created by Arjun Lalwani on 14/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import Foundation

class QuizType {
    
    var quizName : String
    var quizDesc : String
    var questions : [Question]
    
    convenience init() {
        self.init(quizName: "", quizDesc: "", questions: [])
    }
    
    init(quizName: String, quizDesc: String, questions: [Question]) {
        self.quizName = quizName
        self.quizDesc = quizDesc
        self.questions = questions
    }
}
