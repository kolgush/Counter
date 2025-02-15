//
//  ViewController.swift
//  Counter
//
//  Created by Анастасия  Колгушкина  on 14.02.2025.
//

import UIKit

class ViewController: UIViewController {
    var counter : Int = 0
    
    enum JournalEvent {
        case increment
        case decrement
        case reset
        case zero
    }
    
    func journalEvent(event: JournalEvent) {
        if event != .zero {
            textCounter.text = String (counter)
        }
        textJournal.text += "\n \(Date()):"
        
        switch event {
        case .decrement :
            textJournal.text += "\n Значение изменилось на -1"
                    
        case .increment :
            textJournal.text += "\n Значение изменилось на +1"
        case .reset :
            textJournal.text += "\n Значение сброшено"
        case .zero :
            textJournal.text += "\n Попытка уменьшить значение счётчика ниже 0"
        }
    }

    @IBOutlet weak var textJournal: UITextView!
    @IBAction func tapPlusButton(_ sender: Any) {
        counter += 1
        journalEvent(event: .increment)
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            journalEvent(event: .decrement)
        }
        else {
            journalEvent(event: .zero)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        journalEvent(event: .reset)
    }
    @IBOutlet weak var plusButton: UIButton!
    

    @IBOutlet weak var textCounter: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textCounter.text = String (counter)
        textJournal.text = "История изменений:"
        // Do any additional setup after loading the view.
    }


}

