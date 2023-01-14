//
//  MovieSessionsAPI.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import Foundation

class MovieSessionsAPI {
    
    func getSessionBy(_ movie: Movie) -> [Sessions] {
        let comingSessions = [
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 75, to: .now)!,
                    type: .subtitled, movie: movie),
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 150, to: .now)!,
                    type: .dubbed, movie: movie),
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 225, to: .now)!,
                    type: .subtitled, movie: movie),
        ]
        
        return [
            comingSessions.bind(to: Cinema(name: "Cinemark Boulevard Tatuapé", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Cinemark Eldorado", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Cinemark Paulista", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Cinépolis JK Iguatemi", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Espaço Itaú de Cinema - Pompéia", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Kinoplex Itaim", favorite: false)),
            comingSessions.bind(to: Cinema(name: "Kinoplex Vila Olímpia", favorite: false)),
            comingSessions.bind(to: Cinema(name: "UCI Anália Franco", favorite: false)),
        ]
        
    }
}

fileprivate extension Array where Element == Session {
    func bind(to cinema: Cinema) -> Sessions {
        let bindedSessions = self.map({ session -> Session in
            var bindedSession = session
            bindedSession.cinema = cinema
            return bindedSession
        })
        
        return Sessions(bindedSessions, by: cinema)
    }
}
