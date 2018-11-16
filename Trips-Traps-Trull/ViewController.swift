//
//  ViewController.swift
//  Trips-Traps-Trull
//
//  Created by Paul Johannes Aru on 24.10.14.
//  Copyright (c) 2014 Mata2. All rights reserved.
//

import UIKit
import Darwin
import AVFoundation

class ViewController: UIViewController {

    
    
    //Enne mängu avamist
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Laeb teate sätted, mis teatab, et mäng on läbi, kui proovid kuhugile käia pärast mängu lõppu
        MängLäbiMeeldetuletus.title = "Mäng on Läbi"
        MängLäbiMeeldetuletus.message = "Rohkem käike ei saa teha!"
        MängLäbiMeeldetuletus.addButton(withTitle: "Okei")
        
        //Helisätted
        // if let path = NSBundle.mainBundle().pathForResource("Voit-Heli", ofType: "wav") {
        //     audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "wav", error: nil)
        // }
        
        //Mängija nime sätted
        NimeTeade.addTextField(configurationHandler: { (textField) -> Void in
        })
        NimeTeade.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let Nimi = self.NimeTeade.textFields![0] as UITextField
            print("Mängijanimi on \(Nimi.text)")
            self.Mängijanimi = Nimi.text!
            
            if self.Mängijanimi == "" {
                self.Mängijanimi = "Mängija"
            }
            
            self.MängijaNimeSilt.text = self.Mängijanimi
        }))
    }
    
    //Kui mäng avab
    override func viewDidAppear(_ animated: Bool) {
        
        //Küsib sinu nime
        self.present(NimeTeade, animated: true, completion: nil)
        
    }
    
    // Defineerisin iga ruudu ruudustikus ära
    @IBOutlet var Ruut1: UIButton!
    @IBOutlet var Ruut2: UIButton!
    @IBOutlet var Ruut3: UIButton!
    @IBOutlet var Ruut4: UIButton!
    @IBOutlet var Ruut5: UIButton!
    @IBOutlet var Ruut6: UIButton!
    @IBOutlet var Ruut7: UIButton!
    @IBOutlet var Ruut8: UIButton!
    @IBOutlet var Ruut9: UIButton!
    
    // Defineerisin Mängija nupu vahetamise jupid ära
    @IBOutlet var MängijaNupuLüliti: UISwitch!
    @IBOutlet var XDemo: UIImageView!
    @IBOutlet var ODemo: UIImageView!
    
    //Defineerisin Info sildi, Uus Mäng nupu ära, Taseme valiku nupu & Hoiatus teate
    @IBOutlet var Info: UILabel!
    @IBOutlet var UusMäng: UIButton!
    @IBOutlet var TasemeValik: UISegmentedControl!
    var MängLäbiMeeldetuletus: UIAlertView = UIAlertView()
    
    //Mängija nimi
    var NimeTeade = UIAlertController(title: "Nimi", message: "Sisesta Enda Nimi!", preferredStyle: .alert)
    var Mängijanimi = ""
    
    //VõiduKriips
    @IBOutlet var VõiduKriips: UIImageView!
    
    //Defineerisin Audiomängija
    var audioPlayer: AVAudioPlayer?
    
    
    // Defineerisin Mängija & Arvuti nupu
    var MängijaNupp = UIImage(named: "X")
    var ArvutiNupp = UIImage(named: "O")
    var TühiNupp = UIImage ()
    var Arvutikord = false
    var MängLäbi = false
    var Kord = 0 //Lisasin selleks, et kontrollida, kelle kord mängida on
    var Suvaline = 0 //Suvaline arv, mille järgi arvuti valib, millisesse ruutu mängida
    var SunnitudSuvaline = false
    
    //Defineerisin Statistika Sildid ära
    
    @IBOutlet var MängijaNimeSilt: UILabel!
    @IBOutlet var MängijaVõitudeSilt: UILabel!
    @IBOutlet var ArvutiVõitudeSilt: UILabel!
    var MängijaVõitudeArv = 0
    var ArvutiVõitudeArv = 0

    
    //Kontrollib, kui Nuppu vahetatakse, milline nupp on mängijal & milline on arvutil
    @IBAction func MängijaNuppuVahetati(_ sender: AnyObject) {
        if Kord<1 {
            if MängijaNupuLüliti.isOn {
                MängijaNupp = UIImage(named: "O")
                ArvutiNupp = UIImage(named: "X")
            } else {
                MängijaNupp = UIImage(named: "X")
                ArvutiNupp = UIImage(named: "O")
            }
        }
    }
    
    //Kui mängija vajutab ühele ruudule,paneb sinna mängija nupu (X või O)
    @IBAction func Ruut1Vajutati(_ sender: AnyObject) {
        if Ruut1.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut1.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut1.tag = 1
            //Kui on Mängija käinud, siis tuleb arvuti kord
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut2Vajutati(_ sender: AnyObject) {
        if Ruut2.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut2.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut2.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut3Vajutati(_ sender: AnyObject) {
        if Ruut3.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut3.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut3.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut4Vajutati(_ sender: AnyObject) {
        if Ruut4.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut4.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut4.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut5Vajutati(_ sender: AnyObject) {
        if Ruut5.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut5.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut5.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut6Vajutati(_ sender: AnyObject) {
        if Ruut6.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut6.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut6.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut7Vajutati(_ sender: AnyObject) {
        if Ruut7.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut7.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut7.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut8Vajutati(_ sender: AnyObject) {
        if Ruut8.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut8.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut8.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    @IBAction func Ruut9Vajutati(_ sender: AnyObject) {
        if Ruut9.tag == 0 && MängLäbi == false && Arvutikord == false {
            Ruut9.setBackgroundImage(MängijaNupp, for: UIControlState())
            Kord = Kord+1
            Ruut9.tag = 1
            if Kord < 9 {
                Arvutikord = true
            }
        }
    }
    
    
    
    
    
    //Läheb tööle siis, kui ükskõik millist ruutu mängija vajutab
    @IBAction func ÜhteRuutuVajutati(_ sender: AnyObject) {
        
        //Tuleb teade, kui vajutad ruudustikule, aga mäng on juba läbi
        if MängLäbi == true {
            MängLäbiMeeldetuletus.show()
        }
        
        //Kui mäng on alanud, siis nuppu ja taset ei saa vahetada enam
        if Kord > 0 {
            MängijaNupuLüliti.isHidden = true
            XDemo.isHidden = true
            ODemo.isHidden = true
            TasemeValik.isHidden = true
        }
        
        //Kui mäng saab läbi ja keegi ei ole siiamaani võitnud (Viik)
        if Kord == 9 {
            Info.isHidden = false
            MängLäbi = true
        }
        
        //Võidukontrolli funktsioon
        func VõiduKontroll(_ A:Int,B:Int,C:Int) {
            if A==1 && B==1 && C==1 {
                Info.isHidden = false
                Info.text = Mängijanimi+" Võitis"
                if let Heli = audioPlayer {
                    Heli.prepareToPlay()
                    Heli.play()
                }
                MängijaVõitudeArv=MängijaVõitudeArv+1
                MängijaVõitudeSilt.text = String(MängijaVõitudeArv)
                MängLäbi = true
            } else if A==2 && B==2 && C==2 {
                Info.isHidden = false
                Info.text = "Arvuti Võitis"
                ArvutiVõitudeArv=ArvutiVõitudeArv+1
                ArvutiVõitudeSilt.text = String(ArvutiVõitudeArv)
                MängLäbi = true
            }
        }

        //Võidukontroll 1
        if MängLäbi == false {
            VõiduKontroll(Ruut1.tag,B: Ruut2.tag,C: Ruut3.tag)
            VõiduKontroll(Ruut4.tag,B: Ruut5.tag,C: Ruut6.tag)
            VõiduKontroll(Ruut7.tag,B: Ruut8.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut1.tag,B: Ruut4.tag,C: Ruut7.tag)
            VõiduKontroll(Ruut2.tag,B: Ruut5.tag,C: Ruut8.tag)
            VõiduKontroll(Ruut3.tag,B: Ruut6.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut1.tag,B: Ruut5.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut3.tag,B: Ruut5.tag,C: Ruut7.tag)
        }
        
        while Arvutikord == true {
            //Keeruline Tase
            if TasemeValik.selectedSegmentIndex == 1 {
                //Vertikaalselt otsib kuhu käia
                switch (Ruut1.tag,Ruut2.tag,Ruut3.tag) {
                    //Kui Mängija on käinud nii, et järgmisel käigul ta võidaks
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut3.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut2.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut2.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    //Kui sina oled käinud nii, et sellel käigul sa saad võita
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut3.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch1")
                            Ruut2.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut2.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                        //Muul juhul (Ilma selleta kood ei tööta) lisasin mõtetu koodijupi
                    default:
                    Info.description
                }
                switch (Ruut4.tag,Ruut5.tag,Ruut6.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut6.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut6.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut4.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut4.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut6.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut6.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut4.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut4.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch2")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                switch (Ruut7.tag,Ruut8.tag,Ruut9.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut8.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut8.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch3")
                            Ruut8.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut8.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                
                //Horisontaalselt
                switch (Ruut1.tag,Ruut4.tag,Ruut7.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut4.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut4.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch4")
                            Ruut4.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut4.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                switch (Ruut2.tag,Ruut5.tag,Ruut8.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut8.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut8.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut2.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut2.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut8.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut8.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut2.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut2.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch5")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                switch (Ruut3.tag,Ruut6.tag,Ruut9.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut3.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut6.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut6.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut3.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch6")
                            Ruut6.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut6.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                
                //Diagonaalselt
                switch (Ruut1.tag,Ruut5.tag,Ruut9.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut9.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut1.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch7")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                switch (Ruut3.tag,Ruut5.tag,Ruut7.tag) {
                    case (1,1,0):
                        if Arvutikord == true {
                            print("Switch8")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,1,1):
                        if Arvutikord == true {
                                print("Switch8")
                                Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                                Ruut3.tag = 2
                                Kord = Kord + 1
                                Arvutikord = false
                        }
                    case (1,0,1):
                        if Arvutikord == true {
                            print("Switch8")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,2,0):
                        if Arvutikord == true {
                            print("Switch8")
                            Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut7.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (0,2,2):
                        if Arvutikord == true {
                            print("Switch8")
                            Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut3.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    case (2,0,2):
                        if Arvutikord == true {
                            print("Switch8")
                            Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                            Ruut5.tag = 2
                            Kord = Kord + 1
                            Arvutikord = false
                        }
                    default:
                        Info.description
                }
                
                if Arvutikord == true {
                    SunnitudSuvaline=true
                }
            }
        
        //Lihtne Tase
            if TasemeValik.selectedSegmentIndex == 0 || SunnitudSuvaline == true {
                //Pakub suvalise arvu
                Suvaline = Int(arc4random_uniform(9)+1)
                print("Suvaline Arv on: \(Suvaline)")
                if Suvaline == 1 && Ruut1.tag == 0 {
                    Ruut1.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut1.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 2 && Ruut2.tag == 0 {
                    Ruut2.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut2.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 3 && Ruut3.tag == 0 {
                    Ruut3.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut3.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 4 && Ruut4.tag == 0 {
                    Ruut4.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut4.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 5 && Ruut5.tag == 0 {
                    Ruut5.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut5.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 6 && Ruut6.tag == 0 {
                    Ruut6.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut6.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 7 && Ruut7.tag == 0 {
                    Ruut7.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut7.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 8 && Ruut8.tag == 0 {
                    Ruut8.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut8.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                } else if Suvaline == 9 && Ruut9.tag == 0 {
                    Ruut9.setBackgroundImage(ArvutiNupp, for: UIControlState())
                    Kord = Kord+1
                    Ruut9.tag = 2
                    SunnitudSuvaline = false
                    Arvutikord = false
                }
            }
        }
        
        //Võidu Kontroll 2, juhul kui arvuti peaks võitma
        if MängLäbi == false {
            VõiduKontroll(Ruut1.tag,B: Ruut2.tag,C: Ruut3.tag)
            VõiduKontroll(Ruut4.tag,B: Ruut5.tag,C: Ruut6.tag)
            VõiduKontroll(Ruut7.tag,B: Ruut8.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut1.tag,B: Ruut4.tag,C: Ruut7.tag)
            VõiduKontroll(Ruut2.tag,B: Ruut5.tag,C: Ruut8.tag)
            VõiduKontroll(Ruut3.tag,B: Ruut6.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut1.tag,B: Ruut5.tag,C: Ruut9.tag)
            VõiduKontroll(Ruut3.tag,B: Ruut5.tag,C: Ruut7.tag)
        }
        
        //Kui mäng saab läbi, tuleb nupp, et alustada uut mängu ja Joon, mis tähistab võitu
        if MängLäbi == true {
            if Ruut1.tag != 0 && Ruut1.tag == Ruut2.tag && Ruut2.tag == Ruut3.tag {
                VõiduKriips.image = UIImage(named:"Voit1")
                
            }
            if Ruut4.tag != 0 && Ruut4.tag == Ruut5.tag && Ruut5.tag == Ruut6.tag {
                VõiduKriips.image = UIImage(named:"Voit2")
            }
            if Ruut7.tag != 0 && Ruut7.tag == Ruut8.tag && Ruut8.tag == Ruut9.tag {
                VõiduKriips.image = UIImage(named:"Voit3")
            }
            if Ruut1.tag != 0 && Ruut1.tag == Ruut4.tag && Ruut4.tag == Ruut7.tag {
                VõiduKriips.image = UIImage(named:"Voit4")
            }
            if Ruut2.tag != 0 && Ruut2.tag == Ruut5.tag && Ruut5.tag == Ruut8.tag {
                VõiduKriips.image = UIImage(named:"Voit5")
            }
            if Ruut3.tag != 0 && Ruut3.tag == Ruut6.tag && Ruut9.tag == Ruut3.tag {
                VõiduKriips.image = UIImage(named:"Voit6")
            }
            if Ruut1.tag != 0 && Ruut1.tag == Ruut5.tag && Ruut5.tag == Ruut9.tag {
                VõiduKriips.image = UIImage(named:"Voit7")
            }
            if Ruut3.tag != 0 && Ruut3.tag == Ruut5.tag && Ruut5.tag == Ruut7.tag {
                VõiduKriips.image = UIImage(named:"Voit8")
            }
            UusMäng.isHidden = false
        }
    }

    @IBAction func UusMängHakkab(_ sender: AnyObject) {
        VõiduKriips.image = UIImage()
        UusMäng.isHidden = true
        MängijaNupuLüliti.isHidden = false
        XDemo.isHidden = false
        ODemo.isHidden = false
        TasemeValik.isHidden = false
        Kord = 0
        MängLäbi = false
        Arvutikord = false
        
        Ruut1.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut1.tag=0
        Ruut2.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut2.tag=0
        Ruut3.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut3.tag=0
        Ruut4.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut4.tag=0
        Ruut5.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut5.tag=0
        Ruut6.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut6.tag=0
        Ruut7.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut7.tag=0
        Ruut8.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut8.tag=0
        Ruut9.setBackgroundImage(TühiNupp, for: UIControlState())
        Ruut9.tag=0
        
        Info.isHidden = true
        Info.text = "Viik"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

