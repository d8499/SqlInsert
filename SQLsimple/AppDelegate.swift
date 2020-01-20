//
//  AppDelegate.swift
//  SQLsimple
//
//  Created by COE-028 on 09/01/20.
//  Copyright © 2020 COE-028. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //db Path
    var dbpath = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let docpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
       
        
        print(docpath)
        
        //database in document path
        self.dbpath = docpath + "/person.db"
        
        //filemanager's default fileExists dbpath exist or not
        if (!FileManager.default.fileExists(atPath: self.dbpath))
        {
            
            let bundleDbPath = Bundle.main.path(forResource: "person", ofType: "db")
           
            do{
                try FileManager.default.copyItem(atPath: bundleDbPath!, toPath: self.dbpath)
            }
            catch (let err as NSError)
            {
                print(err.localizedDescription)
            }
        }
        
        //then copy the dbManager code,bridging ,save delete data..
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

