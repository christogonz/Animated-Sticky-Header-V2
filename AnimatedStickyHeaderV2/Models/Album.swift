//
//  Album.swift
//  AnimatedStickyHeaderV2
//
//  Created by Christopher Gonzalez on 2024-08-02.
//

import SwiftUI

struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName: String
    var albumImage: String
    var IsLiked: Bool = false
}

var albums: [Album] = [
    Album(albumName: "Thriller", albumImage: "mc1"),
    Album(albumName: "Bad", albumImage: "mc2"),
    Album(albumName: "Dangerous", albumImage: "mc3"),
    Album(albumName: "HIStory", albumImage: "mc4"),
    Album(albumName: "Off the Wall", albumImage: "mc5"),
    Album(albumName: "Invincible", albumImage: "mc6"),
    Album(albumName: "Michael", albumImage: "mc7"),
    Album(albumName: "Got to Be There", albumImage: "mc1"),
    Album(albumName: "Ben", albumImage: "mc2"),
    Album(albumName: "Music & Me", albumImage: "mc3"),
    Album(albumName: "Forever, Michael", albumImage: "mc4"),
    Album(albumName: "Blood on the Dance Floor", albumImage: "mc5"),
    Album(albumName: "Xscape", albumImage: "mc6"),
    Album(albumName: "Scream", albumImage: "mc7"),
]
