//
//  Post.swift
//  Navigation
//
//  Created by Anton Utin on 09.05.2022.
//

import Foundation

struct Post {
    let title: String
}

struct ModelPost {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
    static func createModelPost() -> [ModelPost] {
        var modelPost = [ModelPost]()
        modelPost.append(ModelPost(author: "vedmak.official", description: "Новые кадры со сьемок второго сезона сериала «Ведьмак»", image: "vedmak.jpg", likes: 240, views: 312))
        modelPost.append(ModelPost(author: "Нетология. Меняем карьеру через образование.", description: "Вот и пролетел июнь: в новом дайджесте команда «Высшего образования» рассказывает, как прошёл первый месяц лета, делится планами и новостями.Помогаем выбрать направление вашей карьеры", image: "netologiya.jpg", likes: 766, views: 893))
        modelPost.append(ModelPost(author: "RBK", description: "Минторг США сообщил о падении на 90% экспорта полупроводников в Россию", image: "rbc.jpg", likes: 200, views: 200))
        modelPost.append(ModelPost(author: "Sobchak", description: "Собчак фразой «статья найдется» оценила риск признания иноагентом", image: "sobchak.jpg", likes: 322, views: 1255))
        return modelPost
    }
}
