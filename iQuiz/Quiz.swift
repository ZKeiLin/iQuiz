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

protocol QuizRepository {
    func getQuiz() -> [Quiz]
//    func saveQuiz(data: [Quiz]) -> Bool
//    func findQuizbyTitle(_ title : String) -> [Quiz]
}

class TestingQuizRepository : QuizRepository {

    private static var _repo : QuizRepository? = nil
    static var theInstance : QuizRepository {
        get {
            if _repo == nil {
                _repo = TestingQuizRepository()
            }
            return _repo!
        }
    }
    
    let localTestingData : [Quiz] = [
        Quiz(
            title:"Marvel Super Heroes",
            image: (UIImage(named:"marvel") ?? nil)!,
            desc: "Avengers, Assemble!",
            questions:[
                Question(
                    text: "Who is Iron Man?",
                    answer: 1,
                    answers: [
                        "Tony Stark",
                        "Obadiah Stane",
                        "A rock hit by Megadeth",
                        "Nobody knows"
                    ]),
                Question(
                    text: "Who founded the X-Men?",
                    answer: 2,
                    answers: [
                        "Tony Stark",
                        "Professor X",
                        "The X-Institute",
                        "Erik Lensherr"
                    ])]),
        Quiz(
            title:"Science!",
            image: (UIImage(named:"science") ?? nil)!,
            desc: "Because SCIENCE!",
            questions:[
                Question(
                    text: "What is fire?",
                    answer: 1,
                    answers: [
                        "One of the four classical elements",
                        "A magical reaction given to us by God",
                        "A band that hasn't yet been discovered",
                        "Fire! Fire! Fire! heh-heh"
                    ])])]
    
    func getQuiz() -> [Quiz] {
        return localTestingData
    }
    
//    func saveQuiz(data: [Quiz]) -> Bool {
//        return true
//    }
//    func findQuizbyTitle(_ title: String) -> [Quiz] {
//        return []
//    }
}
