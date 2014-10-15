//
//  ViewController.swift
//  Bia
//
//  Created by DuyNT on 10/9/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball: UIImageView?
    var balla: UIImageView?
    var ball1: UIImageView?
    var ball2: UIImageView?
    var ball3: UIImageView?
    var ball4: UIImageView?
    var ball5: UIImageView?
    var ball6: UIImageView?
    var ban: UIView?
    var lo: UIView!
    var gay: UIView?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var vXa: Double = 0.0
    var vYa: Double = 0.0
    var xR: Double = 0.0
    var yR: Double = 0.0
    var width: Double = 0.0
    var hight: Double = 0.0
    var R: Double = 32
    var time: NSTimer?

    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        
        let size = self.view.bounds.size
        
        ban = UIView(frame: CGRect(x: size.width * 0.1, y: size.height * 0.1, width: size.width * 0.8, height: size.height * 0.8))
        ban?.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(ban!)

        var size1 = self.ban!.bounds.size
        width = Double(size1.width)
        hight = Double(size1.height)
        
        let que = UIView(frame: CGRect(x: size.width * 0.19, y: size.height * 0.12, width: (size.width * 0.75) - (size.width * 0.13), height: 3))
        que.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que)
        
        let que1 = UIView(frame: CGRect(x: size.width * 0.19, y: size.height * 0.875, width: (size.width * 0.75) - (size.width * 0.13), height: 3))
        que1.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que1)

        let que2 = UIView(frame: CGRect(x: size.width * 0.14, y: size.height * 0.155, width: 3, height: (size.width * 0.70) - (size.width * 0.13)))
        que2.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que2)
        
        let que3 = UIView(frame: CGRect(x: size.width * 0.14, y: size.height * 0.525, width: 3, height: (size.width * 0.70) - (size.width * 0.13)))
        que3.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que3)
        
        let que4 = UIView(frame: CGRect(x: size.height * 0.48, y: size.height * 0.525, width: 3, height: (size.width * 0.70) - (size.width * 0.13)))
        que4.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que4)
        
        let que5 = UIView(frame: CGRect(x: size.height * 0.48, y: size.height * 0.155, width: 3, height: (size.width * 0.70) - (size.width * 0.13)))
        que5.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(que5)
        
        ball = UIImageView(image: UIImage(named: "football.png"))
        ball?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        ball?.center = CGPoint(x: size.width * 0.5, y: (size.height - 60) * 0.5)
        ban!.addSubview(ball!)

        balla = UIImageView(image: UIImage(named: "football.png"))
        balla?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        balla?.center = CGPoint(x: size.width * 0.2, y: (size.height - 60) * 0.5)
        ban!.addSubview(balla!)
        
        ball1 = UIImageView(image: UIImage(named: "football.png"))
        ball1?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball1?.center = CGPoint(x: size.width * 0.76, y: size.height * 0.4)
        ban!.addSubview(ball1!)

        ball2 = UIImageView(image: UIImage(named: "football.png"))
        ball2?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball2?.center = CGPoint(x: size.width * 0.75, y: size.height * 0.029)
        ban!.addSubview(ball2!)

        ball3 = UIImageView(image: UIImage(named: "football.png"))
        ball3?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball3?.center = CGPoint(x: size.width * 0.75, y: size.height * 0.771)
        ban!.addSubview(ball3!)

        ball4 = UIImageView(image: UIImage(named: "football.png"))
        ball4?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball4?.center = CGPoint(x: size.width * 0.05, y: size.height * 0.029)
        ban!.addSubview(ball4!)

        ball5 = UIImageView(image: UIImage(named: "football.png"))
        ball5?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball5?.center = CGPoint(x: size.width * 0.04, y: size.height * 0.4)
        ban!.addSubview(ball5!)

        ball6 = UIImageView(image: UIImage(named: "football.png"))
        ball6?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        ball6?.center = CGPoint(x: size.width * 0.047, y: size.height * 0.771)
        ban!.addSubview(ball6!)

        gay = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 200))
        gay?.backgroundColor = UIColor.blackColor()
        gay?.center = CGPoint(x: size.width * 0.5 - 2, y: (size.height * 0.5) + 100)
        ban!.addSubview(gay!)
        gay!.multipleTouchEnabled = true
        gay!.userInteractionEnabled = true

        let ballPan = UIPanGestureRecognizer(target: self, action: "ballPan:")
        ban!.addGestureRecognizer(ballPan)
        
        let gayPan = UIPanGestureRecognizer(target: self, action: "gayPan:")
        ban!.addGestureRecognizer(gayPan)
        let gayQuay = UIRotationGestureRecognizer(target: self, action: "gayQuay:")
        gay!.addGestureRecognizer(gayQuay)
        
        time = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "loop:", userInfo: nil, repeats: true)
        time?.fire()
    }
    func gayQuay(gayQuay: UIRotationGestureRecognizer){
        gay?.center = gayQuay.locationInView(self.view)
        gay?.transform = CGAffineTransformMakeRotation(gayQuay.rotation)
    }
    
    func ballPanToballa(ballPan: UIPanGestureRecognizer){
        if ballPan.state == UIGestureRecognizerState.Began || ballPan.state == UIGestureRecognizerState.Changed{
            balla!.center = ballPan.locationInView(self.ban!)
        }
        
        if CGRectIntersectsRect(ball!.frame, balla!.frame){
            let velocity = ballPan.velocityInView(ban)
            vXa += Double(velocity.x) * 3 / width
            vYa += Double(velocity.y) * 3 / hight
        }
    }
    
    func ballPan(ballPan: UIPanGestureRecognizer){
        if ballPan.state == UIGestureRecognizerState.Began || ballPan.state == UIGestureRecognizerState.Changed{
            ball?.center = ballPan.locationInView(self.ban!)
        }
        
        if CGRectIntersectsRect(ball!.frame, balla!.frame){
            let velocity = ballPan.velocityInView(ban)
            vXa += Double(velocity.x) * 5 / width
            vYa += Double(velocity.y) * 5 / hight
        }
    }
    
    func gayPan(gayPan: UIPanGestureRecognizer){
        if gayPan.state == UIGestureRecognizerState.Began || gayPan.state == UIGestureRecognizerState.Changed{
            gay?.center = gayPan.locationInView(self.ban!)

        }
        if CGRectIntersectsRect(gay!.frame, ball!.frame){
            let velocity = gayPan.velocityInView(ban)
            vX += Double(velocity.x) * 5 / width
            vY += Double(velocity.y) * 5 / hight
        }
        
        if CGRectIntersectsRect(gay!.frame, balla!.frame){
            let velocity = gayPan.velocityInView(ban)
            vXa += Double(velocity.x) * 5 / width
            vYa += Double(velocity.y) * 5 / hight
        }

        if CGRectIntersectsRect(ball!.frame, ball1!.frame){
            ball!.removeFromSuperview()
        }
        if CGRectIntersectsRect(ball!.frame, ball2!.frame){
            ball!.removeFromSuperview()
        }
        if CGRectIntersectsRect(ball!.frame, ball3!.frame){
            ball!.removeFromSuperview()
        }
        if CGRectIntersectsRect(ball!.frame, ball4!.frame){
            ball!.removeFromSuperview()
        }
        if CGRectIntersectsRect(ball!.frame, ball5!.frame){
            ball!.removeFromSuperview()
        }
        if CGRectIntersectsRect(ball!.frame, ball6!.frame){
            ball!.removeFromSuperview()
        }
    }
    
    func loop(nstime: NSTimer){
        var x1 = Double(ball!.center.x) + vX
        var y1 = Double(ball!.center.y) + vY
        
        var x2 = Double(balla!.center.x) + vXa
        var y2 = Double(balla!.center.y) + vYa
        
        self.ban!.layer.cornerRadius = 10
        self.ban!.layer.masksToBounds = true
        
        if x1 < R {
            x1 = R
            vX = -vX
        }
        if x1 > width - R {
            x1 = width - R
            vX = -vX
        }
        if y1 < R{
            y1 = R
            vY = -vY
        }
        if y1 > hight - R{
            y1 = hight - R
            vY = -vY
        }
        
        if x2 < R {
            x2 = R
            vXa = -vXa
        }
        if x2 > width - R {
            x2 = width - R
            vXa = -vXa
        }
        if y2 < R{
            y2 = R
            vYa = -vYa
        }
        if y2 > hight - R{
            y2 = hight - R
            vYa = -vYa
        }
        
        if CGRectIntersectsRect(ball!.frame, balla!.frame){
            ball?.center = CGPoint(x: x1 - 2, y: y1 - 2)
            balla?.center = CGPoint(x: x2 + 2, y: y2 + 2)
        }
        
        ball?.center = CGPoint(x: x1, y: y1)
        balla?.center = CGPoint(x: x2, y: y2)
        vX = 0.9 * vX
        vY = 0.9 * vY
        
        vXa = 0.9 * vXa
        vYa = 0.9 * vYa
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        time?.invalidate()
        time = nil
    }
}

