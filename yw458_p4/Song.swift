//
//  Playlist.swift
//  yw458_p4
//
//  Created by Yunyun S. Wang on 3/23/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit //foundation with extended UI components 

//enum PlaylistArtists {
//
//} still necessary?

class Song {
    
    var songName: String
    var artistName: String
    var albumName: String
    var albumCoverImage: UIImage

    //add a touch/button here to edit UITextField?
    
    init(songName: String, artistName: String, albumName: String, albumCoverImage: UIImage) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.albumCoverImage = albumCoverImage
    }
}
