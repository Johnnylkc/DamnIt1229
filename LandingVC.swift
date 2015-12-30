//
//  LandingVC.swift
//  DamnIt1229
//
//  Created by 劉坤昶 on 2015/12/29.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

import UIKit
import EventKit

class LandingVC: UIViewController {
    
   var addButton = UIButton()
   var cancelButton = UIButton()
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        addButton.frame = CGRectMake(0, 0, 100, 50)
        addButton.center = CGPointMake(self.view.frame.size.width/2, 100)
        addButton.setTitle("訂課", forState: .Normal)
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addButton.backgroundColor = UIColor.blueColor()
        addButton.addTarget(self, action: "addClass:", forControlEvents: .TouchUpInside)
        self.view.addSubview(addButton)
        
        
        cancelButton.frame = CGRectMake(0, 0, 100, 50)
        cancelButton.center = CGPointMake(self.view.frame.size.width/2, 300)
        cancelButton.setTitle("取消訂課", forState: .Normal)
        cancelButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cancelButton.backgroundColor = UIColor.redColor()
        cancelButton.addTarget(self, action: "cancelClass:", forControlEvents: .TouchUpInside)
        self.view.addSubview(cancelButton)
        
    }

    
    
    func addClass(sender:UIButton)
    {
        let eventStore: EKEventStore = EKEventStore ()
        
        eventStore.requestAccessToEntityType(.Event , completion: { granted, error in
       
            if (granted) && (error == nil ) {
                print ( "granted \(granted)" )
                print ( "error \(error)" )
                
                //// 新建一個事件
                let event: EKEvent = EKEvent (eventStore: eventStore)
                event.title = "新增一個測試事件333"
                event.startDate = NSDate (timeInterval: 5 * 60, sinceDate: NSDate())
                event.endDate = NSDate (timeInterval: 20*60, sinceDate: NSDate())
                event.notes = "這個是備註"
                event.calendar = eventStore.defaultCalendarForNewEvents
                
                event.timeZone = NSTimeZone(abbreviation: "Asia/Taipei");

                event.addAlarm(EKAlarm(relativeOffset: -60))
                
                               
                event.location = "worod gym 三重店"
                
                
                
                event.URL = NSURL(string: "www.google.com")
                
                
                do{
                    try eventStore.saveEvent(event, span: . ThisEvent )
                    print ( "Saved Event" )
                }catch{}
                
                print("okok")
                
                
            }
            
        })
       
    
    }///
    
    

    
    
    
    
    func cancelClass(sender:UIButton)
    {
        print("取消成功")
        
    }
    
    
    
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        
      
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
