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
    var index = 0
//    var option : [String] = []
//    var correctAnswer = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overallContainer.layer.masksToBounds = false
        questionOptions.dataSource = self
        questionOptions.delegate = self
        questionText.text = questions[index].text
        questionNumber.text = "Question \(String(index + 1))"   
        questionOptions.tableFooterView = UIView(frame: .zero)
        questionOptions.estimatedRowHeight = 200
        questionOptions.rowHeight = UITableView.automaticDimension
        questionOptions.separatorStyle = UITableViewCell.SeparatorStyle.none
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[index].answers.count
    }
    
//    @IBOutlet weak var optionCell: NSLayoutConstraint!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionOptions", for: indexPath) as! AnswerOptionCell
        cell.optionText?.text = questions[index].answers[indexPath.row]
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
        return 60.0;//Choose your custom row height
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
