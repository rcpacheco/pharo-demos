Class {
	#name : #GOLCell,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLCell >> initialize [
	self background: Color black.
	self size: GOLBoard resolution asPoint.
	self geometry: BlSquare new.
]
