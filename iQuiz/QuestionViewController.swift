//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/13/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var overallContainer: UIStackView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var questionOptions: UITableView!
    
    var questions : [Question] = []
    var index:Int = -1
    var selected : Int = -1
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        questionOptions.dataSource = self
        questionOptions.delegate = self
        
        // container style
        overallContainer.layer.masksToBounds = false
      
        // table style
        questionOptions.tableFooterView = UIView(frame: .zero)
        questionOptions.estimatedRowHeight = 200
        questionOptions.rowHeight = UITableView.automaticDimension
        questionOptions.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[index].answers.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionOptions", for: indexPath) as! AnswerOptionCell
        cell.optionText?.text = questions[index].answers[indexPath.row]
        
        // Style
        cell.optionText?.textAlignment = .center
        cell.layer.masksToBounds = false
        cell.container.layer.cornerRadius = 20
        cell.container.layer.masksToBounds = false
        cell.container.layer.shadowColor = UIColor.black.cgColor
        cell.container.layer.shadowOffset = CGSize(width: 2, height: 4)
        cell.container.layer.shadowOpacity = 0.2
        cell.container.layer.shadowRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0;
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        print("selected: \(selected)")
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as? AnswerViewController
        if (selected+1) == Int(questions[index].answer) {
            score = score + 1
            vc?.indicatorText = "Correct!"
        } else {
            vc?.indicatorText = "Opps :("
        }
        vc?.curQues = questions[index].text
        vc?.answerText = questions[index].answers[Int(questions[index].answer)! - 1]
        vc?.score = self.score
        vc?.totalScore = self.questions.count
        if index + 1 < questions.count{
            vc?.buttonText = "Next"
            updateQuestion()
        } else {
            vc?.buttonText = "Finished"
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func updateQuestion(){
        self.index = self.index + 1
        questionText.text = questions[index].text
        questionNumber.text = "Question \(String(index + 1))"
        self.questionOptions.reloadData()
    }
}
