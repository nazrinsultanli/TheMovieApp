//
//  SegmentControlCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 14.12.23.
//

import UIKit
//1
protocol SegmentControlCellCelectionDelegate: AnyObject {
    func didSelectSegment(removed: String)
}
class SegmentControlCell: UICollectionViewCell {
    static let reuseID = "SegmentControlCell"
    //2
    weak var delegate: SegmentControlCellCelectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        
        let items = [SegmentNames.details.rawValue,
                     SegmentNames.trailer.rawValue,
                     SegmentNames.cast.rawValue,
                     SegmentNames.shots.rawValue]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.addTarget(self, action: #selector(MovieInfoSegment(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .blue
        contentView.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //3
    @objc func MovieInfoSegment(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            delegate?.didSelectSegment(removed: SegmentNames.details.rawValue)
            print("a")
        case 1:
            delegate?.didSelectSegment(removed: SegmentNames.trailer.rawValue)
            print("b")
        case 2:
            delegate?.didSelectSegment(removed: SegmentNames.cast.rawValue)
            print("c")
        case 3:
            delegate?.didSelectSegment(removed: SegmentNames.shots.rawValue)
            print("d")
        default:
            print("f")
        }
    }
}
