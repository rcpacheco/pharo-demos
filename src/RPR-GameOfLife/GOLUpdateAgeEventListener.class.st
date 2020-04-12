Class {
	#name : #GOLUpdateAgeEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'age'
	],
	#category : #'RPR-GameOfLife-Events'
}

{ #category : #accessing }
GOLUpdateAgeEventListener >> age [
	^ age
]

{ #category : #accessing }
GOLUpdateAgeEventListener >> age: anObject [
	age := anObject
]
