//
//  Symptoms.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/22/23.
//

import SwiftUI

//enum SymptomSuite: String, CaseIterable, Codable {
//
//    static var allCases: [SymptomEntry.SymptomSuite] {
//        return [.gastrointestinal, .constitutional, .heartAndLung, .musculoskeletal, .neurological, .noseAndThroat, .reproduction, .skinAndHair, .sleep, .urinary]
//    }
//
//
//
//    case
//    gastrointestinal,//symptom: GastroSymptom?),
//    constitutional,//symptom: ConstitutionalSymptom?),
//    heartAndLung,//symptom: HeartAndLungSymptom?),
//    musculoskeletal,//symptom: MusculoskeletakSymptom?),
//    neurological,//symptom: NeurologicalSymptom?),
//    noseAndThroat,//symptom: NoseAndThroatSymptom?),
//    reproduction,//symptom: ReproductionSymptom?),
//    skinAndHair,//symptom: SkinAndHairSymptom?),
//    sleep,//: SleepSymptom?),
//    urinary//: UrinarySymptom?)
//
//
//
//}

enum GastroSymptom: String, CaseIterable, Codable, Hashable {
    case
    abdominalCramps,
    bloating,
    constipation,
    diarrhea,
    heartburn,
    nausea,
    vomiting
}

enum ConstitutionalSymptom: String, CaseIterable, Codable, Hashable {
    case
    appetiteChanges,
    chills,
    dizziness,
    fainting,
    fatigue,
    fever,
    generalizedBodyAche,
    hotFlashes
}
enum HeartAndLungSymptom: String, CaseIterable, Codable, Hashable {
    case
    chestTightnessOrPain,
    coughing,
    rapidPoundingOrFlutteringHeartbeat,
    shortnessOfBreath,
    skippedHeartbeat,
    wheezing
}

enum MusculoskeletakSymptom: String, CaseIterable, Codable, Hashable {
    case
    lowerBackPain
}

enum NeurologicalSymptom: String, CaseIterable, Codable, Hashable {
    case
    headache,
    memoryLapse,
    moodChanges
}

enum NoseAndThroatSymptom: String, CaseIterable, Codable, Hashable {
    case
    lossOfSmell,
    lossOfTaste,
    runnyNose,
    soreThroat,
    sinusCongestion
}

enum ReproductionSymptom: String, CaseIterable, Codable, Hashable {
    case
    breastPain,
    pelvicPain,
    vaginalDryness
}

enum SkinAndHairSymptom: String, CaseIterable, Codable, Hashable {
    case
    acne,
    drySkin,
    hairLoss
}

enum SleepSymptom: String, CaseIterable, Codable, Hashable {
    case
    nightSweats,
    sleepChanges
}

enum UrinarySymptom: String, CaseIterable, Codable, Hashable {
    case
    bladderIncontinence
}


//abdominalCramps,
//bloating,
//constipation,
//diarrhea,
//heartburn,
//nausea,
//vomiting,
//appetiteChanges,
//chills,
//dizziness,
//fainting,
//fatigue,
//fever,
//generalizedBodyAche,
//hotFlashes,
//chestTightnessOrPain,
//coughing,
//rapidPoundingOrFlutteringHeartbeat,
//shortnessOfBreath,
//skippedHeartbeat,
//wheezing,
//lowerBackPain,
//headache,
//memoryLapse,
//moodChanges,
//lossOfSmell,
//lossOfTaste,
//runnyNose,
//soreThroat,
//sinusCongestion,
//breastPain,
//pelvicPain,
//vaginalDryness,
//acne,
//drySkin,
//hairLoss,
//nightSweats,
//sleepChanges,
//bladderIncontinence
