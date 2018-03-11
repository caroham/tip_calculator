//
//  ViewController.swift
//  tipster
//
//  Created by Carolyn Hampe on 3/9/18.
//  Copyright © 2018 Carolyn Hampe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var lowPLabel: UILabel!
    @IBOutlet weak var midPLabel: UILabel!
    @IBOutlet weak var highPLabel: UILabel!
    @IBOutlet weak var lowTipLabel: UILabel!
    @IBOutlet weak var midTipLabel: UILabel!
    @IBOutlet weak var highTipLabel: UILabel!
    @IBOutlet weak var lowPortLabel: UILabel!
    @IBOutlet weak var midPortLabel: UILabel!
    @IBOutlet weak var highPortLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet var btns: [UIButton]!
    
    var total: Double = 0
    var midTip: Double = 0.18
    var groupSize: Double = 1
    var lowTip: Double = 0.15
    var highTip: Double = 0.20
    
    @IBAction func tipSliderUpdate (_ sender: UISlider) {
        let currentTip = Double(Int(sender.value))
        midTip = currentTip/100
        lowTip = midTip - 0.03
        highTip = midTip + 0.02
        
        updateUI()
    }
    
    @IBAction func groupSizeUpdate(_ sender: UISlider) {
        groupSize = Double(Int(sender.value))
        
        updateUI()
    }
    
    
    
    @IBAction func calcBtnPress(_ sender: UIButton) {
        let button = sender
        if let btnTxtUW = button.currentTitle {
            if totalLabel.text == "0" {
                totalLabel.text = btnTxtUW
                if let btnDub = Double(btnTxtUW) {
                    total = btnDub
                }
                updateUI()
            }
            else {
                if let totalTxtUW = totalLabel.text {
                    let newTotal = totalTxtUW + btnTxtUW
                    totalLabel.text = newTotal
                    if let totalUW = Double(newTotal) {
                        total = totalUW
                        updateUI()
                    }
                }
            }
        }
    }

    
    func updateUI() {
        lowPLabel.text = String(Int(lowTip*100)) + "%"
        midPLabel.text = String(Int(midTip*100)) + "%"
        highPLabel.text = String(Int(highTip*100)) + "%"
        
        groupSizeLabel.text = "Group Size: " + String(Int(groupSize))
        
        lowTipLabel.text = String(format: "%.2f", total*lowTip)
        midTipLabel.text = String(format: "%.2f", total*midTip)
        highTipLabel.text = String(format: "%.2f", total*highTip)
        
        lowPortLabel.text = String(format: "%.2f", (total*(lowTip + 1.00))/groupSize)
        midPortLabel.text = String(format: "%.2f", (total*(midTip + 1.00))/groupSize)
        highPortLabel.text = String(format: "%.2f", (total*(highTip + 1.00))/groupSize)
    }

    @IBAction func clearBtn(_ sender: Any) {
        totalLabel.text = "0"
        total = 0
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        total = 0
        midTip = 0.18
        groupSize = 1
        lowTip = 0.15
        highTip = 0.20
        tipSlider.value = 18
        groupSizeSlider.value = 1
        updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

