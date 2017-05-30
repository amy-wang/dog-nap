//
//  DogCollectionViewController.swift
//  Dog Nap Alarm
//
//  Created by Alex Madrzyk on 2017-05-29.
//  Copyright © 2017 Rain Pillar. All rights reserved.
//

import UIKit

class DogCollectionViewController: UICollectionViewController {
    
    var dogImages: [UIImage] = [];
    var dogImagesChecked: [UIImage] = [];
    var checkArray = [Int]();
    
    var chooseButton: UIButton?;
    
    var buttonAction = #selector(pressButton(button:));
    
    struct Storyboard {
        private let reuseIdentifier = "Cell"
        static let dogCell = "DogCell"
        static let footerButton = "FooterViewID"
        static let dogChosenSegue = "DogChosenSegue"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 2.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        dogImages += [
            #imageLiteral(resourceName: "shiba_hex"),
            #imageLiteral(resourceName: "pug_hex"),
            #imageLiteral(resourceName: "beagle_hex"),
            #imageLiteral(resourceName: "chihuahua_hex")
        ]
        
        dogImagesChecked += [
            #imageLiteral(resourceName: "shiba_checked"),
            #imageLiteral(resourceName: "pug_checked"),
            #imageLiteral(resourceName: "beagle_checked"),
            #imageLiteral(resourceName: "chihuahua_checked")
        ]
        
        chooseButton = addChooseButton();
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dogImages.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.dogCell, for: indexPath) as! DogImageCollectionViewCell
    
        // Configure the cell
        cell.DogImageView.image = dogImages[indexPath.item]
        
        if checkArray.contains(indexPath.row) {
            cell.DogImageView.image = dogImagesChecked[indexPath.item]
        } else {
            cell.DogImageView.image = dogImages[indexPath.item]
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Update images on select/deselect
        if checkArray.contains(indexPath.row) {
            let index = checkArray.index(of: indexPath.row)
            checkArray.remove(at: index!)
        } else {
            checkArray.append(indexPath.row)
        }
        
        // Update choose button based on selection
        if checkArray.isEmpty {
            chooseButton!.isEnabled = false;
            chooseButton!.isUserInteractionEnabled = false;
        } else {
            chooseButton!.isEnabled = true;
            chooseButton!.isUserInteractionEnabled = true;
        }
        
        collectionView.reloadItems(at: [indexPath])
    }
    
    fileprivate func addChooseButton() -> UIButton {
        let button = UIButton()
        
        // Button View Settings
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CHOOSE", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.backgroundColor = UIColor(hex: "00FF80")
        button.accessibilityIdentifier = "ChooseButtonID"
        
        // Button Action
        button.addTarget(self, action: buttonAction, for: .touchUpInside)
        
        self.view.addSubview(button)
        
        // Constraints
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        return button;
    }
    
    func pressButton(button: UIButton) {
        performSegue(withIdentifier: Storyboard.dogChosenSegue, sender: button)
    }
}


