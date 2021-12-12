//
//  SecondVC.swift
//  ColorAPP
//
//  Created by Александр Басов on 01/10/2021.
//  Copyright © 2021 Александр Басов. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLBL: UILabel!
    @IBOutlet weak var greenLBL: UILabel!
    @IBOutlet weak var blueLBL: UILabel!
    @IBOutlet weak var alphaLBL: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider! 
    @IBOutlet weak var alphaSlider: UISlider!
    
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    @IBOutlet weak var editButton: UIButton!

//    private var colorView: UIColor!
 
    var delegate: ColorDelegate?
    var colorFromMainVC: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = colorFromMainVC
        setValueForSlider()
        setValueForLabel()
        setValueForTextField()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLBL.text = string(from: sender)
            redTF.text = string(from: sender)
        case 1:
            greenLBL.text = string(from: sender)
            greenTF.text = string(from: sender)
        case 2:
            blueLBL.text = string(from: sender)
            blueTF.text = string(from: sender)
        default:
            break
        }
            
        setColor()
        
    }
    
    
    @IBAction func textFieldChangeColor(_ sender: UITextField) {
        guard let value = Float(sender.text ?? ""), value <= 1, value >= 0 else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
            return
        }
        
        switch sender.tag {
        case 0:
            redLBL.text = sender.text
            redSlider.value = value
        case 1:
            greenLBL.text = sender.text
            greenSlider.value = value
        case 2:
            blueLBL.text = sender.text
            blueSlider.value = value
        case 3:
            alphaLBL.text = sender.text
            alphaSlider.value = value
        default:
            break
        }
        
       setColor()
    }
    
    

    @IBAction func editButtonTouch(_ sender: UIButton) {
        delegate?.setColor(colorFromMainVC)
        dismiss(animated: true)
    }
    
    private func setColor() {
           colorFromMainVC = UIColor(red: CGFloat(redSlider.value),
                                     green: CGFloat(greenSlider.value),
                                     blue: CGFloat(blueSlider.value),
                                     alpha: CGFloat(alphaSlider.value))
           
           colorView.backgroundColor = colorFromMainVC
       }
    
    private func setValueForLabel() {
         redLBL.text = string(from: redSlider)
         greenLBL.text = string(from: greenSlider)
         blueLBL.text = string(from: blueSlider)
         alphaLBL.text = string(from: alphaSlider)
     }
     
    private func setValueForTextField() {
     redTF.text = string(from: redSlider)
     greenTF.text = string(from: greenSlider)
     blueTF.text = string(from: blueSlider)
    }
    
    private func setValueForSlider() {
        let ciColor = CIColor(color: colorFromMainVC)
    
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        alphaSlider.value = Float(ciColor.alpha)
        }
    
}
extension SecondVC {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
