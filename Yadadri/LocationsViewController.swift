//
//  LocationsViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 08/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit
import MapKit

class LocationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MKMapViewDelegate,CLLocationManagerDelegate{
    let pinIdentifier = "pinIdentifier"
    var locationsList = ["Hyderabad to YadagiriGutta","Nearest visit places"]
    var locationEvent = ["charminar","uppal","ghatkeswar","kila","raigiri","temple"]
    var locationManager: CLLocationManager!
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        self.mapView.delegate = self
        self.mapView .showsUserLocation = true
        
        
        
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(LocationsViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Routes"
        
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func showAnnotations(){
        zoomToRegion()
        let annotations = getMapAnnotations()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last!
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        //print("location = \(center.latitude) \(center.longitude)")
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors"  + error.localizedDescription)
    }
    
    
    
    func showPolyline(){
        zoomToRegion()
        
        let annotations = getMapAnnotations()
        
        // Add mappoints to Map
        mapView.addAnnotations(annotations)
        
        
        // Connect all the mappoints using Poly line.
        
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            points.append(annotation.coordinate)
        }
        
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        
        mapView.addOverlay(polyline)
        
    }
    
    func showPlaces(){
        let annotations = getSurroundingMapAnnotations()
        
        // Add mappoints to Map
        mapView.addAnnotations(annotations)
        
        
    }
    
    //MARK:- Annotations
    
    func getMapAnnotations() -> [Station] {
        var annotations:Array = [Station]()
        
        //load plist file
        
        var stations: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let annotation = Station(latitude: lat, longitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotation.image = item.valueForKey("image") as? String
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
    func getSurroundingMapAnnotations() -> [Surroundings] {
        var annotations:Array = [Surroundings]()
        
        //load plist file
        
        var stations: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("surroundings", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let annotation = Surroundings(latitude: lat, longitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotation.image = item.valueForKey("image") as? String
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(Station) {
            let yadgiriAnnotaion = annotation as! Station
            
            var annotaionView   =  self.mapView.dequeueReusableAnnotationViewWithIdentifier(pinIdentifier)
            if annotaionView == nil {
                annotaionView   = MKAnnotationView.init(annotation: annotation, reuseIdentifier: pinIdentifier)
            }
            annotaionView!.image = UIImage(named: yadgiriAnnotaion.image!)
            annotaionView!.draggable = true
            annotaionView!.canShowCallout = true
            
            let locationButton =  UIButton(type: UIButtonType.Custom) as UIButton
            locationButton.frame.size.width = 44
            locationButton.frame.size.height = 44
            locationButton.setImage(UIImage(named:yadgiriAnnotaion.image!), forState: .Normal)
            annotaionView!.leftCalloutAccessoryView = locationButton
            return annotaionView
        }
            
        else if(annotation.isKindOfClass(Surroundings)){
            let yadgiriAnnotaion = annotation as! Surroundings
            
            var annotaionView   =  self.mapView.dequeueReusableAnnotationViewWithIdentifier(pinIdentifier)
            if annotaionView == nil {
                annotaionView   = MKAnnotationView.init(annotation: annotation, reuseIdentifier: pinIdentifier)
            }
            annotaionView!.image = UIImage(named: yadgiriAnnotaion.image!)
            annotaionView!.draggable = true
            annotaionView!.canShowCallout = true
            
            let locationButton =  UIButton(type: UIButtonType.Custom) as UIButton
            locationButton.frame.size.width = 44
            locationButton.frame.size.height = 44
            locationButton.setImage(UIImage(named:yadgiriAnnotaion.image!), forState: .Normal)
            annotaionView!.leftCalloutAccessoryView = locationButton
            return annotaionView
        }
        return MKAnnotationView()
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? Station {
            self.showPolyline()
        }
    }
    
    
    
    
    
    //MARK:- MapViewDelegate methods
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if overlay is MKPolyline {
            polylineRenderer.strokeColor = UIColor.grayColor()
            polylineRenderer.lineWidth = 5
            
        }
        return polylineRenderer
    }
    
    //MARK:- Zoom to region
    
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: 17.4720, longitude: 78.7958)
        
        let region = MKCoordinateRegionMakeWithDistance(location,80000.0, 80000.0)
        
        mapView.setRegion(region, animated: true)
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "cell"
        let cell:UITableViewCell = locationTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = locationsList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.orangeColor()
        if(indexPath.row == 0){
            self.zoomToRegion()
            mapView.removeAnnotations(mapView.annotations)
            mapView.removeOverlays(mapView.overlays)
            self.showPolyline()
        }
        else if(indexPath.row == 1){
            self.zoomToRegion()
            mapView.removeAnnotations(mapView.annotations)
            mapView.removeOverlays(mapView.overlays)
            self.showPlaces()
        }
    }
    
    
    
}