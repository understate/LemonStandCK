//
//  ViewController.swift
//  LemonadeStandCK
//
//  Created by Christian Köhler on 20.01.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Label Declaration . Main Storyboard
    @IBOutlet weak var currentEuroLabel: UILabel!
    
    @IBOutlet weak var currentLemonLabel: UILabel!
    
    @IBOutlet weak var currentIceCubesLabel: UILabel!
    
    @IBOutlet weak var purchaseLemonLabel: UILabel!
    
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    @IBOutlet weak var mixLemonsLabel: UILabel!
    
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    
    // Stats Label Varibales
    var currentEuro = 10
    var currentLemons:Int = 1
    var currentIceCubes:Int = 1

    
    
    // Purchase Variables
    var purchaseLemons:Int = 0
    var purchaseIceCubes:Int = 0
    
    
    // Mix Variables
    var mixLemons:Int = 0
    var mixIceCubes:Int  = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonPlusButtonPressed(sender: AnyObject) {
        if currentEuro < 2 {
            println("Not enough budget")
            }
        else {
        ++purchaseLemons
        purchaseLemonLabel.text = "\(purchaseLemons)"
        ++currentLemons
        currentLemonLabel.text = "\(currentLemons) Lemons"
        currentEuro = currentEuro - 2
        currentEuroLabel.text = "\(currentEuro) €"
        }
        
    }
    
    
    @IBAction func purchaseLemonMinusButtonPressed(sender: AnyObject) {
        if currentLemons > 0 {
        --purchaseLemons
        purchaseLemonLabel.text = "\(purchaseLemons)"
        --currentLemons
        currentLemonLabel.text = "\(currentLemons) Lemons"
        currentEuro = currentEuro + 2
        currentEuroLabel.text = "\(currentEuro) €"
        }
        else {
            println("No lemon to sell")
        }
        
    }
    
    @IBAction func purchaseIceCubesPlusButtonPressed(sender: AnyObject) {
        if currentEuro > 0 {
            ++currentIceCubes
            ++purchaseIceCubes
            --currentEuro
            currentIceCubesLabel.text = "\(currentIceCubes) Ice Cubes"
            purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
            currentEuroLabel.text = "\(currentEuro) €"
        }
        else {
            println ("Not enough budget")
        }
    }
    
    
    
    @IBAction func purchaseIceCubesMinusButtonPressed(sender: AnyObject) {
        if currentIceCubes > 0 {
            --currentIceCubes
            --purchaseIceCubes
            ++currentEuro
            currentIceCubesLabel.text = "\(currentIceCubes) Ice Cubes"
            purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
            currentEuroLabel.text = "\(currentEuro) €"
            
        }
        else {
            println("no more Ice Cubes")
        }
    }
    
    
    
    @IBAction func mixLemonPlusButtonPressed(sender: AnyObject) {
    }
  
    
    
    @IBAction func mixLemonMinusButtonPressed(sender: AnyObject) {
    }
    
    
    
    @IBAction func mixIceCubesPlusButtonPressed(sender: AnyObject) {
    }
    
    
    
    @IBAction func mixIceCubesMinusButtonPressed(sender: AnyObject) {
    }
    
    
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }

}

