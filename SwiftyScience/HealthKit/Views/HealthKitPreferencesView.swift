//
//  HealthKitPreferencesView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/22/23.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct HealthKitPreferencesView: View {
    
    //MARK: Section Toggles
    @State var showHealthMetrics: Bool = false
    @State var showAbdominal: Bool = false
    @State var showConstitutional: Bool = false
    @State var showHeartAndLung: Bool = false
    @State var showMusculoskeletal: Bool = false
    @State var showNeurological: Bool = false
    @State var showNoseAndThroat: Bool = false
    @State var showReproduction: Bool = false
    @State var showSkinAndHair: Bool = false
    @State var showSleep: Bool = false
    @State var showUrinary: Bool = false
    
    //MARK: Metric Toggles
    @State var sleepData: Bool = false
    @State var stepsData: Bool = false
    @State var heartRateData: Bool = false
    @State var bodyMassIndexData: Bool = false
    @State var bodyFatPercentageData: Bool = false
    @State var bloodGlucoseData: Bool = false
    @State var bloodPressureData: Bool = false
    @State var bodyTemperatureData: Bool = false
    
    //MARK: Symptom Toggles
    @State var abdominalCramps: Bool = false
    @State var bloating: Bool = false
    @State var constipation: Bool = false
    @State var diarrhea: Bool = false
    @State var heartburn: Bool = false
    @State var nausea: Bool = false
    @State var vomiting: Bool = false
    @State var appetiteChanges: Bool = false
    @State var chills: Bool = false
    @State var dizziness: Bool = false
    @State var fainting: Bool = false
    @State var fatigue: Bool = false
    @State var fever: Bool = false
    @State var generalizedBodyAche: Bool = false
    @State var hotFlashes: Bool = false
    @State var chestTightnessOrPain: Bool = false
    @State var coughing: Bool = false
    @State var rapidPoundingOrFlutteringHeartbeat: Bool = false
    @State var shortnessOfBreath: Bool = false
    @State var skippedHeartbeat: Bool = false
    @State var wheezing: Bool = false
    @State var lowerBackPain: Bool = false
    @State var headache: Bool = false
    @State var memoryLapse: Bool = false
    @State var moodChanges: Bool = false
    @State var lossOfSmell: Bool = false
    @State var lossOfTaste: Bool = false
    @State var runnyNose: Bool = false
    @State var soreThroat: Bool = false
    @State var sinusCongestion: Bool = false
    @State var breastPain: Bool = false
    @State var pelvicPain: Bool = false
    @State var vaginalDryness: Bool = false
    @State var acne: Bool = false
    @State var drySkin: Bool = false
    @State var hairLoss: Bool = false
    @State var nightSweats: Bool = false
    @State var sleepChanges: Bool = false
    @State var bladderIncontinence: Bool = false
    
    
    //MARK: Properties
    @State var properties: [HKObjectType] = []
    @ObservedObject var manager: HealthKitManager

    
    //MARK: Body
    var body: some View {


        List {
            Group {
                Section("Health Metrics") {
                    Toggle(isOn: $showHealthMetrics) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Health Metrics")
                        }
                    }
                    if showHealthMetrics {
                        Toggle("Sleep", isOn: $sleepData)
                        Toggle("Steps", isOn: $stepsData)
                        Toggle("Heart Rate", isOn: $heartRateData)
                        Toggle("Body Mass Index", isOn: $bodyMassIndexData)
                        Toggle("Body Fat Percentage", isOn: $bodyFatPercentageData)
                        Toggle("Blood Glucose", isOn: $bloodGlucoseData)
                        Toggle("Blood Pressure", isOn: $bloodPressureData)
                        Toggle("Body Temperature", isOn: $bodyTemperatureData)
                    }
                }
            }
            
            
            Section("Symptoms") {
                Group {
                    Toggle(isOn: $showAbdominal) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Abdominal and GI")
                        }
                    }
                    if showAbdominal {
                        Toggle("Abdominal Cramps", isOn: $abdominalCramps)
                            .onChange(of: abdominalCramps) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .abdominalCramps)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .abdominalCramps) }
                                    )
                                }
                            }
                        
                        Toggle("Bloating", isOn: $bloating)
                            .onChange(of: bloating) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .bloating)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .bloating) }
                                    )
                                }
                            }
                        
                        Toggle("Constipation", isOn: $constipation)
                            .onChange(of: constipation) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .constipation)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .constipation) }
                                    )
                                }
                            }
                        
                        Toggle("Diarrhea", isOn: $diarrhea)
                            .onChange(of: diarrhea) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .diarrhea)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .diarrhea) }
                                    )
                                }
                            }
                        
                        Toggle("Heartburn", isOn: $heartburn)
                            .onChange(of: heartburn) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .heartburn)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .heartburn) }
                                    )
                                }
                            }
                        
                        Toggle("Nausea", isOn: $nausea)
                            .onChange(of: nausea) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .nausea)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .nausea) }
                                    )
                                }
                            }
                        
                        Toggle("Vomiting", isOn: $vomiting)
                            .onChange(of: vomiting) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .vomiting)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .vomiting) }
                                    )
                                }
                            }
                        
                        Toggle("Appetite Changes", isOn: $appetiteChanges)
                            .onChange(of: appetiteChanges) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .appetiteChanges)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .appetiteChanges) }
                                    )
                                }
                            }

                    }
                    
                        

                    Toggle(isOn: $showConstitutional) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Constitutional")
                        }
                    }
                    if showConstitutional {
                        if showConstitutional {
                            Toggle("Chills", isOn: $chills)
                                .onChange(of: chills) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .chills)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .chills) }
                                        )
                                    }
                                }
                            Toggle("Dizziness", isOn: $dizziness)
                                .onChange(of: dizziness) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .dizziness)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .dizziness) }
                                        )
                                    }
                                }
                            Toggle("Fainting", isOn: $fainting)
                                .onChange(of: fainting) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .fainting)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .fainting) }
                                        )
                                    }
                                }
                            Toggle("Fatigue", isOn: $fatigue)
                                .onChange(of: fatigue) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .fatigue)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .fatigue) }
                                        )
                                    }
                                }
                            Toggle("Fever", isOn: $fever)
                                .onChange(of: fever) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .fever)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .fever) }
                                        )
                                    }
                                }
                            Toggle("Generalized Body Ache", isOn: $generalizedBodyAche)
                                .onChange(of: generalizedBodyAche) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .generalizedBodyAche)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .generalizedBodyAche) }
                                        )
                                    }
                                }
                            Toggle("Hot Flashes", isOn: $hotFlashes)
                                .onChange(of: hotFlashes) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .hotFlashes)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .hotFlashes) }
                                        )
                                    }
                                }
                        }

                    }

                    Toggle(isOn: $showHeartAndLung) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Heart & Lung")
                        }
                    }

                    if showHeartAndLung {
                        Toggle("Chest Tightness or Pain", isOn: $chestTightnessOrPain)
                            .onChange(of: chestTightnessOrPain) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .chestTightnessOrPain)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .chestTightnessOrPain) }
                                    )
                                }
                            }
                        Toggle("Coughing", isOn: $coughing)
                            .onChange(of: coughing) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .coughing)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .coughing) }
                                    )
                                }
                            }
                        Toggle("Rapid, Pounding or Fluttering Heartbeat", isOn: $rapidPoundingOrFlutteringHeartbeat)
                            .onChange(of: rapidPoundingOrFlutteringHeartbeat) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .rapidPoundingOrFlutteringHeartbeat)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .rapidPoundingOrFlutteringHeartbeat) }
                                    )
                                }
                            }
                        Toggle("Shortness of Breath", isOn: $shortnessOfBreath)
                            .onChange(of: shortnessOfBreath) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .shortnessOfBreath)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .shortnessOfBreath) }
                                    )
                                }
                            }
                        Toggle("Skipped Heartbeat", isOn: $skippedHeartbeat)
                            .onChange(of: skippedHeartbeat) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .skippedHeartbeat)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .skippedHeartbeat) }
                                    )
                                }
                            }
                        Toggle("Wheezing", isOn: $wheezing)
                            .onChange(of: wheezing) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .wheezing)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .wheezing) }
                                    )
                                }
                            }
                    }


                    Toggle(isOn: $showMusculoskeletal) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Musculoskeletal")
                        }
                    }
                    if showMusculoskeletal {
                        Toggle("Lower Back Pain", isOn: $lowerBackPain)
                                .onChange(of: lowerBackPain) { value in
                                    if value {
                                        manager.exportedProperties.append(
                                            HKObjectType.categoryType(forIdentifier: .lowerBackPain)!
                                        )
                                    } else {
                                        manager.exportedProperties.removeAll(
                                            where: { $0 == HKObjectType.categoryType(forIdentifier: .lowerBackPain) }
                                        )
                                    }
                                }
                    }

                    Toggle(isOn: $showNeurological) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Musculoskeletal")
                        }
                    }
                    if showNeurological {
                        Toggle("Headache", isOn: $headache)
                            .onChange(of: headache) { value in
                                if value {
                                    manager.exportedProperties.append(HKObjectType.categoryType(forIdentifier: .headache)!)
                                } else {
                                    manager.exportedProperties.removeAll(where: { $0 == HKObjectType.categoryType(forIdentifier: .headache) })
                                }
                            }
                        Toggle("Memory Lapse", isOn: $memoryLapse)
                            .onChange(of: memoryLapse) { value in
                                if value {
                                    manager.exportedProperties.append(HKObjectType.categoryType(forIdentifier: .memoryLapse)!)
                                } else {
                                    manager.exportedProperties.removeAll(where: { $0 == HKObjectType.categoryType(forIdentifier: .memoryLapse) })
                                }
                            }
                        Toggle("Mood Changes", isOn: $moodChanges)
                            .onChange(of: moodChanges) { value in
                                if value {
                                    manager.exportedProperties.append(HKObjectType.categoryType(forIdentifier: .moodChanges)!)
                                } else {
                                    manager.exportedProperties.removeAll(where: { $0 == HKObjectType.categoryType(forIdentifier: .moodChanges) })
                                }
                            }
                    }

                }
                Group {
                    Toggle(isOn: $showNoseAndThroat) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Nose and Throat")
                        }
                    }
                    if showNoseAndThroat {
                        Toggle("Loss of Smell", isOn: $lossOfSmell)
                            .onChange(of: lossOfSmell) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .lossOfSmell)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .lossOfSmell) }
                                    )
                                }
                            }
                        Toggle("Loss of Taste", isOn: $lossOfTaste)
                            .onChange(of: lossOfTaste) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .lossOfTaste)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .lossOfTaste) }
                                    )
                                }
                            }
                        Toggle("Runny Nose", isOn: $runnyNose)
                            .onChange(of: runnyNose) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .runnyNose)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .runnyNose) }
                                    )
                                }
                            }
                        Toggle("Sore Throat", isOn: $soreThroat)
                            .onChange(of: soreThroat) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .soreThroat)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .soreThroat) }
                                    )
                                }
                            }
                        Toggle("Sinus Congestion", isOn: $sinusCongestion)
                            .onChange(of: sinusCongestion) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .sinusCongestion)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .sinusCongestion) }
                                    )
                                }
                            }
                    }


                    Toggle(isOn: $showReproduction) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Reproduction")
                        }
                    }

                    if showReproduction {
                        Toggle("Breast Pain", isOn: $breastPain)
                            .onChange(of: breastPain) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .breastPain)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .breastPain) }
                                    )
                                }
                            }
                        Toggle("Pelvic Pain", isOn: $pelvicPain)
                            .onChange(of: pelvicPain) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .pelvicPain)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .pelvicPain) }
                                    )
                                }
                            }
                        Toggle("Vaginal Dryness", isOn: $vaginalDryness)
                            .onChange(of: vaginalDryness) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .vaginalDryness)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .vaginalDryness) }
                                    )
                                }
                            }
                    }


                    Toggle(isOn: $showSkinAndHair) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Skin and Hair")
                        }
                    }


                    if showSkinAndHair {
                        Toggle("Acne", isOn: $acne)
                            .onChange(of: acne) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .acne)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .acne) }
                                    )
                                }
                            }
                        Toggle("Dry Skin", isOn: $drySkin)
                            .onChange(of: drySkin) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .drySkin)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .drySkin) }
                                    )
                                }
                            }
                        Toggle("Hair Loss", isOn: $hairLoss)
                            .onChange(of: hairLoss) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .hairLoss)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .hairLoss) }
                                    )
                                }
                            }
                    }



                    Toggle(isOn: $showSleep) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Sleep")
                        }
                    }
                    if showSleep {
                        Toggle("Night Sweats", isOn: $nightSweats)
                            .onChange(of: nightSweats) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .nightSweats)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .nightSweats) }
                                    )
                                }
                            }
                        Toggle("Sleep Changes", isOn: $sleepChanges)
                            .onChange(of: sleepChanges) { value in
                                if value {
                                    manager.exportedProperties.append(
                                        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
                                    )
                                } else {
                                    manager.exportedProperties.removeAll(
                                        where: { $0 == HKObjectType.categoryType(forIdentifier: .sleepAnalysis) }
                                    )
                                }
                            }
                    }


                    Toggle(isOn: $showUrinary) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Urinary")
                        }
                    }

                    Toggle("Bladder Incontinence", isOn: $bladderIncontinence)
                        .onChange(of: bladderIncontinence) { value in
                            if value {
                                manager.exportedProperties.append(
                                    HKObjectType.categoryType(forIdentifier: .bladderIncontinence)!
                                )
                            } else {
                                manager.exportedProperties.removeAll(
                                    where: { $0 == HKObjectType.categoryType(forIdentifier: .bladderIncontinence) }
                                )
                            }
                        }
                }
            }
        }
    }
}



//MARK: old style
//            Section("Symptoms") {
//                Group {
//                    Toggle(isOn: $showAbdominal) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Abdominal and GI")
//                        }
//                    }
//                    if showAbdominal {
//                        Toggle("Abdominal Cramps", isOn: $abdominalCramps)
//                        Toggle("Bloating", isOn: $bloating)
//                        Toggle("Constipation", isOn: $constipation)
//                        Toggle("Diarrhea", isOn: $diarrhea)
//                        Toggle("Heartburn", isOn: $heartburn)
//                        Toggle("Nausea", isOn: $nausea)
//                        Toggle("Vomiting", isOn: $vomiting)
//                        Toggle("Appetite Changes", isOn: $appetiteChanges)
//                    }
//
//
//
//                    Toggle(isOn: $showConstitutional) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Constitutional")
//                        }
//                    }
//                    if showConstitutional {
//                        Toggle("Chills", isOn: $chills)
//                        Toggle("Dizziness", isOn: $dizziness)
//                        Toggle("Fainting", isOn: $fainting)
//                        Toggle("Fatigue", isOn: $fatigue)
//                        Toggle("Fever", isOn: $fever)
//                        Toggle("Generalized Body Ache", isOn: $generalizedBodyAche)
//                        Toggle("Hot Flashes", isOn: $hotFlashes)
//                    }
//
//                    Toggle(isOn: $showHeartAndLung) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Heart & Lung")
//                        }
//                    }
//
//                    if showHeartAndLung {
//                        Toggle("Chest Tightness or Pain", isOn: $chestTightnessOrPain)
//                        Toggle("Coughing", isOn: $coughing)
//                        Toggle("Rapid, Pounding or Fluttering Heartbeat", isOn: $rapidPoundingOrFlutteringHeartbeat)
//                        Toggle("Shortness of Breath", isOn: $shortnessOfBreath)
//                        Toggle("Skipped Heartbeat", isOn: $skippedHeartbeat)
//                        Toggle("Wheezing", isOn: $wheezing)
//                    }
//
//                    Toggle(isOn: $showMusculoskeletal) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Musculoskeletal")
//                        }
//                    }
//                    if showMusculoskeletal {
//                        Toggle("Lower Back Pain", isOn: $lowerBackPain)
//                    }
//
//                    Toggle(isOn: $showNeurological) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Musculoskeletal")
//                        }
//                    }
//                    if showNeurological {
//                        Toggle("Headache", isOn: $headache)
//                        Toggle("Memory Lapse", isOn: $memoryLapse)
//                        Toggle("Mood Changes", isOn: $moodChanges)
//                    }
//                }
//                Group {
//                    Toggle(isOn: $showNoseAndThroat) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Nose and Throat")
//                        }
//                    }
//                    if showNoseAndThroat {
//                        Toggle("Loss of Smell", isOn: $lossOfSmell)
//                        Toggle("Loss of Taste", isOn: $lossOfTaste)
//                        Toggle("Runny Nose", isOn: $runnyNose)
//                        Toggle("Sore Throat", isOn: $soreThroat)
//                        Toggle("Sinus Congestion", isOn: $sinusCongestion)
//                    }
//
//                    Toggle(isOn: $showReproduction) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Reproduction")
//                        }
//                    }
//
//                    if showReproduction {
//                        Toggle("Breast Pain", isOn: $breastPain)
//                        Toggle("Pelvic Pain", isOn: $pelvicPain)
//                        Toggle("Vaginal Dryness", isOn: $vaginalDryness)
//                    }
//
//                    Toggle(isOn: $showSkinAndHair) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Skin and Hair")
//                        }
//                    }
//
//
//                    if showSkinAndHair {
//                        Toggle("Acne", isOn: $acne)
//                        Toggle("Dry Skin", isOn: $drySkin)
//                        Toggle("Hair Loss", isOn: $hairLoss)
//                    }
//
//
//                    Toggle(isOn: $showSleep) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Sleep")
//                        }
//                    }
//                    if showSleep {
//                        Toggle("Night Sweats", isOn: $nightSweats)
//                        Toggle("Sleep Changes", isOn: $sleepChanges)
//                    }
//
//                    Toggle(isOn: $showUrinary) {
//                        HStack {
//                            Image(systemName: "airplane")
//                            Text("Show Urinary")
//                        }
//                    }
//
//                    if showUrinary {
//                        Toggle("Bladder Incontinence", isOn: $bladderIncontinence)
//                    }
//                }
//            }
