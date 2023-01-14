//
//  MoviewAPI.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import Foundation

class MoviesAPI {
    
    func loadMovies() -> [Movie] {
        let movies = [
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/avatar-o-caminho-da-agua/59d7d75f-c77d-4df2-b3c3-a4de5a7eec18.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/avatar-o-caminho-das-aguas/048d74f1-9e5e-4ade-8652-a9630106c935.jpg")!,
                  title: "Avatar: O Caminho da Água",
                  shortTitle: "Avatar",
                  rating: .notRecommendedUnder14, durationInMinutes: 192,
                  criticsScore: 77, publicScore: 92),
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/pantera-negra-wakanda-para-sempre/c4526b1e-8c33-4b2d-9a41-cdc6037b3a71.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/pantera-negra-wakanda-para-sempre/bb30eccf-3bf0-4757-9483-a2dde059414c.jpg")!,
                  title: "Pantera Negra: Wakanda Para Sempre", shortTitle: "Pantera Negra",
                  rating: .notRecommendedUnder12, durationInMinutes: 161,
                  criticsScore: 84, publicScore: 94),
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/top-gun-maverick/6f11c2a0-f605-409c-99d1-3d9caee557c9.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/top-gun-maverick/5e534635-127b-4121-a89f-19c47f5ba2a8.jpg")!,
                  title: "Top Gun: Maverick", shortTitle: "Top Gun",
                  rating: .notRecommendedUnder12, durationInMinutes: 131,
                  criticsScore: 97, publicScore: 99),
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/doutor-estranho-no-multiverso-da-loucura/ce489100-f2e5-4244-ace2-9e49d414942b.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/doutor-estranho-no-multiverso-da-loucura/29239d6e-2fb6-40ae-8f5d-1a1b70c3e681.jpg")!,
                  title: "Doutor Estranho no Multiverso da Loucura", shortTitle: "Doutor Estranho",
                  rating: .notRecommendedUnder14, durationInMinutes: 126,
                  criticsScore: 74, publicScore: 86),
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/animais-fantasticos-os-segredos-de-dumbledore/8c86b23e-42b0-43c1-b436-ada2782f5f02.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/animais-fantasticos-os-segredos-de-dumbledore/70f27af7-cae0-4a08-82ae-e80a933dde68.jpg")!,
                  title: "Animais Fantásticos: Os Segredos de Dumbledore",
                  shortTitle: "Animais Fantásticos",
                  rating: .notRecommendedUnder12, durationInMinutes: 135,
                  criticsScore: 46, publicScore: 83),
            Movie(bannerImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/o-homem-do-norte/4a0da4be-5e22-4501-8b43-9201a1a2bbd9.jpg")!,
                  posterImageURI: URL(string: "https://ingresso-a.akamaihd.net/prd/img/movie/o-homem-do-norte/05a38389-cf5a-46ab-87a0-6ad9e45da6d6.jpg")!,
                  title: "O Homem do Norte", shortTitle: "O Homem do Norte",
                  rating: .notRecommendedUnder18, durationInMinutes: 140,
                  criticsScore: 89, publicScore: 64),
            
        ]
        
        return movies
    }
    
}
