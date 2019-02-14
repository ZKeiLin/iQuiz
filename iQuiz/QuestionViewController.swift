//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/13/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var questionOptions: UITableView!
    
    var questions : [Question] = [
//        Question(
//            text: "Who is Iron Man?",
//            answer: 1,
//            answers: [
//                "Tony Stark",
//                "Obadiah Stane",
//                "A rock hit by Megadeth",
//                "Nobody knows"
//            ]),
//        Question(
//            text: "Who founded the X-Men?",
//            answer: 2,
//            answers: [
//                "Tony Stark",
//                "Professor X",
//                "The X-Institute",
//                "Erik Lensherr"
//            ])
    ]
    var index = 0
//    var option : [String] = []
//    var correctAnswer = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionOptions.dataSource = self
        questionOptions.delegate = self
        questionText.text = questions[index].text
        questionNumber.text = "Question \(String(index + 1))"   
        questionOptions.tableFooterView = UIView(frame: .zero)
        questionOptions.estimatedRowHeight = 200
        questionOptions.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[index].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionOptions", for: indexPath)
        cell.textLabel?.text = questions[index].answers[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
