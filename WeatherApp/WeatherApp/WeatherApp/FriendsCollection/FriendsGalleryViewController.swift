//
//  FriendsGalleryViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 07.09.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class FriendsGalleryViewController: UIViewController {
    
    let imagesGallery = ["a1", "a2", "a3"]
    let imageWidth: CGFloat = 300
    var interactiveAnimator: UIViewPropertyAnimator!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<imagesGallery.count {
            let newView = UIImageView(frame: CGRect(x: imageWidth*CGFloat(i), y: 200, width: imageWidth, height: 300))
            newView.image = UIImage(named: imagesGallery[i])
            view.addSubview(newView)
        }
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        view.addGestureRecognizer(pan)
    }
    

    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            
            print("start")
            interactiveAnimator?.startAnimation()
            
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         dampingRatio: 0.5,
                                                         animations: {
                self.view.transform = CGAffineTransform(translationX: 0,
                                                              y: 150)
            })
            
            interactiveAnimator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = translation.y / 100
        case .ended:
            interactiveAnimator.stopAnimation(true)
            
            interactiveAnimator.addAnimations {
                self.view.transform = .identity
            }
            
            interactiveAnimator.startAnimation()
        default: return
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
