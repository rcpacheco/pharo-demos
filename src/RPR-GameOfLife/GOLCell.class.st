Class {
	#name : #GOLCell,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLCell >> initialize [
		super initialize.
	self background: Color black.
	self size: 4 asPoint.
	self geometry: BlSquare new
]

{ #category : #initialization }
GOLCell >> resolution [
	^ 4
]
