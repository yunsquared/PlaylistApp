//
//  ViewController.swift
//  yw458_p4
//
//  Created by Yunyun S. Wang on 3/23/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

protocol SongDetailDelegate: class {
    func updateSongDetail(with newTitle: String, with newAlbumName: String, with newArtistName: String, with index: Int)
}

protocol AddSongDelegate: class {
    func addNewSong(with newSong: Song)
}

class ViewController: UIViewController, SongDetailDelegate, AddSongDelegate {
    
    
    var tableView: UITableView!
    var playlist: [Song]! //an array of songs 
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Best of J. Cole"
        view.backgroundColor = .white
        
        let middleChild = Song(songName: "Middle Child", artistName: "J. Cole", albumName: "MIDDLE CHILD", albumCoverImage: UIImage(named: "middleChild")!)
        let workOut = Song(songName: "Work Out", artistName: "J. Cole", albumName: "Cole World: The Sideline Story", albumCoverImage: UIImage(named: "coleWorld")!)
        let neighbors = Song(songName: "Neighbors", artistName: "J. Cole", albumName: "4 Your Eyez Only", albumCoverImage: UIImage(named: "4youreyezonly")!)
        let foldinClothes = Song(songName: "Foldin Clothes", artistName: "J. Cole", albumName: "4 Your Eyez Only", albumCoverImage: UIImage(named: "4youreyezonly")!)
        let wetDreamz = Song(songName: "Wet Dreamz", artistName: "J. Cole", albumName: "2014 Forest Hills Drive", albumCoverImage: UIImage(named: "foresthills")!)
        let kod = Song(songName: "KOD", artistName: "J. Cole", albumName: "KOD", albumCoverImage: UIImage(named: "KOD")!)
        let powerTrip = Song(songName: "Power Trip", artistName: "J. Cole", albumName: "Born Sinner", albumCoverImage: UIImage(named: "powerTrip")!)
        let photograph = Song(songName: "Photograph", artistName: "J. Cole", albumName: "KOD", albumCoverImage: UIImage(named: "KOD")!)
        let forWhom = Song(songName: "For Whom the Bell Tolls", artistName: "J. Cole", albumName: "4 Your Eyez Only", albumCoverImage: UIImage(named: "4youreyezonly")!)
        let intheMorning = Song(songName: "In the Morning", artistName: "J. Cole", albumName: "Cole World: The Sideline Story", albumCoverImage: UIImage(named: "coleWorld")!)
        let shesMine2 = Song(songName: "She's Mine, Pt. 2", artistName: "J. Cole", albumName: "4 Your Eyez Only", albumCoverImage: UIImage(named: "4youreyezonly")!)
        let noRoleModelz = Song(songName: "No Role Modelz", artistName: "J. Cole", albumName: "2014 Forest Hills Drive", albumCoverImage: UIImage(named: "foresthills")!)
        playlist = [foldinClothes, workOut, photograph, middleChild, neighbors, wetDreamz, kod, powerTrip, forWhom, intheMorning, shesMine2, noRoleModelz]
        
        
        //initialize tableView
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        //self, passes in actual class, if registering multiple diff cells, would req diff identifiers
        tableView.dataSource = self
        //tells tableView that our VC conforms to datasource, and references the 2 methods impelemented
        tableView.delegate = self
        view.addSubview(tableView)
        
        //UIAddBarButton
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSong))
        navigationItem.rightBarButtonItem = addBarButton
        
        setupConstraints()
    }

    func setupConstraints() {
        //set up the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    @objc func addSong() {
//        delegate?.updateSongDetail(with: songNameTextField.text ?? "", with: artistNameTextField.text ?? "", with: albumNameTextField.text ?? "", with: row ?? 0)
        let addSongViewController = AddSongViewController()
        addSongViewController.addScreenName = "Add Song"
        addSongViewController.delegate = self
        navigationController?.pushViewController(addSongViewController, animated: true)
        
    }
    
    func addNewSong(with newSong: Song) {
        playlist.append(newSong)
        tableView.reloadData()
    }
    
    

    func updateSongDetail(with newSongName: String, with newAlbumName: String, with newArtistName: String, with index: Int) {
        print ("updated")
        playlist[index].songName = newSongName
        playlist[index].artistName = newArtistName
        playlist[index].albumName = newAlbumName
        //playlist[index].albumCoverImage
        //albumCoverImageView.image = song.albumCoverImage
        tableView.reloadData()
    }


    //carried over from the lecture code demo
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //disposes of any resources that can be recreated
    }
    

}
//create new custom UITableView Class, cocoa touch view class to fill in stuff for cell 


//conforming to the DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("section: \(indexPath.section), row: \(indexPath.row)")
        let songCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        //force casting gets access to the configure func
        let song = playlist[indexPath.row]
        //when we return cell at row 0, will get the song at index 0
        print(song.songName)
        songCell.configure(for: song)
        return songCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            playlist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        //        else if editingStyle == .insert {
        //
        //        }
    
    }
}
//UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let songDetailViewController = SongDetailViewController() //desired destination
        songDetailViewController.delegate = self //now points back to VC
        songDetailViewController.row = indexPath.row
        songDetailViewController.songName = playlist[indexPath.row].songName
        songDetailViewController.artistName = playlist[indexPath.row].artistName
        songDetailViewController.albumName = playlist[indexPath.row].albumName
        songDetailViewController.albumCoverName = playlist[indexPath.row].albumCoverImage
        navigationController?.pushViewController(songDetailViewController, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselected")
        //navigationController?.pushViewController(songDetailController, animated: true)
    }
}
