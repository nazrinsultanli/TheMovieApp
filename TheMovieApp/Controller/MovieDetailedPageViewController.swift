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
        default:
              guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneMediaCell.reuseID, for: indexPath) as? OneMediaCell else { return UICollectionViewCell() }
//            cell.configure(item: item.data as! String)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.items[indexPath.item]
        switch item.type {
        case .media:
            return .init(width: collectionView.frame.width, height: collectionView.frame.height)
        case .title:
            return .init(width: collectionView.frame.width, height: 50)
        case .infoThree:
            return .init(width: collectionView.frame.width, height: 50)

        default:
            return .zero
        }
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
     
     
     private lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 16)
         label.textAlignment = .left
         label.numberOfLines = 0
         label.backgroundColor = .cyan
         return label
     }()
     
     private lazy var languageLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 12)
         label.textAlignment = .left
         label.numberOfLines = 0
         return label
     }()
     
     private lazy var languageImage: UIImageView = {
         let imageViewm = UIImageView()
         imageViewm.translatesAutoresizingMaskIntoConstraints = false
         imageViewm.layer.cornerRadius = 10
         imageViewm.contentMode = .scaleAspectFill
         imageViewm.layer.masksToBounds = true
         return imageViewm
     }()
     
     private lazy var durationLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 12)
         label.textAlignment = .left
         label.numberOfLines = 0
         return label
     }()
     
     private lazy var durationImage: UIImageView = {
         let imageViewm = UIImageView()
         imageViewm.translatesAutoresizingMaskIntoConstraints = false
         imageViewm.layer.cornerRadius = 10
         imageViewm.contentMode = .scaleAspectFill
         imageViewm.layer.masksToBounds = true
         return imageViewm
     }()
     
     private lazy var ratingLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 12)
         label.textAlignment = .left
         label.numberOfLines = 0
         return label
     }()
     
     private lazy var ratingImage: UIImageView = {
         let imageViewm = UIImageView()
         imageViewm.translatesAutoresizingMaskIntoConstraints = false
         imageViewm.layer.cornerRadius = 10
         imageViewm.contentMode = .scaleAspectFill
         imageViewm.layer.masksToBounds = true
         return imageViewm
     }()
     
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
     func configureViewModel() {
         viewModel.getDetailed(id: selectedMovieID)
         viewModel.error = {errorMessage in
             print("Error:\(errorMessage)")
         }
         viewModel.success =  {
             print(self.viewModel.items)
         }
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
     
     
     
     
     
     
     
     
     
     @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
         switch segmentedControl.selectedSegmentIndex {
         case 0:
             print("a")
         case 1:
             print("b")
         case 2:
             print("c")
         case 3:
             print("d")
         default:
             print("f")
         }
     }
     
     func setUpConstraints() {
         view.addSubview(scrollViewm)
         scrollViewm.addSubview(contentViewm)
         
         let hConst = contentViewm.heightAnchor.constraint(equalTo: scrollViewm.heightAnchor)
         hConst.isActive = true
         hConst.priority = UILayoutPriority(50)
         contentViewm.addSubview(movieImage)
         contentViewm.addSubview(titleLabel)
         
         
         let stackLanguage = UIStackView()
         stackLanguage.addArrangedSubview(languageLabel)
         stackLanguage.addArrangedSubview(languageImage)
         stackLanguage.axis = .horizontal
         stackLanguage.translatesAutoresizingMaskIntoConstraints = false
         
         let stackDuration = UIStackView()
         stackDuration.addArrangedSubview(durationLabel)
         stackDuration.addArrangedSubview(durationImage)
         stackDuration.axis = .horizontal
         stackDuration.translatesAutoresizingMaskIntoConstraints = false
         
         let stackRating = UIStackView()
         stackRating.addArrangedSubview(ratingLabel)
         stackRating.addArrangedSubview(ratingImage)
         stackRating.axis = .horizontal
         stackRating.translatesAutoresizingMaskIntoConstraints = false
         
         let stackLanDurRa = UIStackView()
         stackLanDurRa.addArrangedSubview(stackLanguage)
         stackLanDurRa.addArrangedSubview(stackDuration)
         stackLanDurRa.addArrangedSubview(stackRating)
         stackLanDurRa.spacing = 6
         stackLanDurRa.axis = .horizontal
         stackLanDurRa.translatesAutoresizingMaskIntoConstraints = false
         contentViewm.addSubview(stackLanDurRa)
         
         let items = ["Details", "Trails","Cast","Shots"]
         let segmentedControl = UISegmentedControl(items: items)
         segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
         segmentedControl.translatesAutoresizingMaskIntoConstraints = false
         segmentedControl.tintColor = .blue
 //        contentViewm.addSubview(segmentedControl)
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
             
             segmentedControl.topAnchor.constraint(equalTo: stackLanDurRa.bottomAnchor, constant: 20),
             segmentedControl.leadingAnchor.constraint(equalTo: contentViewm.leadingAnchor, constant: 20),
             segmentedControl.trailingAnchor.constraint(equalTo: contentViewm.trailingAnchor, constant: -20),
             segmentedControl.heightAnchor.constraint(equalToConstant: 50),
             
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
