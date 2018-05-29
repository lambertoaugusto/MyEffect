//
//  ActionCollectionViewCell.swift
//  MyEffect
//
//  Created by Patricia Freire Sestari on 22/05/18.
//  Copyright © 2018 MyEffect. All rights reserved.
//

import UIKit
import MaterialComponents

class ActionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var actionImage: UIImageView!
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var activityIndicator: UIView!
    @IBOutlet weak var friendsIcon: UIImageView!
    @IBOutlet weak var usersRate: UILabel!
    @IBOutlet weak var actionDate: UILabel!
    @IBOutlet weak var actionCredits: UIButton!
    @IBOutlet weak var activityCathegory: UIView!
}
