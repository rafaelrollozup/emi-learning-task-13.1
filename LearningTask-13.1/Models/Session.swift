//
//  Session.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import Foundation

enum SessionType: String {
    case dubbed = "Dublado"
    case subtitled = "Legendado"
}

struct Session {
    let dateTime: Date
    let type: SessionType
    
    let movie: Movie
    var cinema: Cinema?
    
    init(dateTime: Date, type: SessionType, movie: Movie, cinema: Cinema? = nil) {
        self.dateTime = dateTime
        self.type = type
        self.movie = movie
        self.cinema = cinema
    }
}

struct Sessions {
    let cinema: Cinema
    let all: [Session]
    
    init (_ sessions: [Session], by cinema: Cinema) {
        self.cinema = cinema
        self.all = sessions
    }
}
