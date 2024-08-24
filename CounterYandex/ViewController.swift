//
//  ViewController.swift
//  CounterYandex
//
//  Created by alex on 24.08.2024.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func increaseButton(_ sender: Any) {
        count += 1
        updateCountLabel()
        addHistoryEntry(text: "значение изменено на +1")
    }
        
    
    @IBAction func decreaseButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            updateCountLabel()
            addHistoryEntry(text: "значение изменено на -1")
        } else {
            addHistoryEntry(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        updateCountLabel()
        addHistoryEntry(text: "значение сброшено")
    }
    
    func updateCountLabel() {
        countLabel.text = "\(count)"
       }
    func addHistoryEntry(text: String) {
        let currentDateTime = getCurrentDateTime()
        let newEntry = "\n[\(currentDateTime)]: \(text)"
        historyTextView.text += newEntry
    }
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
}

