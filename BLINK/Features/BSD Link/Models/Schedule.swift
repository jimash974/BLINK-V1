//
//  Schedule.swift
//  BLINK
//
//  Created by Dwianditya Hanif Raharjanto on 30/06/23.
//

import Foundation

struct Schedule: Identifiable, Hashable {
    var id = UUID()
    var alias: String
    var namaRute: String
    var startHalte: String
    var finishHalte: String
    var rute: [String]
    var time: [[String]]
}


let schedule = [
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "CBD Timur 1",
             rute: ["The Breeze", "CBD Timur 1"],
             time: [["09:00","09:02"],["09:30","09:32"],["10:00","10:02"],["10:30","10:32"],["11:00","11:02"],["11:30","11:32"],["12:00","12:02"],["12:30","12:32"],["13:00","13:02"],["13:30","13:32"],["14:00","14:02"],["14:30","14:32"],["15:00","15:02"],["15:30","15:32"],["16:00","16:02"],["16:30","16:32"],["17:00","17:02"],["17:30","17:32"],["18:00","18:02"],["18:30","18:32"],["19:00","19:02"],["19:30","19:32"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "Lobby AEON Mall",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall"],
             time: [["09:00","09:02","09:09"],["09:30","09:32","09:39"],["10:00","10:02","10:09"],["10:30","10:32","10:39"],["11:00","11:02","11:09"],["11:30","11:32","11:39"],["12:00","12:02","12.09"],["12:30","12:32","12:39"],["13:00","13:02","13:09"],["13:30","13:32","13:39"],["14:00","14:02","14:09"],["14:30","14:32","14:39"],["15:00","15:02","15;39"],["15:30","15:32","15:39"],["16:00","16:02","16:09"],["16:30","16:32","16:39"],["17:00","17:02","17:09"],["17:30","17:32","17:39"],["18:00","18:02","18:09"],["18:30","18:32","18:39"],["19:00","19:02","19.09"],["19:30","19:32","19.39"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "AEON Mall 2",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2"],
             time: [["09:00","09:02","09:09","09:11"],["09:30","09:32","09:39","09:41"],["10:00","10:02","10:09","10:11"],["10:30","10:32","10:39","10:41"],["11:00","11:02","11:09","11:11"],["11:30","11:32","11:39","11:41"],["12:00","12:02","12.09","12.11"],["12:30","12:32","12:39","12:41"],["13:00","13:02","13:09","13:11"],["13:30","13:32","13:39","13:41"],["14:00","14:02","14:09","14:11"],["14:30","14:32","14:39","14:41"],["15:00","15:02","15:09","15:11"],["15:30","15:32","15:39","15:41"],["16:00","16:02","16:09","16:11"],["16:30","16:32","16:39","16:41"],["17:00","17:02","17:09","17:11"],["17:30","17:32","17:39","17:41"],["18:00","18:02","18:09","18:11"],["18:30","18:32","18:39","18:41"],["19:00","19:02","19.09","19.11"],["19:30","19:32","19.39","19.41"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "CBD Utara 3",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2","CBD Utara 3"],
             time: [["09:00","09:02","09:09","09:11","09:15"],["09:30","09:32","09:39","09:41","09:45"],["10:00","10:02","10:09","10:11","10:15"],["10:30","10:32","10:39","10:41","10:45"],["11:00","11:02","11:09","11:11","11:15"],["11:30","11:32","11:39","11:41","11:45"],["12:00","12:02","12.09","12.11","12.15"],["12:30","12:32","12:39","12:41","12:45"],["13:00","13:02","13:09","13:11","13:15"],["13:30","13:32","13:39","13:41","13:45"],["14:00","14:02","14:09","14:11","14:15"],["14:30","14:32","14:39","14:41","14:45"],["15:00","15:02","15:09","15:11","15:15"],["15:30","15:32","15:39","15:41","15:45"],["16:00","16:02","16:09","16:11","16:15"],["16:30","16:32","16:39","16:41","16:45"],["17:00","17:02","17:09","17:11","17:15"],["17:30","17:32","17:39","17:41","17:45"],["18:00","18:02","18:09","18:11","18:15"],["18:30","18:32","18:39","18:41","18:45"],["19:00","19:02","19:09","19:11","19:15"],["19:30","19:32","19:39","19:41","19:45"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "ICE",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2","ICE"],
             time: [["09:00","09:02","09:09","09:11","09:15"],["09:30","09:32","09:39","09:41","09:45"],["10:00","10:02","10:09","10:11","10:15"],["10:30","10:32","10:39","10:41","10:45"],["11:00","11:02","11:09","11:11","11:15"],["11:30","11:32","11:39","11:41","11:45"],["12:00","12:02","12.09","12.11","12.15"],["12:30","12:32","12:39","12:41","12:45"],["13:00","13:02","13:09","13:11","13:15"],["13:30","13:32","13:39","13:41","13:45"],["14:00","14:02","14:09","14:11","14:15"],["14:30","14:32","14:39","14:41","14:45"],["15:00","15:02","15:09","15:11","15:15"],["15:30","15:32","15:39","15:41","15:45"],["16:00","16:02","16:09","16:11","16:15"],["16:30","16:32","16:39","16:41","16:45"],["17:00","17:02","17:09","17:11","17:15"],["17:30","17:32","17:39","17:41","17:45"],["18:00","18:02","18:09","18:11","18:15"],["18:30","18:32","18:39","18:41","18:45"],["19:00","19:02","19:09","19:11","19:15"],["19:30","19:32","19:39","19:41","19:45"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "Lobby AEON Mall",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2","ICE","Lobby AEON Mall (2)"],
             time: [["09:00","09:02","09:09","09:11","09:15","09:33"],["09:30","09:32","09:39","09:41","09:45","10:03"],["10:00","10:02","10:09","10:11","10:15","10:33"],["10:30","10:32","10:39","10:41","10:45","11:03"],["11:00","11:02","11:09","11:11","11:15","11:33"],["11:30","11:32","11:39","11:41","11:45","12:03"],["12:00","12:02","12.09","12.11","12.15","12:33"],["12:30","12:32","12:39","12:41","12:45","13:03"],["13:00","13:02","13:09","13:11","13:15","13:33"],["13:30","13:32","13:39","13:41","13:45","14:03"],["14:00","14:02","14:09","14:11","14:15","14:33"],["14:30","14:32","14:39","14:41","14:45","15:03"],["15:00","15:02","15:09","15:11","15:15","15:33"],["15:30","15:32","15:39","15:41","15:45","16:03"],["16:00","16:02","16:09","16:11","16:15","16:33"],["16:30","16:32","16:39","16:41","16:45","17:03"],["17:00","17:02","17:09","17:11","17:15","17:33"],["17:30","17:32","17:39","17:41","17:45","18:03"],["18:00","18:02","18:09","18:11","18:15","18:33"],["18:30","18:32","18:39","18:41","18:45","19:03"],["19:00","19:02","19:09","19:11","19:15","19:33"],["19:30","19:32","19:39","19:41","19:45","20:03"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "AEON Mall 2",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2","ICE","Lobby AEON Mall (2)", "AEON Mall 1"],
             time: [["09:00","09:02","09:09","09:11","09:15","09:33","09:34"],["09:30","09:32","09:39","09:41","09:45","10:03","10:04"],["10:00","10:02","10:09","10:11","10:15","10:33","10:34"],["10:30","10:32","10:39","10:41","10:45","11:03","11:04"],["11:00","11:02","11:09","11:11","11:15","11:33","11:34"],["11:30","11:32","11:39","11:41","11:45","12:03","12:04"],["12:00","12:02","12.09","12.11","12.15","12:33","12:34"],["12:30","12:32","12:39","12:41","12:45","13:03","13:04"],["13:00","13:02","13:09","13:11","13:15","13:33","13:34"],["13:30","13:32","13:39","13:41","13:45","14:03","14:04"],["14:00","14:02","14:09","14:11","14:15","14:33","14:34"],["14:30","14:32","14:39","14:41","14:45","15:03","15:04"],["15:00","15:02","15:09","15:11","15:15","15:33","15:34"],["15:30","15:32","15:39","15:41","15:45","16:03","16.04"],["16:00","16:02","16:09","16:11","16:15","16:33","16:34"],["16:30","16:32","16:39","16:41","16:45","17:03","17;04"],["17:00","17:02","17:09","17:11","17:15","17:33","17:34"],["17:30","17:32","17:39","17:41","17:45","18:03","18.04"],["18:00","18:02","18:09","18:11","18:15","18:33","18:34"],["18:30","18:32","18:39","18:41","18:45","19:03","19:04"],["19:00","19:02","19:09","19:11","19:15","19:33","19:34"],["19:30","19:32","19:39","19:41","19:45","20:03","20:04"]]),
    Schedule(alias: "BSD Link The Breeze", namaRute: "The Breeze - AEON Mall - ICE - AEON Mall - The Breeze", startHalte: "The Breeze", finishHalte: "The Breeze",
             rute: ["The Breeze", "CBD Timur 1", "Lobby AEON Mall", "AEON Mall 2","ICE","Lobby AEON Mall (2)", "AEON Mall 1","The Breeze"],
             time: [["09:00","09:02","09:09","09:11","09:15","09:33","09:34","09:45"],["09:30","09:32","09:39","09:41","09:45","10:03","10:04","10:15"],["10:00","10:02","10:09","10:11","10:15","10:33","10:34","10:45"],["10:30","10:32","10:39","10:41","10:45","11:03","11:04","11:15"],["11:00","11:02","11:09","11:11","11:15","11:33","11:34","11:45"],["11:30","11:32","11:39","11:41","11:45","12:03","12:04","12:15"],["12:00","12:02","12.09","12.11","12.15","12:33","12:34","12:45"],["12:30","12:32","12:39","12:41","12:45","13:03","13:04","13:15"],["13:00","13:02","13:09","13:11","13:15","13:33","13:34","13:45"],["13:30","13:32","13:39","13:41","13:45","14:03","14:04","14:15"],["14:00","14:02","14:09","14:11","14:15","14:33","14:34","14:45"],["14:30","14:32","14:39","14:41","14:45","15:03","15:04","15:15"],["15:00","15:02","15:09","15:11","15:15","15:33","15:34","15:45"],["15:30","15:32","15:39","15:41","15:45","16:03","16.04","16:15"],["16:00","16:02","16:09","16:11","16:15","16:33","16:34","16:45"],["16:30","16:32","16:39","16:41","16:45","17:03","17;04","17:15"],["17:00","17:02","17:09","17:11","17:15","17:33","17:34","17:45"],["17:30","17:32","17:39","17:41","17:45","18:03","18.04","18:15"],["18:00","18:02","18:09","18:11","18:15","18:33","18:34","18:45"],["18:30","18:32","18:39","18:41","18:45","19:03","19:04","19:15"],["19:00","19:02","19:09","19:11","19:15","19:33","19:34","19:45"],["19:30","19:32","19:39","19:41","19:45","20:03","20:04","20:15"]]),
    Schedule(alias: "BSD Link Sektor 1.3", namaRute: "Intermoda - Halte Sektor 1.3", startHalte: "Intermoda", finishHalte: "The Breeze",
             rute: ["Intermoda","Cosmo","Verdan View", "Eternity", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE", "GOP 1", "SML Plaza", "The Breeze"],
             time: [["06:00","06:04","06:05","06:06","06:07","06:09","06:09","06:10","06:19", "06:20", "06:22"],
                    ["06:30","06:34","06:35","06:36","06:37","06:39","06:39","06:40", "06:50", "06:51", "06:53"],
                    ["08:10","08:14","08:15","08:16","08:17","08:19","08:19","08:20", "08:30", "08:31", "08:33"],
                    ["08:50","08:54","08:55","08:56","08:57","08:59","08:59","09:00", "09:09", "09:10", "09:12"],
                    ["10:25","10:29","10:30","10:31","10:32","10:34","10:34","10:35", "10:44", "10:45", "10:47"],
                    ["10:55","10:59","11:00","11:01","11:02","11:04","11:04","11:05", "11:14", "11:15", "11:17"],
                    ["12:35","12:39","12:40","12:41","12:42","12:44","12:44","12:45", "12:54", "12:55", "12:57"],
                    ["13:05","13:09","13:10","13:11","13:12","13:14","13:14","13:15", "13:24", "13:25", "13:27"],
                    ["14:45","14:49","14:50","14:51","14:52","14:54","14:54","14:55", "15:04", "15:05", "15:07"],
                    ["15:15","15:19","15:20","15:21","15:22","15:24","15:24","15:25", "15:34", "15:35", "15:37"],
                    ["16:50","16:54","16:55","16:56","16:57","16:59","16:59","17:00", "17:09", "17:10", "17:12"],
                    ["17:20","17:25","17:26","17:27","17:28","17:30","17:30","17:31", "17:41", "17:42", "17:44"],
                    ["18:45","18:50","18:51","18:52","18:53","18:55","18:55", "18:56", "19:06", "19:07", "19:09"],
                    ["19:25","19:30","19:31","19:32","19:33","19:35","19:35","19:36", "19:46", "19:47", "19:49"]]),
    Schedule(alias: "BSD Link De Park 1", namaRute: "Intermoda - De Park 1", startHalte: "The Breeze", finishHalte: "Intermoda",
             rute: ["The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Intermoda"],
             time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10"],["10.15", "12.15", "14.15", "16.15", "18.15","20.15"],["10.20", "12.20", "14.20", "16.20", "18.20","20.20"]]),
    
    
]

let dummySched = [
    Schedule(alias: "BSD Link Sektor 1.3", namaRute: "Intermoda - Halte Sektor 1.3", startHalte: "Intermoda", finishHalte: "The Breeze",
             rute: ["Intermoda","Cosmo","Verdan View", "Eternity", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE", "GOP 1", "SML Plaza", "The Breeze"],
             time: [["06:00","06:04","09:09","09:11","09:15","09:33","09:34","09:45"],["06:30","06:34","09:39","09:41","09:45","10:03","10:04","10:15"],["08:10","10:02","10:09","10:11","10:15","10:33","10:34","10:45"],["08:50","10:32","10:39","10:41","10:45","11:03","11:04","11:15"],["10:25","11:02","11:09","11:11","11:15","11:33","11:34","11:45"],["10:55","11:32","11:39","11:41","11:45","12:03","12:04","12:15"],["12:35","12:02","12.09","12.11","12.15","12:33","12:34","12:45"],["13:05","12:32","12:39","12:41","12:45","13:03","13:04","13:15"],["14:45","13:02","13:09","13:11","13:15","13:33","13:34","13:45"],["15:15","13:32","13:39","13:41","13:45","14:03","14:04","14:15"],["16:50","14:02","14:09","14:11","14:15","14:33","14:34","14:45"],["17:20","14:32","14:39","14:41","14:45","15:03","15:04","15:15"],["18:45","15:02","15:09","15:11","15:15","15:33","15:34","15:45"],["19:25","15:32","15:39","15:41","15:45","16:03","16.04","16:15"]]),
    Schedule(alias: "BSD Link De Park 1", namaRute: "Intermoda - De Park 1", startHalte: "The Breeze", finishHalte: "Intermoda",
             rute: ["The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Intermoda"],
             time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10"],["10.15", "12.15", "14.15", "16.15", "18.15","20.15"],["10.20", "12.20", "14.20", "16.20", "18.20","20.20"]]),
]
