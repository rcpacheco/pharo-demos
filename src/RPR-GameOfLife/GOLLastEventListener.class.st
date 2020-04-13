Class {
	#name : #GOLLastEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife-Events'
}

{ #category : #'mouse handlers' }
GOLLastEventListener >> clickEvent: anEvent [
	"Go to Last Life"

	gameModel lastLife
]

{ #category : #accessing }
GOLLastEventListener >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLLastEventListener >> gameModel: anObject [
	gameModel := anObject
]
