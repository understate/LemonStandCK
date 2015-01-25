//
//  Customer.swift
//  LemonadeStandCK
//
//  Created by Christian Köhler on 23.01.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import Foundation


class Customer {
    var index = 0
    var tastePreference = 0.0
    var paid = true
}

//erster Versuch den Customern eine Tastepreference zu übergeben
//class func createTastePreference (numberOfCustomer: Int) -> [Customer] {
//    var customers = [Customer]
//    for customer in numberOfCustomer {
//        var customer = Customer()
//        customer.tastePreference = 1
//        println("I am customer no. \(customer) and my taste preference is \(tastePreference)")
//        append.customer(Customers)
//        
//    }
//    return customers
//}