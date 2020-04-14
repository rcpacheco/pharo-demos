Class {
	#name : #GOLToogleRunEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife-Events'
}

{ #category : #'mouse handlers' }
GOLToogleRunEventListener >> clickEvent: anEvent [
	"Go to Next Life"

	gameModel startLife
]

{ #category : #accessing }
GOLToogleRunEventListener >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLToogleRunEventListener >> gameModel: anObject [
	gameModel := anObject
]
