//
//  CollectionViewController.swift
//  Whalerock Test
//
//  Created by Wesley Van der Klomp on 10/14/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var stickers: [Sticker]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://d3q6cnmfgq77qf.cloudfront.net/keyboards/ellen/testing/v2/assets_ios.json")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let jsonData = data {
                
                let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                let arrayOfAssets = json["assets"] as! [[String: Any]]
                
                self.stickers = []
                
                for asset in arrayOfAssets {
                    self.stickers?.append(Sticker(jsonAsset: asset))
                }
                
                self.collectionView?.reloadData()

            }
        }.resume()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        if stickers != nil && !(stickers?.isEmpty)! {
            return stickers!.count
        } else {
            return 0
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let sticker = stickers![indexPath.row]
    
        URLSession.shared.dataTask(with: sticker.url) { (data, response, error) in
            if data != nil {
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    cell.image.image = image
                }
                
                
            }
        }.resume()
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
