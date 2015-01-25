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
    
    @IBOutlet weak var currentWeather: UIImageView!
    
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
    var numberOfCustomers: Int = 0
    var lemonadeRatioThisDay:CGFloat = 0
    

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
        numberOfCustomers = randomNumberOfCustomers()
        randomWeather()
        println("Today you have \(numberOfCustomers) customers at your stand")
        //createRandomTastePreference()
        currentEuro = currentEuro + earningsForTheDay(numberOfCustomers)
        currentEuroLabel.text = "\(currentEuro) €"
        resetLabelforNewDay()
    }

    
    
    ///////////
    //This is the section for helpe functions
    //////////
    
    //reset labels for new day
    func resetLabelforNewDay () {
        purchaseLemons = 0
        purchaseIceCubes = 0
        mixIceCubes = 0
        mixLemons = 0
        purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
        purchaseLemonLabel.text = "\(purchaseLemons)"
        mixIceCubesLabel.text = "\(mixIceCubes)"
        mixLemonsLabel.text = "\(mixLemons)"
    }
    
    //Create a lemonade ratio before we need to convert these int's of the labels to floats
    func createLemonadeRatio () {
        var mixLemonsFloat = CGFloat(mixLemons)
        var mixIceCubesFloat = CGFloat(mixIceCubes)
        lemonadeRatio = mixLemonsFloat / mixIceCubesFloat
        if lemonadeRatio > 1 {
            println("The lemonade ratio today \(lemonadeRatio) ACIDIC LEMONADE")
        }
        else if lemonadeRatio == 1 {
            println("The lemonade ratio today \(lemonadeRatio) EQUAL PARTS LEMONADE")
        }
        
        else {
        println("The lemonade ratio today \(lemonadeRatio) DILUTED LEMONADE")
        }
    }
    
    //create a random number of customers
    func randomNumberOfCustomers () -> Int {
        var randomNumberCustomers = Int(arc4random_uniform(UInt32(10))) + 1
        println(randomNumberCustomers)
        return randomNumberCustomers
    }
   
    func randomWeather () {
        var currentWeatherState = Int(arc4random_uniform(UInt32(2)))
        println(currentWeatherState)
        switch currentWeatherState {
        case 0:
            println("Cold Weather")
            currentWeather.image = UIImage(named: "Cold.png")
            numberOfCustomers = numberOfCustomers - 3
        case 1:
            println("Mild Weather")
            currentWeather.image = UIImage(named: "Mild.png")
        case 2:
            println("Warm Weather")
            currentWeather.image = UIImage(named: "Warm.png")
            numberOfCustomers = numberOfCustomers * 2
            
        default:
            println("Error")
        }
    }
    
    //create a taste preference
    func createRandomTastePreference () -> Double {
        let randomTastePreference = (Double(arc4random_uniform(UInt32(10))) + 1.0) / 10
        
        if randomTastePreference < 0.4 {
            println("Taste preference for this customer is \(randomTastePreference) which is ACIDIC LEMONADE")
        }
        
        else if randomTastePreference > 0.6 {
            println("Taste preference for this customer is \(randomTastePreference) which is DILUTED LEMONADE")
        }
            
        else {
            println("Taste preference for this customer is \(randomTastePreference) which is EQUAL PARTS LEMONADE")
        }
        
        
        return randomTastePreference
    }
    
    //compute earnings for the day
    func earningsForTheDay (customersThisDay: Int) -> Int {
        var earnings = 0
        var customer = Customer()
        println("Count of customers to compute earnings: \(customersThisDay)")
        
        for customer.index = 0; customer.index < customersThisDay; ++customer.index
        {
            customer.tastePreference = createRandomTastePreference()
            println("I am customer \(customer.index + 1) my taste preference: \(customer.tastePreference) lemonade ratio is: \(lemonadeRatio)")
            
            if customer.tastePreference < 0.4 && lemonadeRatio > 1.0 {
                ++earnings
                println("PAID")
            }
            
            else if customer.tastePreference > 0.6 && lemonadeRatio < 1.0 {
                ++earnings
                println("PAID")
            }
            
            else if customer.tastePreference >= 0.4 && customer.tastePreference <= 0.6 && lemonadeRatio == 1.0 {
                ++earnings
                println("PAID")
            }
                
            else {
                println("NOT paid")
            }
        
        }
        
        println("These are the final earnings for the day: EUR \(earnings)")
        
        return earnings
    
    }
    
    
}

