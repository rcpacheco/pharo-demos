Class {
	#name : #GOLNextEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife-Events'
}

{ #category : #'mouse handlers' }
GOLNextEventListener >> clickEvent: anEvent [
	"Go to Next Life"

	gameModel nextLife
]

{ #category : #accessing }
GOLNextEventListener >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLNextEventListener >> gameModel: anObject [
	gameModel := anObject
]
