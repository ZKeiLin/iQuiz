//
//  ViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/8/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

//struct Quiz {
//    var title: String
//    var image: UIImage
//    var desc: String
//    var questions: [Question]
//}

struct Question {
    var text: String
    var answer: Int
    var answers : [String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var quizTable: UITableView!
    var list : [Quiz] = []
    var marvelQuiz = Quiz(
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
                            ])])
    
    var science = Quiz(
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
                ])])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTable.delegate = self
        quizTable.dataSource = self
        list = [marvelQuiz, science]
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath) as! QuizCell
        cell.quizImage.image = list[indexPath.row].image
        cell.title.text = list[indexPath.row].title
        cell.desc.text = list[indexPath.row].desc

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = list[indexPath.row].questions
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}


