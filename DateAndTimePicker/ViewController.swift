//
//  ViewController.swift
//  DateAndTimePicker
//
//  Created by Salih Yusuf Göktaş on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfieldTime: UITextField!
    @IBOutlet weak var textfieldDate: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        textfieldDate.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        textfieldTime.inputView = timePicker
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datePicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.saatGoster(timePicker:)), for: .valueChanged)

        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
    }
    
    @objc func tarihGoster(datePicker:UIDatePicker){
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFormatter.string(from: datePicker.date)
        
        textfieldDate.text = alinanTarih
        view.endEditing(true)
    }
    
    @objc func saatGoster(timePicker:UIDatePicker){
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let alinanSaat = dateFormatter.string(from: timePicker.date)

        textfieldTime.text = alinanSaat

        
    }

    @objc func dokunmaAlgilamaMetod(){
        view.endEditing(true)

        
    }
    
}

            
