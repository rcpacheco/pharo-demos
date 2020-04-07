Class {
	#name : #GOLCell,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLCell >> cellSize [
	^ 18
]

{ #category : #initialization }
GOLCell >> initialize [
	super initialize.
	self background: Color green.
	self size: self cellSize asPoint.
	self geometry: BlSquare new
]
