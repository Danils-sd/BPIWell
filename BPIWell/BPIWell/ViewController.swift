//
//  ViewController.swift
//  BPIWell
//
//  Created by Danila on 06.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelUdateTextConst: UILabel!
    
    @IBOutlet weak var labelUpate: UILabel!
    
    @IBOutlet weak var imageMan: UIImageView!
    
    @IBOutlet weak var labelDataBeak: UILabel!
    
    @IBOutlet weak var labelValConst: UILabel!
    
    @IBOutlet weak var labelVal: UILabel!
    
    @IBOutlet weak var labelRateConst: UILabel!
    
    @IBOutlet weak var labelRate: UILabel!
    
    @IBOutlet weak var segmentChooseVal: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        self.labelUdateTextConst.alpha = 0.3
        self.labelUpate.alpha = 0.3
        self.imageMan.alpha = 0.3
        self.segmentChooseVal.alpha = 0.3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.labelUdateTextConst.transform.tx = self.labelUdateTextConst.frame.width * 0.04432133
        self.labelUdateTextConst.transform.ty = self.labelUdateTextConst.frame.height * 1
        
        
        self.labelUpate.transform.tx = self.labelUpate.frame.width * 0.04432133
        self.labelUpate.transform.ty = self.labelUpate.frame.height * 1.75
        
        self.labelUpate.layer.masksToBounds = true
        self.labelUpate.layer.cornerRadius = self.labelUpate.frame.height/5
        
        
        self.imageMan.transform.tx = self.imageMan.frame.width * 0.056818181
        self.imageMan.transform.ty = self.imageMan.frame.height * 0.55477855
        
        
        self.labelDataBeak.transform.tx = self.labelDataBeak.frame.width * 1.06010929
        self.labelDataBeak.transform.ty = self.labelDataBeak.frame.height * 0.7828947
        
        self.labelDataBeak.layer.masksToBounds = true
        self.labelDataBeak.layer.cornerRadius = self.labelUpate.frame.height/5
        
        
        self.labelValConst.transform.tx = self.labelValConst.frame.width * 1.583941606
        self.labelValConst.transform.ty = self.labelValConst.frame.height * 4.6
        
        
        self.labelVal.transform.tx = self.labelVal.frame.width * 1.137931
        self.labelVal.transform.ty = self.labelVal.frame.height * 4.27027027
        
        self.labelVal.layer.masksToBounds = true
        self.labelVal.layer.cornerRadius = self.labelUpate.frame.height/5
        
        self.labelRateConst.transform.tx = self.labelRateConst.frame.width * 1.583941606
        self.labelRateConst.transform.ty = self.labelRateConst.frame.height * 7.25454545
        
        
        self.labelRate.transform.tx = self.labelRate.frame.width * 1.137931
        self.labelRate.transform.ty = self.labelRate.frame.height * 6.28324324
        
        self.labelRate.layer.masksToBounds = true
        self.labelRate.layer.cornerRadius = self.labelUpate.frame.height/5
        
        
        self.segmentChooseVal.transform.tx = self.segmentChooseVal.frame.width * 0.044321329
        self.segmentChooseVal.transform.ty = self.segmentChooseVal.frame.height * 21.09375
        
        
        self.labelDataBeak.transform.tx += self.labelDataBeak.frame.width * 1.2
        
        self.labelValConst.transform.tx += self.labelValConst.frame.width * 1.2
        
        self.labelVal.transform.tx += self.labelVal.frame.width * 1.2
        
        
        self.labelRateConst.transform.tx += self.labelRateConst.frame.width * 1.2
        
        self.labelRate.transform.tx += self.labelRate.frame.width * 1.2
        
        UIView.animate(withDuration: 1.2, animations: {
            self.labelUdateTextConst.alpha = 1
            self.labelUpate.alpha = 1
            self.imageMan.alpha = 1
            self.segmentChooseVal.alpha = 1
            
            
            self.labelDataBeak.transform.tx -= self.labelDataBeak.frame.width * 1.2
            
            self.labelValConst.transform.tx -= self.labelValConst.frame.width * 1.2
            
            self.labelVal.transform.tx -= self.labelVal.frame.width * 1.2
            
            
            self.labelRateConst.transform.tx -= self.labelRateConst.frame.width * 1.2
            
            self.labelRate.transform.tx -= self.labelRate.frame.width * 1.2
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let updated = try await getBPIWell(url: constURL, req: "updated")
                let  usd = try await getBPIWell(url: constURL, req: "USD")
                labelUpate.text = updated[0]
                labelVal.text = usd[0]
                labelRate.text = usd[1]
                
            } catch {
                print("Error in Task")
            }
        }
         
    }
    
    @IBAction func chooseVal(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            updateVal(val: "USD")
        case 1:
            updateVal(val: "GBP")
        case 2:
            updateVal(val: "EUR")
        default:
            break
        }
    }
    
    func updateVal(val: String){
        UIView.animate(withDuration: 1, animations: {
            self.labelDataBeak.transform.tx += self.labelDataBeak.frame.width * 1.6
            
            self.labelValConst.transform.tx += self.labelValConst.frame.width * 1.6
            
            self.labelVal.transform.tx += self.labelVal.frame.width * 1.6
            
            
            self.labelRateConst.transform.tx += self.labelRateConst.frame.width * 1.6
            
            self.labelRate.transform.tx += self.labelRate.frame.width * 1.6
        }, completion: {_ in
            Task {
                do {
                    let  usd = try await getBPIWell(url: constURL, req: val)
                    self.labelVal.text = usd[0]
                    self.labelRate.text = usd[1]
                    
                } catch {
                    print("Error in Task")
                }
            }
        })
        
        
        UIView.animate(withDuration: 1, delay: 0.85, animations: {
            self.labelDataBeak.transform.tx -= self.labelDataBeak.frame.width * 1.6
            
            self.labelValConst.transform.tx -= self.labelValConst.frame.width * 1.6
            
            self.labelVal.transform.tx -= self.labelVal.frame.width * 1.6
            
            
            self.labelRateConst.transform.tx -= self.labelRateConst.frame.width * 1.6
            
            self.labelRate.transform.tx -= self.labelRate.frame.width * 1.6
        })
    }
}

