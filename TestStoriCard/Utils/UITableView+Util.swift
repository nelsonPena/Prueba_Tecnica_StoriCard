//
//  UITableView+Util.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit
import SkeletonView

extension UITableView {
    func startPaginationSkeletonLoading() {
        if tableFooterView == nil {
            let loadingCell = SkeletonCellView()
            loadingCell.showAnimatedSkeleton()
            tableFooterView = loadingCell
        }
    }
    
    func stopPaginationSkeletonLoading() {
        tableFooterView = nil
    }
    
    func hideSkeletonWithAnimation(duration: TimeInterval = 0.3, completion: (() -> Void)?) {
        // This is to make sure the tableView was able to show skeletonViews before hiding them, so we dispatchAsync to assure ourselves that we run this code on the next app execution loop.
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let isShowingSkeletonCells: Bool = self.visibleCells.reduce(false, { isShowingSkeletonCell, cell in
                return (cell is SkeletonCell) || isShowingSkeletonCell
            })
            
            if isShowingSkeletonCells {
                UIView.animate(withDuration: duration, animations: {
                    self.visibleCells.forEach { $0.contentView.alpha = 0 }
                }, completion: { finished in
                    if finished {
                        self.visibleCells.forEach { $0.contentView.alpha = 1 }
                        self.hideSkeleton()
                        completion?()
                    }
                })
            } else { completion?() }
        }
    }
    
    func changeCells<E: Equatable>(numCellsBeforeChange: Int, elementsBeingAppended: [E], allElements: [E], section: Int, animation: UITableView.RowAnimation = .automatic, onlyInsert: Bool = false) {
        let indexesUpdated = elementsBeingAppended.compactMap { allElements.firstIndex(of: $0) }
        
        let indexPathsToReload = (0..<numCellsBeforeChange).map { IndexPath(row: $0, section: section) }.filter { $0.row < allElements.count }
        let indexPathsToInsert = indexesUpdated.map { IndexPath(row: $0, section: section) }.filter { !indexPathsToReload.contains($0) }
        let indexPathsToDelete = (0..<numCellsBeforeChange).map { IndexPath(row: $0, section: section) }.filter { !indexPathsToReload.contains($0) && !indexPathsToInsert.contains($0) }
        
        // we check if our calculations are correct, we don't wanna trap
        var calculationsAreOk = (indexPathsToReload.count + indexPathsToInsert.count - indexPathsToDelete.count) == allElements.count
        
        // in the case of only deletions
        if indexPathsToReload.count == 0 && indexPathsToInsert.count == 0 {
            calculationsAreOk = numCellsBeforeChange - indexPathsToDelete.count == allElements.count
        }
        
        let modelsContainDuplicates = [indexPathsToReload, indexPathsToInsert, indexPathsToDelete].reduce(false, { (containsDuplicate, indexPaths) -> Bool in
            let setIndexPath = Set(indexPaths)
            return containsDuplicate || indexPaths.count != setIndexPath.count
        })
        
        if modelsContainDuplicates || !calculationsAreOk {
            reloadData()
            return
        }
        
        beginUpdates()
        if indexPathsToInsert.count > 0 { insertRows(at: indexPathsToInsert, with: animation) }
        if indexPathsToReload.count > 0, !onlyInsert { reloadRows(at: indexPathsToReload, with: animation) }
        if indexPathsToDelete.count > 0 { deleteRows(at: indexPathsToDelete, with: animation) }
        endUpdates()
    }
}
