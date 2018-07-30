//
//  Employee.swift
//  Airline
//
//  Created by MacStudent on 2018-07-30.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

class Employee {
     var empID : Int
    private var empName : String
    private var empEmail : String
    private var empMobile : String
    private var empAddress : String
    private var empDesignation : String
    private var empSIN : String
    
    var EmpID : Int {
        get{ return self.empID }
        set{ self.empID = newValue }
    }
    var EmpName : String {
        get{ return self.empName }
        set{ self.empName = newValue }
    }
    var EmpEmail : String {
        get{ return self.empEmail }
        set{ self.empEmail = newValue }
    }
    var EmpMobile : String {
        get{ return self.empMobile }
        set{ self.empMobile = newValue }
    }
    var EmpAddress : String {
        get{ return self.empAddress }
        set{ self.empAddress = newValue }
    }
    var EmpDesignation : String {
        get{ return self.empDesignation }
        set{ self.empDesignation = newValue }
    }
    var EmpSin : String {
        get{ return self.empSIN }
        set{ self.empSIN = newValue }
    }
    
    //default initializer
    init(){
        self.empID = 0
        self.empName = ""
        self.empEmail = ""
        self.empAddress = ""
        self.empDesignation = ""
        self.empSIN = ""
    }
}
