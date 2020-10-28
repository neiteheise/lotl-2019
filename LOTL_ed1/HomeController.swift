//
//  HomeController.swift
//  LOTL_ed1
//
//  Created by Nathan Hellmuth on 5/30/19.
//  Copyright © 2019 Lighting of the Lawn. All rights reserved.
// leading: -246 trailing: 420

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    let dayhourminlab = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
    
    @IBOutlet weak var menuview: UIView!
    
    var menuout = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        let sheight = scrsize.height
        
        leading.constant = -240
        trailing.constant = swidth
        //self.navigationController?.navigationBar.isTranslucent = true
        //self.navigationController?.navigationBar.barTintColor  = UIColor(displayP3Red: 120, green: 150, blue: 255, alpha: 0.5)
        navBarImage()
        
        let snowGif = UIImage.gifImageWithName("snow2")
        let imageView1 = UIImageView(image: snowGif)
        imageView1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        imageView1.contentMode = .scaleAspectFill
        view.addSubview(imageView1)
        let snowGif2 = UIImage.gifImageWithName("snow2")
        let imageView3 = UIImageView(image: snowGif2)
        imageView3.frame = CGRect(x: 0, y: imageView1.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height / 2.2)
        imageView3.contentMode = .scaleAspectFill
        view.addSubview(imageView3)
        let snowGif3 = UIImage.gifImageWithName("snow2")
        let imageView4 = UIImageView(image: snowGif3)
        imageView4.frame = CGRect(x: 0, y: imageView3.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height / 2)
        imageView4.contentMode = .scaleAspectFill
        view.addSubview(imageView4)
        
        let name = #imageLiteral(resourceName: "LOTL name")
        let imageView2 = UIImageView(image: name)
        imageView2.frame = CGRect(x: 0, y: scrsize.minY + swidth / 3, width: swidth, height: sheight / 2 - name.size.height)
        imageView2.contentMode = .scaleAspectFit
        view.addSubview(imageView2)
        
        dayhourminlab.textAlignment = .center
        dayhourminlab.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 15)
        dayhourminlab.font = UIFont.systemFont(ofSize: 25)
        dayhourminlab.text = "Days   Hours   Minutes  Seconds"
        dayhourminlab.textColor = UIColor(red:0.13, green:0.12, blue:0.13, alpha:1.0)
        view.addSubview(dayhourminlab)
        
        startTimer()
        menuview.superview?.bringSubviewToFront(menuview)
        
//        var currentVCStack = self.navigationController?.viewControllers
//        print(currentVCStack!.count)
//        if(currentVCStack!.count > 10){
//            cleanstack()
//        }
    
        // Do any additional setup after loading the view.
    }
    
    func navBarImage(){
        let navControl = navigationController!
        navControl.navigationBar.barStyle = UIBarStyle.black;
        
        let image = #imageLiteral(resourceName: "Bar image")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navControl.navigationBar.frame.size.width
        let bannerHeight = navControl.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width
        let bannerY = bannerHeight / 2 - image.size.height
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height : bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
        
        let imgvb = UIImage(named: "Hamburger_icon.svg")
        let button = UIBarButtonItem(image: imgvb, style: .plain, target: self, action: #selector(menuslide))
        button.image = imgvb
        button.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = button
        
        let button2 = UIBarButtonItem()
        button2.title = "            "
        button2.tintColor = UIColor(red:0.00, green:0.00, blue:0.15, alpha:1.0)
        navigationItem.rightBarButtonItem = button2
        
    }
    
    @objc func menuslide(_ sender: UIBarButtonItem!) {
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        if !menuout {
            leading.constant = -240
            trailing.constant = swidth
            menuout = true
        }
        else if menuout {
            leading.constant = 0
            trailing.constant = swidth - 240
            menuout = false
        }
        UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
    }
    
    func getCurrentMillis()->Int64{
        return  Int64(NSDate().timeIntervalSince1970 * 1000)
    }

    //var CurrentTime : Double = CACurrentMediaTime();
    var kickOffTime : Int64 = 1575590400000;
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let d = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let h = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let m = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let s = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    var countdownTimer: Timer!
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }

    @objc func countdown(){
            let currentTime = getCurrentMillis()
            let timeDif = kickOffTime - currentTime;
            if(timeDif <= 0 && timeDif > -3600000){
                self.label.text = "LOTL is Here!!!"
            }
            else if(timeDif <= 0){
                self.label.text = ""
                dayhourminlab.text = ""
            }
            else{
            //print(String(timeDif))
            let timeDifInt = Int(timeDif/1000);
            //print(String(timeDifInt))
            let days = timeDifInt/86400;
                d.text = String(days)
//            inwords += " "
//            inwords += String(days)
//            inwords += "     "
            let hours = (timeDifInt - days*86400)/3600;
                h.text = String(hours)
//            inwords += String(hours)
//            inwords += "        "
            let minutes = (timeDifInt - days*86400 - hours*3600)/60;
                m.text = String(minutes)
//            inwords += String(minutes)
//            inwords += "      "
            let seconds = timeDifInt - days*86400 - hours*3600 - minutes*60
                s.text = String(seconds)
//            inwords += String(seconds)
//            inwords += "    "

//                self.label.text = inwords
                
        }
    
//        label.font = label.font.withSize(45)
//        label.textColor = UIColor.white
//        self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 35)
//        self.label.textAlignment = .center
        d.font = d.font.withSize(40)
        h.font = h.font.withSize(40)
        m.font = m.font.withSize(40)
        s.font = s.font.withSize(40)
        d.textColor = UIColor(red:0.13, green:0.12, blue:0.13, alpha:1.0)
        h.textColor = UIColor(red:0.13, green:0.12, blue:0.13, alpha:1.0)
        m.textColor = UIColor(red:0.13, green:0.12, blue:0.13, alpha:1.0)
        s.textColor = UIColor(red:0.13, green:0.12, blue:0.13, alpha:1.0)
        self.d.center = CGPoint(x: self.view.center.x/3.5, y: self.view.center.y + 35)
        self.h.center = CGPoint(x: self.view.center.x/1.55, y: self.view.center.y + 35)
        self.m.center = CGPoint(x: self.view.center.x * 1.1, y: self.view.center.y + 35)
        self.s.center = CGPoint(x: self.view.center.x * 1.65, y: self.view.center.y + 35)
        self.d.textAlignment = .center
        self.h.textAlignment = .center
        self.m.textAlignment = .center
        self.s.textAlignment = .center
        
        //self.view.addSubview(label)
        self.view.addSubview(d)
        self.view.addSubview(h)
        self.view.addSubview(m)
        self.view.addSubview(s)
        menuview.superview?.bringSubviewToFront(menuview)
    
        }

//    func cleanstack(){
//        var currentVCStack = self.navigationController?.viewControllers
//        currentVCStack?.removeSubrange(1...)
//
//        let fresVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homecont")
//        currentVCStack?.append(fresVC)
//
//        self.navigationController?.setViewControllers(currentVCStack!, animated: false)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
