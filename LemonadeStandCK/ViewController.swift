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
    
    
    //Start Day variables
    var lemonadeRatio:CGFloat = 0
    

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
        if currentLemons > 0 {
            ++mixLemons
            --currentLemons
            currentLemonLabel.text = "\(currentLemons) Lemons"
            mixLemonsLabel.text = "\(mixLemons)"
            
        
        }
        else {
            println("No more Lemons for mix. all used up.")
        }
        
    }
  
    
    
    @IBAction func mixLemonMinusButtonPressed(sender: AnyObject) {
        if mixLemons > 0 {
            --mixLemons
            ++currentLemons
            currentLemonLabel.text = "\(currentLemons) Lemons"
            mixLemonsLabel.text = "\(mixLemons)"
            
        }
        
        else {
            println("You cannot use less lemons then 0 for one mix")
        }
    }
    
    
    
    @IBAction func mixIceCubesPlusButtonPressed(sender: AnyObject) {
        if currentIceCubes > 0 {
            --currentIceCubes
            ++mixIceCubes
            currentIceCubesLabel.text = "\(currentIceCubes) Ice Cubes"
            mixIceCubesLabel.text = "\(mixIceCubes)"
            
        }
        
        else {
            println("You already used up all available Ice Cubes")
        }
    }
    
    
    
    @IBAction func mixIceCubesMinusButtonPressed(sender: AnyObject) {
        if mixIceCubes > 0 {
            --mixIceCubes
            ++currentIceCubes
            currentIceCubesLabel.text = "\(currentIceCubes) Ice Cubes"
            mixIceCubesLabel.text = "\(mixIceCubes)"
            
        }
        
        else {
            println("You cannout use less then 0 for one mix")
        }
    }
    
    
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        
        createLemonadeRatio()
        resetLabelforNewDay()
        randomNumberOfCustomers()
    }

    func resetLabelforNewDay () {
        //reset labels for new day
        purchaseLemons = 0
        purchaseIceCubes = 0
        mixIceCubes = 0
        mixLemons = 0
        purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
        purchaseLemonLabel.text = "\(purchaseLemons)"
        mixIceCubesLabel.text = "\(mixIceCubes)"
        mixLemonsLabel.text = "\(mixLemons)"
    }
    
    func createLemonadeRatio () {
        //Create a lemonade ratio before we need to convert thes ints of the labels to floats
        var mixLemonsFloat = CGFloat(mixLemons)
        var mixIceCubesFloat = CGFloat(mixIceCubes)
        lemonadeRatio = mixLemonsFloat / mixIceCubesFloat
        println(lemonadeRatio)
    }
    
    func randomNumberOfCustomers () -> Int {
        var randomNumberCustomers = Int(arc4random_uniform(UInt32(10))) + 1
        println(randomNumberCustomers)
        return randomNumberCustomers
    }
    
}

