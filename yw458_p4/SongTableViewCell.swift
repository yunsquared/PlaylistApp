//
//  SongTableViewCell.swift
//  yw458_p4
//
//  Created by Yunyun S. Wang on 3/23/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumNameLabel: UILabel!
    var albumCoverImageView: UIImageView!
    
    let padding: CGFloat = 4
    let labelHeight: CGFloat = 16
    let albumCoverImageWidth: CGFloat = 60
    let albumCoverImageHeight: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //songNameTextField
        songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.textColor = .black
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        //view refers to view for root view, but we don't have that here, instead it's UIView
        contentView.addSubview(songNameLabel)
        //contentView>>>addSubview
        
        //artistNameTextField
        artistNameLabel = UILabel()
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(artistNameLabel)
        
        //albumNameTextField
        albumNameLabel = UILabel()
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.textColor = .black
        albumNameLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(albumNameLabel)
        
        //albumCoverImageView

        //albumCoverImageView = UIImageView(image: ), in configure
        albumCoverImageView = UIImageView()
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.contentMode = .scaleAspectFit
        contentView.addSubview(albumCoverImageView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //songNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            songNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: padding),
            artistNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            albumCoverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: albumCoverImageHeight),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: albumCoverImageWidth),
            ])
        
    }
    
    func configure(for song: Song) {
        songNameLabel.text = song.songName
        artistNameLabel.text = song.artistName
        albumNameLabel.text = song.albumName
        albumCoverImageView.image = song.albumCoverImage
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) { //needs to be added anytime override init
        fatalError("init(coder:) has not been implemented")
    }
    
}
