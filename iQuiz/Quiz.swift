//
//  Quiz.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/14/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class Quiz {
    var title: String
    var image: UIImage
    var desc: String
    var questions: [Question]
    
    init(title: String, image: UIImage, desc: String, questions:[Question]) {
        self.title = title
        self.image = image
        self.desc = desc
        self.questions = questions
    }
}
