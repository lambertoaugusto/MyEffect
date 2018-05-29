//
//  ViewController.swift
//  MyEffect
//
//  Created by Patricia Freire Sestari on 22/05/18.
//  Copyright © 2018 MyEffect. All rights reserved.
//

import UIKit
import MaterialComponents
import FontAwesome_swift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let actionsNames = ["Love Your Park Day - Lardner's Point Park (Tacony)", "Mitzvag Food Project", "Virtual Volunteering with MindRight", "Elementary School Library Team Member", "Cleaner Parks Volunteering", "Love Your Park Day - Lardner's Point Park (Tacony)", "Mitzvag Food Project", "Virtual Volunteering with MindRight", "Elementary School Library Team Member", "Cleaner Parks Volunteering", "Love Your Park Day - Lardner's Point Park (Tacony)", "Mitzvag Food Project", "Virtual Volunteering with MindRight", "Elementary School Library Team Member"]
    let actionsImages = [UIImage(named: "action1"), UIImage(named:"action2"), UIImage(named:"action3"), UIImage(named:"action4"), UIImage(named:"action5"), UIImage(named:"action6"), UIImage(named:"action7"), UIImage(named:"action8"), UIImage(named:"action9"), UIImage(named:"action10"), UIImage(named:"action11"), UIImage(named:"action12"), UIImage(named:"action13"), UIImage(named:"action14")]
    let actionsRate: Array<Array<Int>> = [[21,25], [12,27], [25,25], [11,18], [1,15], [17,20], [20,30], [13,28], [19,21], [3,9], [6,18], [4,34], [12,15], [23,23]]
    
    var actionsDate: Array<Array<String>> = [["2018-02-27"] , ["2018-03-19","2018-05-02"], ["2018-02-27","2018-03-27"], ["2018-04-12"] , ["2018-01-22","2018-02-20"] , ["2018-03-30"] , ["2018-05-11","2018-03-24"], ["2018-02-12","2018-02-27"], ["2018-06-09", "2018-06-29"], ["2018-04-29"], ["2018-01-01"], ["2018-02-15"], ["2018-07-18","2018-07-19"], ["2018-03-10","2018-03-16"]]

    let actionsCredits = [5, 1, 2, 8, 5, 7, 2 ,3 , 3, 8, 9, 3, 9, 6]
    
    let actionsCategory = [[#imageLiteral(resourceName: "zero-hunger"), #imageLiteral(resourceName: "life-land"), #imageLiteral(resourceName: "industry")], [#imageLiteral(resourceName: "good-health"), #imageLiteral(resourceName: "sustainable")], [#imageLiteral(resourceName: "quality-education")],[#imageLiteral(resourceName: "climate-action")], [#imageLiteral(resourceName: "quality-education"),#imageLiteral(resourceName: "climate-action")], [ #imageLiteral(resourceName: "sustainable"), #imageLiteral(resourceName: "quality-education")], [#imageLiteral(resourceName: "industry") ,#imageLiteral(resourceName: "good-health"), #imageLiteral(resourceName: "sustainable")], [#imageLiteral(resourceName: "zero-hunger")],[#imageLiteral(resourceName: "life-land")],[#imageLiteral(resourceName: "industry")],[#imageLiteral(resourceName: "zero-hunger"), #imageLiteral(resourceName: "life-land"), #imageLiteral(resourceName: "industry")], [#imageLiteral(resourceName: "good-health"), #imageLiteral(resourceName: "sustainable")], [#imageLiteral(resourceName: "quality-education")],[#imageLiteral(resourceName: "climate-action")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actionsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let action = collectionView.dequeueReusableCell(withReuseIdentifier: "action", for: indexPath) as! ActionCollectionViewCell
        action.actionTitle.text = actionsNames[indexPath.row]
        
        //let frametosee = action.activityIndicator.frame
        let activityIndicator = MDCActivityIndicator()
        action.activityIndicator.addSubview(activityIndicator)
        activityIndicator.indicatorMode = .determinate
        let vals = actionsRate[indexPath.row]
        activityIndicator.progress = Float(vals[0])/Float(vals[1])
        activityIndicator.radius = action.activityIndicator.frame.width/2
        activityIndicator.sizeToFit()
        activityIndicator.transform = activityIndicator.transform.rotated(by: (-0.5)*CGFloat(Double.pi))
        activityIndicator.cycleColors = [UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)]
        activityIndicator.startAnimating()
        
        // To make the activity indicator disappear:
        //activityIndicator.stopAnimating()
        
        action.actionImage.image = actionsImages[indexPath.row]
        //Rounded image
        action.actionImage.layer.cornerRadius = action.actionImage.frame.size.width/2
        action.actionImage.clipsToBounds = true
        action.bringSubview(toFront: action.actionImage)
        
        action.usersRate.text = "\(vals[0])/\(vals[1])"
        
        //adding date
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        let dates = actionsDate[indexPath.row]
        let dateStart = dateFormatterGet.date(from: dates[0])
        //action.actionDate.text = "\(dateFormatterPrint.string(from:dateStart!))"
        if(dates.count>1){
            let dateEnd = dateFormatterGet.date(from: dates[1])
            action.actionDate.text = "\(dateFormatterPrint.string(from:dateStart!)) - \(dateFormatterPrint.string(from:dateEnd!))"
        }
        else{
            action.actionDate.text = "\(dateFormatterPrint.string(from:dateStart!))"
        }
        
        //adding credits
        
        action.actionCredits.setTitle(actionsCredits[indexPath.row].description, for: .normal)
        
        if(action.activityCathegory.subviews.count == 0){
            //adding cathegory
            let cats: Array<UIImage> = actionsCategory[indexPath.row]
            //print(indexPath.row.description)
            var ind = 0;
            
            while(ind < cats.count){
                let imgView = UIImageView(frame: CGRect(x: 180-(30*ind), y: 0, width: 25, height: 25))
                imgView.image = cats[ind]
                action.activityCathegory.addSubview(imgView)
                ind = ind + 1;
            }
        }
            
        /*for cat in cats{
            let imgView = UIImageView(frame: CGRect(x: 180-(30*cats.index(of: cat)!), y: 0, width: 25, height: 25))
            imgView.image = cat
            action.activityCathegory.addSubview(imgView)
        }*/
        //setting the friends icon
        //let bb = UIButton(type: .custom)
        //bb.setImage(UIImage(named: "user-friends.pdf"), for: .normal)
        //action.friendsIcon.image = UIImage(named: "user-friends.pdf")
        //action.friendsIcon.foregr = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        //action.friendsIcon.contentMode = .scaleAspectFit
        //action.friendsIcon.frame.size = CGSize(width: 25, height: 25)
        //action.friendsIcon.image = UIImage.fontAwesomeIcon(name: FontAwesome.userFriend, textColor: UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0), size: CGSize(width: 25, height: 25))
        
        //action.friendsIconButton.setImage(UIImage(named: "user-friends"), for: .normal)
        //action.actionFriendsIcon.isEnabled = false
        
        action.contentView.layer.cornerRadius = 10.0
        action.contentView.layer.borderWidth = 1.0
        action.contentView.layer.borderColor = UIColor.clear.cgColor
        action.contentView.layer.masksToBounds = false
        
        action.layer.shadowColor = UIColor(red: 105.0/255, green: 105.0/255, blue: 105.0/255, alpha: 1.0).cgColor
        action.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        action.layer.cornerRadius = 10.0
        action.layer.shadowRadius = 4.0
        action.layer.shadowOpacity = 1.0
        action.layer.masksToBounds = false
        action.layer.shadowPath = UIBezierPath(roundedRect: action.bounds, cornerRadius: action.contentView.layer.cornerRadius).cgPath
        
        return action
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
/*
extension UIButton
{
    func setSvgImgFnc(svgImjFileNameVar: String, ClrVar: UIColor)
    {
        setImage((getSvgImgFnc(svgImjFileNameVar: svgImjFileNameVar, ClrVar : ClrVar)), for: .normal)
    }
}

func getSvgImgFnc(svgImjFileNameVar: String, ClrVar: UIColor) -> UIImage
{
    let svgURL = Bundle.main.url(forResource: svgImjFileNameVar, withExtension: "svg")
    let svgVyuVar = UIView(SVGURL: svgURL!)
    
    /* The width, height and viewPort are set to 100
     
     <svg xmlns="http://www.w3.org/2000/svg"
     width="100%" height="100%"
     viewBox="0 0 100 100">
     
     So we need to set UIView Rect also same
     */
    
    svgVyuVar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    for svgVyuLyrIdx in svgVyuVar.layer.sublayers!
    {
        for subSvgVyuLyrIdx in svgVyuLyrIdx.sublayers!
        {
            if(subSvgVyuLyrIdx.isKind(of: CAShapeLayer.self))
            {
                let SvgShpLyrIdx = subSvgVyuLyrIdx as? CAShapeLayer
                SvgShpLyrIdx!.fillColor = ClrVar.cgColor
            }
        }
    }
    return svgVyuVar.getImgFromVyuFnc()
}

extension UIView
{
    func getImgFromVyuFnc() -> UIImage
    {
        UIGraphicsBeginImageContext(self.frame.size)
        
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image!
    }
}*/
