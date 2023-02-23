//
//  HealthKitPreferencesView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/22/23.
//

import SwiftUI

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
                        Toggle("Bloating", isOn: $bloating)
                        Toggle("Constipation", isOn: $constipation)
                        Toggle("Diarrhea", isOn: $diarrhea)
                        Toggle("Heartburn", isOn: $heartburn)
                        Toggle("Nausea", isOn: $nausea)
                        Toggle("Vomiting", isOn: $vomiting)
                        Toggle("Appetite Changes", isOn: $appetiteChanges)
                    }

                    Toggle(isOn: $showConstitutional) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Constitutional")
                        }
                    }
                    if showConstitutional {
                        Toggle("Chills", isOn: $chills)
                        Toggle("Dizziness", isOn: $dizziness)
                        Toggle("Fainting", isOn: $fainting)
                        Toggle("Fatigue", isOn: $fatigue)
                        Toggle("Fever", isOn: $fever)
                        Toggle("Generalized Body Ache", isOn: $generalizedBodyAche)
                        Toggle("Hot Flashes", isOn: $hotFlashes)
                    }
                    
                    Toggle(isOn: $showHeartAndLung) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Heart & Lung")
                        }
                    }
                    
                    if showHeartAndLung {
                        Toggle("Chest Tightness or Pain", isOn: $chestTightnessOrPain)
                        Toggle("Coughing", isOn: $coughing)
                        Toggle("Rapid, Pounding or Fluttering Heartbeat", isOn: $rapidPoundingOrFlutteringHeartbeat)
                        Toggle("Shortness of Breath", isOn: $shortnessOfBreath)
                        Toggle("Skipped Heartbeat", isOn: $skippedHeartbeat)
                        Toggle("Wheezing", isOn: $wheezing)
                    }
                    
                    Toggle(isOn: $showMusculoskeletal) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Musculoskeletal")
                        }
                    }
                    if showMusculoskeletal {
                        Toggle("Lower Back Pain", isOn: $lowerBackPain)
                    }
                    
                    Toggle(isOn: $showNeurological) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Musculoskeletal")
                        }
                    }
                    if showNeurological {
                        Toggle("Headache", isOn: $headache)
                        Toggle("Memory Lapse", isOn: $memoryLapse)
                        Toggle("Mood Changes", isOn: $moodChanges)
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
                        Toggle("Loss of Taste", isOn: $lossOfTaste)
                        Toggle("Runny Nose", isOn: $runnyNose)
                        Toggle("Sore Throat", isOn: $soreThroat)
                        Toggle("Sinus Congestion", isOn: $sinusCongestion)
                    }
                    
                    Toggle(isOn: $showReproduction) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Reproduction")
                        }
                    }
                    
                    if showReproduction {
                        Toggle("Breast Pain", isOn: $breastPain)
                        Toggle("Pelvic Pain", isOn: $pelvicPain)
                        Toggle("Vaginal Dryness", isOn: $vaginalDryness)
                    }
                    
                    Toggle(isOn: $showSkinAndHair) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Skin and Hair")
                        }
                    }
                    
                    
                    if showSkinAndHair {
                        Toggle("Acne", isOn: $acne)
                        Toggle("Dry Skin", isOn: $drySkin)
                        Toggle("Hair Loss", isOn: $hairLoss)
                    }
                    
                    
                    Toggle(isOn: $showSleep) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Sleep")
                        }
                    }
                    if showSleep {
                        Toggle("Night Sweats", isOn: $nightSweats)
                        Toggle("Sleep Changes", isOn: $sleepChanges)
                    }
                    
                    Toggle(isOn: $showUrinary) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Show Urinary")
                        }
                    }
                    
                    if showUrinary {
                        Toggle("Bladder Incontinence", isOn: $bladderIncontinence)
                    }
                }
            }
            
            
        }
    }
}

struct HealthKitPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        HealthKitPreferencesView()
    }
}
