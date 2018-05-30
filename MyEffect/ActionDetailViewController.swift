//
//  ActionDetailViewController.swift
//  MyEffect
//
//  Created by Patricia Freire Sestari on 24/05/18.
//  Copyright © 2018 MyEffect. All rights reserved.
//

import UIKit
import GoogleMaps

class ActionDetailViewController: UIViewController {

    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var actionImage: UIImageView!
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var activityIndicator: UIView!
    @IBOutlet weak var friendsIcon: UIImageView!
    @IBOutlet weak var usersRate: UILabel!
    @IBOutlet weak var actionDate: UILabel!
    @IBOutlet weak var actionCredits: UIButton!
    @IBOutlet weak var activityCathegory: UIView!
    @IBOutlet weak var card: MDCCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        actionTitle.text = actionsNames[0]
        
        //let frametosee = action.activityIndicator.frame
        let activityIndicatorTemp = MDCActivityIndicator()
        activityIndicator.addSubview(activityIndicatorTemp)
        activityIndicatorTemp.indicatorMode = .determinate
        let vals = actionsRate[0]
        activityIndicatorTemp.progress = Float(vals[0])/Float(vals[1])
        activityIndicatorTemp.radius = activityIndicator.frame.width/2
        activityIndicatorTemp.sizeToFit()
        activityIndicatorTemp.transform = activityIndicatorTemp.transform.rotated(by: (-0.5)*CGFloat(Double.pi))
        activityIndicatorTemp.cycleColors = [UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)]
        activityIndicatorTemp.startAnimating()
        
        // To make the activity indicator disappear:
        //activityIndicator.stopAnimating()
        
        actionImage.image = actionsImages[0]
        //Rounded image
        actionImage.layer.cornerRadius = actionImage.frame.size.width/2
        actionImage.clipsToBounds = true
        card.bringSubview(toFront: actionImage)
        
        usersRate.text = "\(vals[0])/\(vals[1])"
        
        //adding date
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        let dates = actionsDate[0]
        let dateStart = dateFormatterGet.date(from: dates[0])
        //action.actionDate.text = "\(dateFormatterPrint.string(from:dateStart!))"
        if(dates.count>1){
            let dateEnd = dateFormatterGet.date(from: dates[1])
            actionDate.text = "\(dateFormatterPrint.string(from:dateStart!)) - \(dateFormatterPrint.string(from:dateEnd!))"
        }
        else{
            actionDate.text = "\(dateFormatterPrint.string(from:dateStart!))"
        }
        
        //adding credits
        
        actionCredits.setTitle(actionsCredits[0].description, for: .normal)
        
        //if(action.activityCathegory.subviews.count == 0){
            //adding cathegory
            let cats: Array<UIImage> = actionsCategory[0]
            //print(indexPath.row.description)
            var ind = 0;
            
            while(ind < cats.count){
                let imgView = UIImageView(frame: CGRect(x: 180-(30*ind), y: 0, width: 25, height: 25))
                imgView.image = cats[ind]
                activityCathegory.addSubview(imgView)
                ind = ind + 1;
            }
        //}
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
