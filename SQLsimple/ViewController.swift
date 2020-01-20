//
//  ViewController.swift
//  SQLsimple
//
//  Created by COE-028 on 09/01/20.
//  Copyright © 2020 COE-028. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtId: UITextField!
    
    
    var dbobj:dbManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        dbobj = dbManager()
      
        /*     if (dbobj?.RunCommand(cmdText: "insert into user(name,id) values('abc','123')"))!
        {
            print("data inserted")
        }
        else
        {
            print("not inserted")
 
         }
  */
    }

    @IBAction func btnSave(_ sender: UIButton)
    {
        if( dbobj?.RunCommand(cmdText: "insert into user(name,id) values ('\(txtName.text!)','\(txtId.text!)')") )!
       {
        print("Data inserted")
        }
        else
        {
          print("Data is Not inserted")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

