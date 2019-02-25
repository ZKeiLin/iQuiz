//
//  QuizDataSource.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/16/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class QuizDataSource: NSObject, UITableViewDataSource {
    var data : [Quiz] = []
    init(_ elements : [Quiz]) {
        data = elements
        print("in table view: \(data)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("in table view countr: \(data.count)")
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath) as! QuizCell
//        cell.quizImage.image = data[indexPath.row].image
        cell.title.text = data[indexPath.row].title
        cell.desc.text = data[indexPath.row].desc
        
        return cell
    }
}
