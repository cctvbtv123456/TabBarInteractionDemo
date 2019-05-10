//
//  SecondViewController.swift
//  TabBarInteractionDemo
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 zhihuiketang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, TabbarInteractable {

    private var clockView: ClockIconView!
    
    let calender = Calendar.current
    
    lazy var defaultDate: Date = {
        var component = DateComponents()
        component.hour = 9
        component.minute = 0
        return calender.date(from: component)!
    }()
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clockView = ClockIconView(frame: CGRect.zero)
        clockView.lineWidth = 2
        clockView.tintColor = UIColor.white
        clockView.layer.cornerRadius = 12.5
        
        dataPicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        dataPicker.date = defaultDate
        
        replaceSwappableImageViews(with: clockView, and: CGSize(width: 25, height: 25))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        clockView.backgroundColor = UIColor.gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        clockView.backgroundColor = view.tintColor
    }
    

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let hour = calender.component(.hour, from: selectedDate)
        let minute = calender.component(.minute, from: selectedDate)
        
        clockView.hour = hour
        clockView.minute = minute
    }


}
