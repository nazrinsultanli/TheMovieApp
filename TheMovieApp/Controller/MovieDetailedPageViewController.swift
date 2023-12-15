//
//  MovieDetailedPageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 12.12.23.
//

import UIKit

class MovieDetailedPageViewController: UIViewController {
    var selectedMovieID = Int()
//    var genres = [String]()
//    let genreArray = GenresHelper.shared.genres
    var viewModel = MovieDetailedPageViewModel()

    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .green
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCollectionViewCells()
        configureViewModel()
        setUpConstraints()
      
    }
    func configureUI() {
        title = "Movie"
        view.backgroundColor = .white

    }
    func configureViewModel() {
        viewModel.getDetailed(id: selectedMovieID)
        viewModel.error = {errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            print(self.viewModel.items)
            self.collectionView.reloadData()
        }
    }
   
    func registerCollectionViewCells() {
        collectionView.register(OneMediaCell.self, forCellWithReuseIdentifier: OneMediaCell.reuseID)
        collectionView.register(OneTitleCell.self, forCellWithReuseIdentifier: OneTitleCell.reuseID)
        collectionView.register(InfoThreeLabelImageCell.self, forCellWithReuseIdentifier: InfoThreeLabelImageCell.reuseID)
        collectionView.register(SegmentControlCell.self, forCellWithReuseIdentifier: SegmentControlCell.reuseID)
        collectionView.register(SegmentDetailCell.self, forCellWithReuseIdentifier: SegmentDetailCell.reuseID)
    }
    func setUpConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }
}

extension MovieDetailedPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.items[indexPath.item]
        switch item.type {
        case .media:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneMediaCell.reuseID, for: indexPath) as? OneMediaCell else { return UICollectionViewCell() }
            cell.configure(item: item.data as! String)
            return cell
        case .title:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneTitleCell.reuseID, for: indexPath) as? OneTitleCell else { return UICollectionViewCell() }
            cell.configure(item: item.data as! String)
            return cell
            
        case .infoThree:
            guard let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoThreeLabelImageCell.reuseID, for: indexPath) as? InfoThreeLabelImageCell else { return UICollectionViewCell() }
            cell.configure(info: item.data as! InfoThreeModel)
            return cell
        case .segment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentControlCell.reuseID, for: indexPath) as? SegmentControlCell else { return UICollectionViewCell() }
            cell.delegate = self
            return cell
        case .details:
            guard let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentDetailCell.reuseID, for: indexPath) as? SegmentDetailCell else { return UICollectionViewCell() }
            cell.configure(item: item.data as! SegmentDetailsModel)
            return cell
        default:
              guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneMediaCell.reuseID, for: indexPath) as? OneMediaCell else { return UICollectionViewCell() }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: viewModel.items[indexPath.item].height)
        
    }
    
}
extension MovieDetailedPageViewController: SegmentControlCellCelectionDelegate {
    func didSelectSegment(selected: String) {
        viewModel.didSelectSegment(selected)
    }
    
}


/*
 //
 //  MovieDetailedPageViewController.swift
 //  TheMovieApp
 //
 //  Created by Nazrin Sultanlı on 12.12.23.
 //

 import UIKit

 class MovieDetailedPageViewController: UIViewController {
     var selectedMovieID = Int()
     var genres = [String]()
     let genreArray = GenresHelper.shared.genres
     var viewModel = MovieDetailedPageViewModel()
     
   
     
     private lazy var containerGenreView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         // Additional setup for your container view
         
         return view
     }()
     
 //    private var genresInfoView: LabelAndCollectionView = {
 //        let view = LabelAndCollectionView()
 //        view.configure(text: "Genres")
 //        return view
 //    }()
 //
 //    private var directorsInfoView: LabelAndCollectionView = {
 //        let view = LabelAndCollectionView()
 //        view.configure(text: "Directors")
 //        return view
 //    }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         configureViewModel()
        // print(viewModel.items)
         //setUpConstraints()
         configure()
     }

     func configure() {
         
 //        titleLabel.text = selectedMovie?.title
 //        durationLabel.text = selectedMovie?.releaseDate ?? ""
 //        movieImage.loadImage(url: selectedMovie?.posterPath ?? "")
 //        languageLabel.text = selectedMovie?.originalLanguage ?? ""
 //        ratingLabel.text = "\(String(describing: selectedMovie?.voteAverage))/10"
 //
 //        if let genreIDs = selectedMovie?.genreIDS {
 //            for genreIndex in genreIDs {
 //                if genreIndex >= 0, genreIndex < genreArray.count {
 //                    genres.append(genreArray[genreIndex].name ?? "" )
 //                }
 //            }
 //        }
 //        genresInfoView.data = genres
 //        directorsInfoView.data = ["asas", "frfrf", "ioio"]
         
     }
     
     
     
     
     
     
     
     
     
   
     
     func setUpConstraints() {
   
 //        contentViewm.addSubview(genresInfoView)
 //        contentViewm.addSubview(directorsInfoView)
         
         NSLayoutConstraint.activate([
             scrollViewm.topAnchor.constraint(equalTo: view.topAnchor),
             scrollViewm.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             scrollViewm.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollViewm.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             contentViewm.topAnchor.constraint(equalTo: scrollViewm.topAnchor),
             contentViewm.bottomAnchor.constraint(equalTo: scrollViewm.bottomAnchor),
             contentViewm.leadingAnchor.constraint(equalTo: scrollViewm.leadingAnchor),
             contentViewm.trailingAnchor.constraint(equalTo: scrollViewm.trailingAnchor),
             contentViewm.widthAnchor.constraint(equalTo: scrollViewm.widthAnchor),
             
             movieImage.topAnchor.constraint(equalTo: contentViewm.topAnchor, constant: 0),
             movieImage.leadingAnchor.constraint(equalTo: contentViewm.leadingAnchor, constant: 20),
             movieImage.trailingAnchor.constraint(equalTo: contentViewm.trailingAnchor, constant: -20),
             movieImage.heightAnchor.constraint(equalToConstant: 300),
             
             titleLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
             titleLabel.leadingAnchor.constraint(equalTo: contentViewm.leadingAnchor, constant: 20),
             titleLabel.trailingAnchor.constraint(equalTo: contentViewm.trailingAnchor, constant: -20),
             titleLabel.heightAnchor.constraint(equalToConstant: 30),
             
             stackLanDurRa.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
             stackLanDurRa.leadingAnchor.constraint(equalTo: contentViewm.leadingAnchor, constant: 20),
             stackLanDurRa.trailingAnchor.constraint(equalTo: contentViewm.trailingAnchor, constant: -20),
             stackLanDurRa.heightAnchor.constraint(equalToConstant: 30),
             
            
             
 //            genresInfoView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
 //            genresInfoView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
 //            genresInfoView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
 //            genresInfoView.heightAnchor.constraint(equalToConstant: 50),
 //
 //            directorsInfoView.topAnchor.constraint(equalTo: genresInfoView.bottomAnchor, constant: 20),
 //            directorsInfoView.leadingAnchor.constraint(equalTo: genresInfoView.leadingAnchor),
 //            directorsInfoView.trailingAnchor.constraint(equalTo: genresInfoView.trailingAnchor),
 //            directorsInfoView.heightAnchor.constraint(equalToConstant: 50)
         ])
     }
     
 }




 */
