//
//  LocationsViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 08/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit
import MapKit

class LocationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MKMapViewDelegate{
    var locationsList = ["Hyderabad to YadagiriGutta","Surroundings", "Nearest visit places"]
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func showSurroundings(){
        let surendrapuriLocation = CLLocationCoordinate2DMake(17.5657, 78.9451)
        let location1 = MKPointAnnotation()
        location1.coordinate = surendrapuriLocation
        location1.title = "Surendrapuri"
        mapView.addAnnotation(location1)
        
        let lotusTempleLocation = CLLocationCoordinate2DMake(17.5872291, 78.94825330000003)
        let location2 = MKPointAnnotation()
        location2.coordinate = lotusTempleLocation
        location2.title = "Lotus Temple"
        mapView.addAnnotation(location2)
    }
    
    func showPolyline(){
        let sourceLocation = CLLocationCoordinate2D(latitude:17.3850, longitude:78.4867)
        let destinationLocation = CLLocationCoordinate2D(latitude:17.5892, longitude:78.9448)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Hyderabad"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Yadagirigutta(62km from hyderabad)"
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.requestsAlternateRoutes = false
        
        var points: [CLLocationCoordinate2D]
        points = [sourceLocation, destinationLocation]
        
        let geodesic = MKGeodesicPolyline(coordinates: &points[0], count: 2)
        self.mapView.addOverlay(geodesic)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.redColor()
        renderer.lineWidth = 7.0
        
        return renderer
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
            mapView.removeAnnotations(mapView.annotations)
            mapView.removeOverlays(mapView.overlays)
            self.showPolyline()
        }
        else if(indexPath.row == 1){
            mapView.removeAnnotations(mapView.annotations)
            mapView.removeOverlays(mapView.overlays)
            self.showSurroundings()
        }
    }
    
    
    
}