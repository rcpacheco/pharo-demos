Class {
	#name : #GOLCell,
	#superclass : #BlElement,
	#instVars : [
		'isAlive',
		'location'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLCell >> aliveColor [
	"Define the color of a cell when alive"

	^ Color black
]

{ #category : #initialization }
GOLCell >> cellSize [
	"Defines the height and width of the cell on the game board"

	^ 18
]

{ #category : #initialization }
GOLCell >> deadColor [
"Define the color of a cell when dead"
	^ Color lightYellow
]

{ #category : #initialization }
GOLCell >> initialize [
	"Set the initial state of the cell, its visual characteristics and the events it responds to."

	super initialize.
	isAlive := false.
	self
		background: self deadColor;
		size: self cellSize asPoint
]

{ #category : #accessing }
GOLCell >> isAlive [
	"Gives the current state of the cell"

	^ isAlive
]

{ #category : #accessing }
GOLCell >> location [
	^ location
]

{ #category : #accessing }
GOLCell >> location: anObject [
	location := anObject
]

{ #category : #updating }
GOLCell >> toggleState [
"Change the status and color of the cell"
	isAlive := isAlive not.
	isAlive
		ifTrue: [ self background: self aliveColor ]
		ifFalse: [ self background: self deadColor ]
]
