//
//  SongDetailViewController.swift
//  yw458_p4
//
//  Created by Yunyun S. Wang on 3/24/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SongDetailViewController: UIViewController {
    
    var saveButton: UIButton!
    var songNameTextField: UITextField!
    var artistNameTextField: UITextField!
    var albumNameTextField: UITextField!
    var albumCoverImageView: UIImageView!
    
    var songDetailName: String?
    var songName: String?
    var artistName: String?
    var albumName: String?
    var albumCoverName: UIImage?
    var row: Int?
    
    let albumCoverImageWidth: CGFloat = 300
    let albumCoverImageHeight: CGFloat = 300
    
    weak var delegate: SongDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
//        saveButton = UIButton()
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        saveButton.setTitle("Save", for: .normal)
//        saveButton.backgroundColor = .blue
//        saveButton.setTitleColor(.white, for: .normal)
//        saveButton.addTarget(self, action: #selector(didPressSave), for: .touchUpInside)
//        view.addSubview(saveButton)
        
        //UISaveBarButton
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didPressSave))
        navigationItem.rightBarButtonItem = saveBarButton
        
        //songNameTextField
        songNameTextField = UITextField()
        songNameTextField.translatesAutoresizingMaskIntoConstraints = false
        songNameTextField.text = songName
        songNameTextField.borderStyle = .bezel
        songNameTextField.layer.borderWidth = 1.0
        let borderColor = UIColor.black
        songNameTextField.layer.borderColor = borderColor.cgColor
        songNameTextField.textColor = .black
        songNameTextField.backgroundColor = .white
        view.addSubview(songNameTextField)
        
        //artistNameTextField
        artistNameTextField = UITextField()
        artistNameTextField.translatesAutoresizingMaskIntoConstraints = false
        artistNameTextField.text = artistName
        artistNameTextField.borderStyle = .bezel
        artistNameTextField.layer.borderWidth = 1.0
        //let borderColor = UIColor.black
        artistNameTextField.layer.borderColor = borderColor.cgColor
        artistNameTextField.textColor = .black
        artistNameTextField.backgroundColor = .white
        view.addSubview(artistNameTextField)
        
        //albumNameTextField
        albumNameTextField = UITextField()
        albumNameTextField.translatesAutoresizingMaskIntoConstraints = false
        albumNameTextField.text = albumName
        albumNameTextField.borderStyle = .bezel
        albumNameTextField.layer.borderWidth = 1.0
        //let borderColor = UIColor.black
        albumNameTextField.layer.borderColor = borderColor.cgColor
        albumNameTextField.textColor = .black
        albumNameTextField.backgroundColor = .white
        view.addSubview(albumNameTextField)
        //albumCoverImage
        albumCoverImageView = UIImageView()
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        //albumCoverImage.contentMode = .scaleAspectFit
        albumCoverImageView.image = albumCoverName
        view.addSubview(albumCoverImageView)
    
        // Do any additional setup after loading the view.
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
//        NSLayoutConstraint.activate([
//            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            saveButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//            saveButton.widthAnchor.constraint(equalToConstant: 70),
//            saveButton.heightAnchor.constraint(equalToConstant: 70)
//            ])
    
        //songNameTextField
        NSLayoutConstraint.activate([
            songNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            songNameTextField.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 10),
            songNameTextField.heightAnchor.constraint(equalToConstant: 30),
            songNameTextField.widthAnchor.constraint(equalToConstant: 200)
            ])
        
        //artistNameTextField
        NSLayoutConstraint.activate([
            artistNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            artistNameTextField.topAnchor.constraint(equalTo: songNameTextField.bottomAnchor, constant: 20),
            artistNameTextField.heightAnchor.constraint(equalToConstant: 30),
            artistNameTextField.widthAnchor.constraint(equalToConstant: 200)
            ])
        
        //albumNameTextField
        NSLayoutConstraint.activate([
            albumNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            albumNameTextField.topAnchor.constraint(equalTo: artistNameTextField.bottomAnchor, constant: 20),
            albumNameTextField.heightAnchor.constraint(equalToConstant: 30),
            albumNameTextField.widthAnchor.constraint(equalToConstant: 200)
            ])
        
        //albumCoverImage
        NSLayoutConstraint.activate([
            albumCoverImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            albumCoverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: albumCoverImageHeight),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: albumCoverImageWidth)
            ])
        
        
            
    }
    
    //add a save button, to dismiss and update, call the delegate
    @objc func didPressSave() {
        delegate?.updateSongDetail(with: songNameTextField.text ?? "", with: artistNameTextField.text ?? "", with: albumNameTextField.text ?? "", with: row ?? 0)
        navigationController?.popViewController(animated: true)
        
    }

  
}
