//
//  dbManager.swift
//  SQLsimple
//
//  Created by COE-028 on 09/01/20.
//  Copyright © 2020 COE-028. All rights reserved.
//


//change "Foundation" to "Uikit"
import UIKit

//create class of type NsObject
class dbManager: NSObject {
    

   var dbLocation  = ""
    
    //pointer of DB
    var dbPointer:OpaquePointer?
    
    //then have our path from init method
    override init() {
        let appdel = UIApplication.shared.delegate as! AppDelegate
        
        //path of db from appdelegate to here
        self.dbLocation = appdel.dbpath
//now we can open db ,runCommand ,close db
        
    }
    
    func IsOpen() -> Bool
    {
        // .. Means it is open
        if sqlite3_open(dbLocation, &dbPointer) == SQLITE_OK
        {
            return true
        }
        return false
    }
    
    func RunCommand(cmdText:String) -> Bool
    {
        //check whether db is open or not>>
        if IsOpen()
        {
            var stmt:OpaquePointer?
            
    if sqlite3_prepare_v2(dbPointer, cmdText, -1, &stmt, nil) == SQLITE_OK
            {
                //step,finalise,close
                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                sqlite3_close(dbPointer)
                
                 return true
            }
            
           
        }
        
        return false
    }
    
    func RunQuery(cmdText:String)-> [[String:Any]]
    {
        let list = [[String:Any]]()
        
        if IsOpen()
        {
            var stmt:OpaquePointer?
            
            if (sqlite3_prepare_v2(dbPointer,cmdText , -1, &stmt, nil) == SQLITE_OK)
            {
                
                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                sqlite3_close(dbPointer)
            }
            
        }
        return list
    }
    
    
    
    
    
}

