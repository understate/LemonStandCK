//
//  ViewController.swift
//  LemonadeStandCK
//
//  Created by Christian Köhler on 20.01.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentEuroLabel: UILabel!
    
    @IBOutlet weak var currentLemonLabel: UILabel!
    
    @IBOutlet weak var currentIceCubesLabel: UILabel!
    
    @IBOutlet weak var purchaseLemonLabel: UILabel!
    
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    @IBOutlet weak var mixLemonsLabel: UILabel!
    
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonPlusButtonPressed(sender: UIButton) {
    }
    
    
    @IBAction func purchaseLemonMinusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseIceCubesPlusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseIceCubesMinusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func mixLemonPlusButtonPressed(sender: UIButton) {
    }
  
    @IBAction func mixLemonMinusButtonPressed(sender: UIButton) {
    }
    
    
    @IBAction func mixIceCubesPlusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func mixIceCubesMinusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }

}

