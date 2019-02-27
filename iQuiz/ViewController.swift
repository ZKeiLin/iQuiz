//
//  ViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/8/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

struct Question: Codable {
    var text: String
    var answer: String
    var answers : [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var quizTable: UITableView!
//    var quizRepo : QuizRepository = (UIApplication.shared.delegate as! AppDelegate).quizRepository
    var data : [Quiz] = []
    var sourceURL : URL = URL(string: "http://tednewardsandbox.site44.com/questions.json")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON(self.sourceURL)
//        ParseData(curdata)
        navigationItem.hidesBackButton = true
        quizTable.dataSource = self
        quizTable.delegate = self
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func Setting(_ sender: Any) {
        let alertController = UIAlertController(title: "Setting", message:
            "Input your own source url", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: {textField in
            textField.placeholder = "Input your own source url"
    })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Check Now", style: UIAlertAction.Style.default,handler: {(_) in
            let input = (alertController.textFields![0] as UITextField).text!
            if let url = URL(string: input), UIApplication.shared.canOpenURL(url) {
                self.fetchJSON(url)
            } else {
                let alert = UIAlertController(title: "Oh no!", message: "The Download Fail!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay...", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
//                self.UseLocalData()
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    

    
//    func UseLocalData() {
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let filePath = documentsURL.appendingPathComponent("quizes.json").path
//
//        if let fileUrl = Bundle.main.path(forAuxiliaryExecutable: filePath){
//            do {
//                let localData = try Data(contentsOf: URL(fileURLWithPath: fileUrl), options: .mappedIfSafe)
//                self.ParseData(localData)
//                print("noooooooooo")
//            }catch{
//                print("Can't get access to local Data")
//            }
//        }
//    }
//
    
    fileprivate func fetchJSON(_ url: URL){
//        var dataCollected : Data ? nil
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let filePath = documentsURL.appendingPathComponent("quizes.json").path
//
//        if let fileUrl = Bundle.main.path(forAuxiliaryExecutable: filePath){
//            do {
//                let localData = try Data(contentsOf: URL(fileURLWithPath: fileUrl), options: .mappedIfSafe)
//                Decoder(localData)
//            }catch{
//                print("Can't get access to local Data")
//            }
//        }
//        guard let url = URL(string: urlString) else { return}
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
//                    self.UseLocalData()
//                    self.data = self.quizRepo.getQuiz()
//                    self.quizTable.reloadData()
                    print("Fail to get data from the url", err)
                    return
                }
                guard let onlineData = data else { return }
                self.DowloadData(onlineData)
//                dataCollected = onlineData
                print("fetttch!")
                self.ParseData(onlineData)
                self.quizTable.reloadData()
            }}
            task.resume()
//        return dataCollected
    }
    
    func DowloadData(_ data: Data) {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("quizes.json")
            try data.write(to: fileURL, options: .atomic)
            print("\(fileURL)!")
        } catch { }
    }
    
    func ParseData (_ data: Data){
        do {
            let decoder = JSONDecoder()
            self.data = try decoder.decode([Quiz].self, from: data)
            self.quizTable.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath) as! QuizCell
//        cell.quizImage.image = UIImage(named: data[indexPath.row].title)

        //        cell.quizImage.image = data[indexPath.row].image
        cell.title.text = data[indexPath.row].title
        cell.desc.text = data[indexPath.row].desc
        cell.quizImage.image = UIImage(named: data[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table: \(self.data)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = (data[indexPath.row].questions ?? nil)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
