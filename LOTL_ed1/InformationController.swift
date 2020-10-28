//
//  InformationController.swift
//  LOTL_ed1
//
//  Created by Nathan Hellmuth on 5/30/19.
//  Copyright © 2019 Lighting of the Lawn. All rights reserved.
//

import UIKit

class InformationController: UIViewController {

    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var menuview: UIView!
    
    var menuout = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrsize:  CGRect = UIScreen.main.bounds
        let swidth = scrsize.width
        leading.constant = -240
        trailing.constant = swidth
        navBarImage()
        content()
        menuview.superview?.bringSubviewToFront(menuview)
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
        button2.tintColor = UIColor(red:0.00, green:0.12, blue:0.42, alpha:1.0)
        navigationItem.rightBarButtonItem = button2
                  
    }
    
    func content(){
        let screensize: CGRect = UIScreen.main.bounds
        let swidth = screensize.width
        let sheight = screensize.height
        
        let contView = UIView(frame: CGRect(x: 0, y: 0, width: swidth, height: sheight))
        
        
        view.addSubview(contView)
        
        //header
        let image = #imageLiteral(resourceName: "informationheaderfinal")
        let imageView = UIImageView(image: image)
        
        let iWidth = contView.frame.width
        let iHeight = image.size.height / 1.2
        let iX = contView.frame.minX
        let iY = navigationController!.navigationBar.frame.maxY / 2
        imageView.sizeToFit()
        imageView.frame = CGRect(x: iX, y: iY, width: iWidth, height : (iHeight / 2) - 20)
        imageView.contentMode = .scaleAspectFill
        contView.addSubview(imageView)
        
        //access button
        let uiim = UIImage(named: "informationaccess")
        let faqbutton = UIButton()
        faqbutton.setImage(uiim, for: .normal)
        
        let iWidth2 = swidth
        let iHeight2 = uiim?.size.height
        let iX2 = contView.frame.minX
        let iY2 = (imageView.frame.size.height + navigationController!.navigationBar.frame.size.height)
        //imageView2.sizeToFit()
        faqbutton.frame = CGRect(x: iX2, y: iY2, width: iWidth2, height : iHeight2!)
        faqbutton.addTarget(self, action: #selector(toFAQ), for: .touchUpInside)
        //faqbutton.contentMode = .scaleAspectFit
        faqbutton.layer.cornerRadius = 5
        faqbutton.layer.borderWidth = 3
        faqbutton.layer.borderColor = UIColor(red:1.00, green:0.78, blue:0.39, alpha:1.0).cgColor
        
        contView.addSubview(faqbutton)
        
        //maps button
        let uiim2 = UIImage(named: "informationmaps-1")
        let mapsbutton = UIButton()
        mapsbutton.setImage(uiim2, for: .normal)
        
        let iWidth3 = swidth
        let iHeight3 = uiim2?.size.height
        let iX3 = contView.frame.minX
        let iY3 = (faqbutton.frame.maxY + 5)
        //imageView2.sizeToFit()
        mapsbutton.frame = CGRect(x: iX3, y: iY3, width: iWidth3, height : iHeight3!)
        mapsbutton.addTarget(self, action: #selector(toEMaps), for: .touchUpInside)
        //faqbutton.contentMode = .scaleAspectFit
        mapsbutton.layer.cornerRadius = 5
        mapsbutton.layer.borderWidth = 3
        mapsbutton.layer.borderColor = UIColor(red:1.00, green:0.78, blue:0.39, alpha:1.0).cgColor
        
        contView.addSubview(mapsbutton)
        
        //event norms button
        let uiim3 = UIImage(named: "informationeventnorms-1")
        let enbutton = UIButton()
        enbutton.setImage(uiim3, for: .normal)
        
        let iWidth4 = swidth
        let iHeight4 = uiim3?.size.height
        let iX4 = contView.frame.minX
        let iY4 = (mapsbutton.frame.maxY + 5)
        //imageView2.sizeToFit()
        enbutton.frame = CGRect(x: iX4, y: iY4, width: iWidth4, height : iHeight4!)
        enbutton.addTarget(self, action: #selector(toENorms), for: .touchUpInside)
        //faqbutton.contentMode = .scaleAspectFit
        enbutton.layer.cornerRadius = 5
        enbutton.layer.borderWidth = 3
        enbutton.layer.borderColor = UIColor(red:1.00, green:0.78, blue:0.39, alpha:1.0).cgColor
        
        contView.addSubview(enbutton)
        
        let lightGif = UIImage.gifImageWithName("lotlgifgood")
        let imageView1 = UIImageView(image: lightGif)
        imageView1.frame = CGRect(x: 0, y: enbutton.frame.maxY , width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        imageView1.contentMode = .scaleAspectFill
        contView.addSubview(imageView1)
        
        
    }
    
    @objc func toFAQ(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let faqViewController = storyBoard.instantiateViewController(withIdentifier: "accessibilitycont") as! AccessController
        self.navigationController?.pushViewController(faqViewController, animated: false)
    }
    
    @objc func toEMaps(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let faqViewController = storyBoard.instantiateViewController(withIdentifier: "mapsandseccontroller") as! SecurityController
        self.navigationController?.pushViewController(faqViewController, animated: false)
    }
    
    @objc func toENorms(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let faqViewController = storyBoard.instantiateViewController(withIdentifier: "enormscont") as! ENormsController
        self.navigationController?.pushViewController(faqViewController, animated: false)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
