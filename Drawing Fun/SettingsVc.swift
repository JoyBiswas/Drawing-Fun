//
//  SettingsVc.swift
//  Drawing Fun
//
//  Created by Joy Biswas on 3/16/17.
//  Copyright © 2017 Joy Biswas. All rights reserved.
//

import UIKit
protocol ColorSentDelegate  {
    func userEnablecolorForCanvas(Color:UIColor)
}
protocol SettingVCDelegate:class {
    
    func settingVieControllerDidFinished(_ settingVc:SettingsVc)
}

class SettingsVc: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var brushSizeLabel: UILabel!
    
   
    
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var delegate:SettingVCDelegate?
    var delegate1:ColorSentDelegate? 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingPreview(red: red, green: green, blue: blue)
        
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value*255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value*255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value*255))

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func blueColorChanged(_ sender: AnyObject) {
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        drawingPreview(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value*255))"

    }
    @IBAction func greenColorChanged(_ sender: AnyObject) {
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        drawingPreview(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value*255))"

    }
    @IBAction func redColorChanged(_ sender: AnyObject) {
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        drawingPreview(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value*255))"
    }
    
    @IBAction func opacityChanged(_ sender: AnyObject) {
    }
    @IBAction func brushSizeSlider(_ sender: AnyObject) {
    }

    @IBAction func dismiss(_ sender: AnyObject) {
        if delegate != nil {
            delegate?.settingVieControllerDidFinished(self)
        }
        dismiss(animated: true, completion: nil)
    }
    func drawingPreview(red:CGFloat, green:CGFloat, blue:CGFloat) {
        imageView.backgroundColor = UIColor(red: red , green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func canvasColorSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            if(delegate1 != nil) {
                let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
                delegate1?.userEnablecolorForCanvas(Color: color)
            }
        }
        else {
           
        }
        
    }
    
}
