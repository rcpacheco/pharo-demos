Class {
	#name : #GOLToogledCellEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #'mouse handlers' }
GOLToogledCellEventListener >> clickEvent: anEvent [
 "Updates the cell state and the current state of the model when a cell is clicked"
	anEvent target toggleState.
	self gameModel
		setCellStateAt: anEvent currentTarget location
		value: anEvent target isAlive
]

{ #category : #accessing }
GOLToogledCellEventListener >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLToogledCellEventListener >> gameModel: anObject [
	gameModel := anObject
]
