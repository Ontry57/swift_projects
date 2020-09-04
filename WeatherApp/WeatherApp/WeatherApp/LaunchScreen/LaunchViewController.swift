//
//  LaunchViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 04.09.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class LaunchView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let dotSize = 30
        let midY = Int(self.view.frame.height / 2)
        let midX = Int(self.view.frame.width / 2)
        
        let DotView1 = UIView()

        DotView1.frame = CGRect(x: midX - dotSize * 2, y: midY, width: dotSize, height: dotSize)
        DotView1.backgroundColor = UIColor.black
        DotView1.layer.cornerRadius = 20
        
        self.view.addSubview(DotView1)
        
        
        let DotView2 = UIView()

        DotView2.frame = CGRect(x: midX , y: midY, width: dotSize, height: dotSize)
        DotView2.backgroundColor = UIColor.black
        DotView2.layer.cornerRadius = 20
        
        self.view.addSubview(DotView2)
        
        
        let DotView3 = UIView()

        DotView3.frame = CGRect(x: midX + dotSize * 2 , y: midY, width: dotSize, height: dotSize)
        DotView3.backgroundColor = UIColor.black
        DotView3.layer.cornerRadius = 20
        
        self.view.addSubview(DotView3)
        
        
        UIView.animate(withDuration: 0.5, delay:0,options: [.autoreverse,.repeat,.curveEaseInOut],animations: {
            DotView1.frame.origin.y -= 100
            DotView1.frame.origin.y += 100
            DotView1.alpha = 0.0
            
        })
        
        UIView.animate(withDuration: 0.5,delay: 0.3, options: [.autoreverse,.repeat,.curveEaseInOut], animations: {
            DotView2.frame.origin.y -= 100
            DotView2.frame.origin.y += 100
            DotView2.alpha = 0.0
            
        }
        )
        
         UIView.animate(withDuration: 0.5,delay: 0.5, options: [.autoreverse,.repeat,.curveEaseInOut], animations: {
        
            DotView3.frame.origin.y -= 100
            DotView3.frame.origin.y += 100
            DotView3.alpha = 0.0
            
        })
        //self.view.translatesAutoresizingMaskIntoConstraints = false
        //firstDotView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

      
    }
    
  

}

