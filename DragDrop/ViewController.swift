//
//  ViewController.swift
//  DragDrop
//
//  Created by Lior Neu-ner on 2014/12/30.
//  Copyright (c) 2014 LiorN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, DrapDropCollectionViewDelegate {
    
    
    
    @IBOutlet var dragDropCollectionView: DragDropCollectionView!
    var colors: [NSInteger] = {
        var randomColors = [NSInteger]()
        for i in 1...500 {
            randomColors.append(i)
        }
        return randomColors
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragDropCollectionView.draggingDelegate = self
        dragDropCollectionView.enableDragging(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
//        cell.backgroundColor = colors[indexPath.row]
        cell.label.text = "\(colors[indexPath.row])"
        return cell
    }
    
    func dragDropCollectionViewDidMoveCellFromInitialIndexPath(_ initialIndexPath: IndexPath, toNewIndexPath newIndexPath: IndexPath) {
        let colorToMove = colors[initialIndexPath.row]
        colors.remove(at: initialIndexPath.row)
        colors.insert(colorToMove, at: newIndexPath.row)
    }
    
    @IBAction func toggleWiggle(_ sender: UISwitch) {
        if sender.isOn {
            print("iwant \(colors)")
            dragDropCollectionView.startWiggle()
        } else {
            dragDropCollectionView.stopWiggle()
        }
    }
}













