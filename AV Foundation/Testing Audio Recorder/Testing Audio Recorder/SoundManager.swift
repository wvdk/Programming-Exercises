//
//  SoundManager.swift
//

import Foundation
import AVFoundation

class SoundManager: NSObject {
    
    static let shared = SoundManager()
    
    let sessionSwapQueue = DispatchQueue(label: "soundmanager.sessionswap")
    static let volumeChangedNotification = NSNotification.Name("com.octi.octi.SoundManager.volumeChangedNotification")
    static let volumeKey = "com.octi.octi.SoundManager.volume"
    
    private lazy var audioSession = AVAudioSession.sharedInstance()
    
    private var identifierToPlayer: [String: AVAudioPlayer] = [:]
    private var playerToIdentifier: [AVAudioPlayer: String] = [:]
    
    private override init() {
        super.init()
        audioSession.addObserver(self, forKeyPath: #keyPath(AVAudioSession.outputVolume), options: [.new], context: nil)
    }
    
    deinit {
        audioSession.removeObserver(self, forKeyPath: #keyPath(AVAudioSession.outputVolume))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let userInfo: [String: Any]?
        if let newVolume = change?[NSKeyValueChangeKey.newKey] as? Double {
            userInfo = [SoundManager.volumeKey: newVolume]
        } else {
            userInfo = nil
        }
        NotificationCenter.default.post(name: SoundManager.volumeChangedNotification, object: nil, userInfo: userInfo)
    }
    
    
    
    
    
    func setupRecordingAudioSession() {
        // Allow background music to keep playing.
        
        sessionSwapQueue.async {
            do {
                try? self.audioSession.setActive(false)
                //                try self.audioSession.setCategory(convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord), with: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
                
                try self.audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.videoRecording, options: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
                try self.audioSession.setActive(true)
            } catch {
                print("Error: could not set audio session category. \(error)")
            }
        }
        
        
    }
    
    func setupPlaybackAudioSession() {
        sessionSwapQueue.async {
            do {
                try self.audioSession.setCategory(.ambient, mode: .moviePlayback, options: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
                try self.audioSession.setActive(true)
            } catch {
                print("Error: could not set audio session category. \(error)")
            }
        }
    }
    
    func setupForcedPlaybackSession() {
        sessionSwapQueue.async {
            do {
                try self.audioSession.setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
                try self.audioSession.setActive(true)
            } catch {
                print("Error: could not set audio session category. \(error)")
            }
        }
    }
    
    @discardableResult func playSound(name: String, ext: String = "wav") -> String? {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("failed to find sound file")
            assert(false, "failed to find sound file")
            return nil
        }
        
        do {
            let identifier = UUID().uuidString
            let player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.play()
            self.identifierToPlayer[identifier] = player
            self.playerToIdentifier[player] = identifier
            return identifier
        } catch let error {
            print(error)
        }
        return nil
    }
    
    func stop(identifier: String) {
        if let player = self.identifierToPlayer[identifier] {
            self.identifierToPlayer[identifier] = nil
            player.stop()
            self.playerToIdentifier[player] = nil
        }
    }
}

extension SoundManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let urlString = player.url?.absoluteString ?? "unknown url"
        if let identifier = self.playerToIdentifier[player] {
            self.identifierToPlayer[identifier] = nil
        }
        player.stop()
        self.playerToIdentifier[player] = nil
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
    return input.rawValue
}
