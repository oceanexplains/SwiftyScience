//
//  HealthKitManager.swift
//  SwiftyScience
//
//  Created by Ocean on 2/22/23.
//

import Foundation
import HealthKit



class HealthKitManager: ObservableObject {
    
    static let shared = HealthKitManager()
    
    let healthStore = HKHealthStore()
    
    //MARK: Sleep
    let healthKitSleepTypesToRead: Set<HKObjectType> = [
        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
    ]
    
    //MARK: Activity
    let healthKitActivityTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .stepCount)!,
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKObjectType.quantityType(forIdentifier: .runningGroundContactTime)!,
        HKObjectType.quantityType(forIdentifier: .runningPower)!,
        HKObjectType.quantityType(forIdentifier: .runningSpeed)!,
        HKObjectType.quantityType(forIdentifier: .runningStrideLength)!,
        HKObjectType.quantityType(forIdentifier: .runningVerticalOscillation)!,
        HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
        HKObjectType.quantityType(forIdentifier: .pushCount)!,
        HKObjectType.quantityType(forIdentifier: .distanceWheelchair)!,
        HKObjectType.quantityType(forIdentifier: .swimmingStrokeCount)!,
        HKObjectType.quantityType(forIdentifier: .distanceSwimming)!,
        HKObjectType.quantityType(forIdentifier: .distanceDownhillSnowSports)!,
        HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .flightsClimbed)!,
        HKObjectType.quantityType(forIdentifier: .nikeFuel)!,
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
        HKObjectType.quantityType(forIdentifier: .appleMoveTime)!,
        HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
        HKObjectType.quantityType(forIdentifier: .vo2Max)!,
        HKObjectType.workoutType()
    ]
    
    //MARK: Body Measurements
    let healthKitBodyMeasurementTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .height)!,
        HKObjectType.quantityType(forIdentifier: .bodyMass)!,
        HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
        HKObjectType.quantityType(forIdentifier: .leanBodyMass)!,
        HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!,
        HKObjectType.quantityType(forIdentifier: .waistCircumference)!,
        HKObjectType.quantityType(forIdentifier: .appleSleepingWristTemperature)!,
        HKObjectType.quantityType(forIdentifier: .basalBodyTemperature)!
    ]
    
    //MARK: Reproductive Health
    let healthKitReproductiveHealthTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .basalBodyTemperature)!
    ]
    
    let healthKitReproductiveTypesToRead: Set<HKObjectType> = [
        HKObjectType.categoryType(forIdentifier: .menstrualFlow)!,
        HKObjectType.categoryType(forIdentifier: .intermenstrualBleeding)!,
        HKObjectType.categoryType(forIdentifier: .infrequentMenstrualCycles)!,
        HKObjectType.categoryType(forIdentifier: .irregularMenstrualCycles)!,
        HKObjectType.categoryType(forIdentifier: .persistentIntermenstrualBleeding)!,
        HKObjectType.categoryType(forIdentifier: .prolongedMenstrualPeriods)!,
        HKObjectType.categoryType(forIdentifier: .cervicalMucusQuality)!,
        HKObjectType.categoryType(forIdentifier: .ovulationTestResult)!,
        HKObjectType.categoryType(forIdentifier: .progesteroneTestResult)!,
        HKObjectType.categoryType(forIdentifier: .sexualActivity)!,
        HKObjectType.categoryType(forIdentifier: .contraceptive)!,
        HKObjectType.categoryType(forIdentifier: .pregnancy)!,
        HKObjectType.categoryType(forIdentifier: .pregnancyTestResult)!,
        HKObjectType.categoryType(forIdentifier: .lactation)!
    ]
    
    //MARK: Hearing
    let healthKitHearingTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .environmentalAudioExposure)!,
        HKObjectType.quantityType(forIdentifier: .headphoneAudioExposure)!
    ]
    
    let healthKitHearingEventsToRead: Set<HKObjectType> = [
        HKObjectType.categoryType(forIdentifier: .environmentalAudioExposureEvent)!,
        HKObjectType.categoryType(forIdentifier: .headphoneAudioExposureEvent)!,
        HKObjectType.categoryType(forIdentifier: .audioExposureEvent)!
    ]

    
    //MARK: Vital Signs
    let healthKitVitalSignsTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
        HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
        HKObjectType.quantityType(forIdentifier: .heartRateRecoveryOneMinute)!,
        HKObjectType.quantityType(forIdentifier: .atrialFibrillationBurden)!,
        HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
        HKObjectType.quantityType(forIdentifier: .bodyTemperature)!,
        HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!,
        HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!,
        HKObjectType.quantityType(forIdentifier: .respiratoryRate)!
    ]
    
    //MARK: Lab and Test Results
    let healthKitLabAndTestResultTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .bloodGlucose)!,
        HKObjectType.quantityType(forIdentifier: .electrodermalActivity)!,
        HKObjectType.quantityType(forIdentifier: .forcedExpiratoryVolume1)!,
        HKObjectType.quantityType(forIdentifier: .forcedVitalCapacity)!,
        HKObjectType.quantityType(forIdentifier: .inhalerUsage)!,
        HKObjectType.quantityType(forIdentifier: .insulinDelivery)!,
        HKObjectType.quantityType(forIdentifier: .numberOfTimesFallen)!,
        HKObjectType.quantityType(forIdentifier: .peakExpiratoryFlowRate)!,
        HKObjectType.quantityType(forIdentifier: .peripheralPerfusionIndex)!,
        HKObjectType.categoryType(forIdentifier: .lowHeartRateEvent)!,
        HKObjectType.categoryType(forIdentifier: .highHeartRateEvent)!,
        HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!
    ]
    
    //MARK: Nutrition
    let healthKitNutritionTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .dietaryBiotin)!,
        HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!,
        HKObjectType.quantityType(forIdentifier: .dietaryCalcium)!,
        HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates)!,
        HKObjectType.quantityType(forIdentifier: .dietaryChloride)!,
        HKObjectType.quantityType(forIdentifier: .dietaryCholesterol)!,
        HKObjectType.quantityType(forIdentifier: .dietaryChromium)!,
        HKObjectType.quantityType(forIdentifier: .dietaryCopper)!,
        HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFiber)!,
        HKObjectType.quantityType(forIdentifier: .dietaryFolate)!,
        HKObjectType.quantityType(forIdentifier: .dietaryIodine)!,
        HKObjectType.quantityType(forIdentifier: .dietaryIron)!,
        HKObjectType.quantityType(forIdentifier: .dietaryMagnesium)!,
        HKObjectType.quantityType(forIdentifier: .dietaryManganese)!,
        HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum)!,
        HKObjectType.quantityType(forIdentifier: .dietaryNiacin)!,
        HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid)!,
        HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus)!,
        HKObjectType.quantityType(forIdentifier: .dietaryPotassium)!,
        HKObjectType.quantityType(forIdentifier: .dietaryProtein)!,
        HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin)!,
        HKObjectType.quantityType(forIdentifier: .dietarySelenium)!,
        HKObjectType.quantityType(forIdentifier: .dietarySodium)!,
        HKObjectType.quantityType(forIdentifier: .dietarySugar)!,
        HKObjectType.quantityType(forIdentifier: .dietaryThiamin)!,
        HKObjectType.quantityType(forIdentifier: .dietaryVitaminA)!,
        HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12)!,
        HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6)!
    ]
    
    //MARK: Alcohol Consumption
    let healthKitAlcoholConsumptionTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .bloodAlcoholContent)!,
        HKObjectType.quantityType(forIdentifier: .numberOfAlcoholicBeverages)!
    ]
    
    
    //MARK: Mobility
    let healthKitMobilityTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .appleWalkingSteadiness)!,
        HKObjectType.quantityType(forIdentifier: .sixMinuteWalkTestDistance)!,
        HKObjectType.quantityType(forIdentifier: .walkingSpeed)!,
        HKObjectType.quantityType(forIdentifier: .walkingStepLength)!,
        HKObjectType.quantityType(forIdentifier: .walkingAsymmetryPercentage)!,
        HKObjectType.quantityType(forIdentifier: .walkingDoubleSupportPercentage)!,
        HKObjectType.quantityType(forIdentifier: .stairAscentSpeed)!,
        HKObjectType.quantityType(forIdentifier: .stairDescentSpeed)!,
    ]
    
    
    //MARK: UV Exposure
    let healthKitUVExposureTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .uvExposure)!
    ]
    
    
    //MARK: Diving
    let healthKitDivingTypesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .underwaterDepth)!,
        HKObjectType.quantityType(forIdentifier: .waterTemperature)!
    ]
    
    //MARK: Symptoms
    let healthKitSymptomsToRead: Set<HKSampleType> = [
        HKObjectType.categoryType(forIdentifier: .abdominalCramps)!,
        HKObjectType.categoryType(forIdentifier: .bloating)!,
        HKObjectType.categoryType(forIdentifier: .constipation)!,
        HKObjectType.categoryType(forIdentifier: .diarrhea)!,
        HKObjectType.categoryType(forIdentifier: .heartburn)!,
        HKObjectType.categoryType(forIdentifier: .nausea)!,
        HKObjectType.categoryType(forIdentifier: .vomiting)!,
        HKObjectType.categoryType(forIdentifier: .appetiteChanges)!,
        HKObjectType.categoryType(forIdentifier: .chills)!,
        HKObjectType.categoryType(forIdentifier: .dizziness)!,
        HKObjectType.categoryType(forIdentifier: .fainting)!,
        HKObjectType.categoryType(forIdentifier: .fatigue)!,
        HKObjectType.categoryType(forIdentifier: .fever)!,
        HKObjectType.categoryType(forIdentifier: .generalizedBodyAche)!,
        HKObjectType.categoryType(forIdentifier: .hotFlashes)!,
        HKObjectType.categoryType(forIdentifier: .chestTightnessOrPain)!,
        HKObjectType.categoryType(forIdentifier: .coughing)!,
        HKObjectType.categoryType(forIdentifier: .rapidPoundingOrFlutteringHeartbeat)!,
        HKObjectType.categoryType(forIdentifier: .shortnessOfBreath)!,
        HKObjectType.categoryType(forIdentifier: .skippedHeartbeat)!,
        HKObjectType.categoryType(forIdentifier: .wheezing)!,
        HKObjectType.categoryType(forIdentifier: .lowerBackPain)!,
        HKObjectType.categoryType(forIdentifier: .headache)!,
        HKObjectType.categoryType(forIdentifier: .memoryLapse)!,
        HKObjectType.categoryType(forIdentifier: .moodChanges)!,
        HKObjectType.categoryType(forIdentifier: .lossOfSmell)!,
        HKObjectType.categoryType(forIdentifier: .lossOfTaste)!,
        HKObjectType.categoryType(forIdentifier: .runnyNose)!,
        HKObjectType.categoryType(forIdentifier: .soreThroat)!,
        HKObjectType.categoryType(forIdentifier: .sinusCongestion)!,
        HKObjectType.categoryType(forIdentifier: .breastPain)!,
        HKObjectType.categoryType(forIdentifier: .pelvicPain)!,
        HKObjectType.categoryType(forIdentifier: .vaginalDryness)!,
        HKObjectType.categoryType(forIdentifier: .acne)!,
        HKObjectType.categoryType(forIdentifier: .drySkin)!,
        HKObjectType.categoryType(forIdentifier: .hairLoss)!,
        HKObjectType.categoryType(forIdentifier: .nightSweats)!,
        HKObjectType.categoryType(forIdentifier: .sleepChanges)!,
        HKObjectType.categoryType(forIdentifier: .bladderIncontinence)!
    ]
    
    
    //MARK: Characteristics
    let healthKitCharacteristicTypesToRead: Set<HKObjectType> = [
        HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
        HKObjectType.characteristicType(forIdentifier: .bloodType)!,
        HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!,
        HKObjectType.characteristicType(forIdentifier: .fitzpatrickSkinType)!,
        HKObjectType.characteristicType(forIdentifier: .wheelchairUse)!
    ]
    
    
    
    //MARK: To Write
    let healthKitTypesToWrite: Set<HKSampleType> = []
    
    
    
    //MARK: Mark for Export
    @Published var exportedProperties: [HKObjectType] = []
    
    
    
}


extension HealthKitManager {
    
    //MARK: Union
    func unionOfHealthKitTypes(_ sets: [Set<HKObjectType>]) -> Set<HKObjectType> {
        var result = Set<HKObjectType>()
        for set in sets {
            result.formUnion(set)
        }
        return result
    }
    
    //MARK: Request Authorization
    
    func requestAuthorization(for hkSets: Set<HKObjectType>) {
        healthStore.requestAuthorization(toShare: healthKitTypesToWrite, read: hkSets) { (success, error) in
            if let error = error {
                print("Error requesting authorization for HealthKit: \(error.localizedDescription)")
            } else if success {
                print("Success: HealthKit authorization granted.")
            } else {
                print("Error requesting authorization for HealthKit: unknown error")
            }
        }
    }
    
    
    
    
    
    
    
    //MARK: Data Retrieval
    func getHeartRates(from startDate: Date, to endDate: Date, completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {

        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])

        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) { (query, results, error) in

            guard let samples = results as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }

            completion(samples, nil)
        }

        healthStore.execute(query)
    }
    
    func writeHeartRateDataToCSV(heartRates: [HKQuantitySample], completion: (Error?) -> Void) {
        
        var csvString = "Date,Time,Heart Rate\n"
        
        for heartRate in heartRates {
            let date = heartRate.endDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd,HH:mm:ss"
            let dateString = dateFormatter.string(from: date)
            let heartRate = heartRate.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
            let newLine = "\(dateString),\(heartRate)\n"
            csvString.append(newLine)
        }
        
        let exportFilePath = NSTemporaryDirectory() + "export.csv"
        let exportFileURL = URL(fileURLWithPath: exportFilePath)
        
        do {
            try csvString.write(to: exportFileURL, atomically: true, encoding: String.Encoding.utf8)
            completion(nil)
        } catch {
            completion(error)
        }
    }
}


//class HealthKitManager {
//
//    let healthStore = HKHealthStore()
//
//    func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
//
//        let healthKitTypesToRead = Set([
//            HKObjectType.quantityType(forIdentifier: .heartRate)!
//        ])
//
//        healthStore.requestAuthorization(toShare: [], read: healthKitTypesToRead) { (success, error) in
//            completion(success, error)
//        }
//    }
//
//    func getHeartRates(from startDate: Date, to endDate: Date, completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
//
//        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
//
//        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
//
//        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) { (query, results, error) in
//
//            guard let samples = results as? [HKQuantitySample], error == nil else {
//                completion(nil, error)
//                return
//            }
//
//            completion(samples, nil)
//        }
//
//        healthStore.execute(query)
//    }
//
//    func writeDataToCSV(heartRates: [HKQuantitySample], completion: (Error?) -> Void) {
//
//        var csvString = "Date,Time,Heart Rate\n"
//
//        for heartRate in heartRates {
//            let date = heartRate.endDate
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd,HH:mm:ss"
//            let dateString = dateFormatter.string(from: date)
//            let heartRate = heartRate.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
//            let newLine = "\(dateString),\(heartRate)\n"
//            csvString.append(newLine)
//        }
//
//        let exportFilePath = NSTemporaryDirectory() + "export.csv"
//        let exportFileURL = URL(fileURLWithPath: exportFilePath)
//
//        do {
//            try csvString.write(to: exportFileURL, atomically: true, encoding: String.Encoding.utf8)
//            completion(nil)
//        } catch {
//            completion(error)
//        }
//    }
//}

