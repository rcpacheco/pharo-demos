Class {
	#name : #GOLGameModel,
	#superclass : #Object,
	#instVars : [
		'age',
		'gridSize',
		'statesHistory',
		'currentState'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLGameModel >> age [
	^ age
]

{ #category : #accessing }
GOLGameModel >> age: anObject [
	age := anObject
]

{ #category : #accessing }
GOLGameModel >> currentState [
	"Gives access to the current state of the model"

	^ currentState
]

{ #category : #accessing }
GOLGameModel >> currentState: anObject [
	currentState := anObject
]

{ #category : #location }
GOLGameModel >> getAdjustedLocation: aPoint toSize: aSize [
	| targetX targetY |
	targetX := aPoint x = 0
		ifTrue: [ aSize x ]
		ifFalse: [ aPoint x = aSize x
				ifTrue: [ 0 ]
				ifFalse: [ aPoint x ] ].
	targetY := aPoint y = 0
		ifTrue: [ aSize y ]
		ifFalse: [ aPoint y = aSize y
				ifTrue: [ 0 ]
				ifFalse: [ aPoint y ] ].
	^ targetX @ targetY
]

{ #category : #accessing }
GOLGameModel >> getAliveNeighborsAt: aPoint [
	aPoint eightNeighbors
		collect: [ :location | 
			self
				getAdjustedLocation: location
				toSize: self gridSize ]
		thenSelect:
			[ :adjustedLocation | self currentState isAlliveCellAt: adjustedLocation ]
]

{ #category : #accessing }
GOLGameModel >> gridSize [
	"Gives acces to the size of the game's grid"

	^ gridSize
]

{ #category : #accessing }
GOLGameModel >> gridSize: anObject [
"Set the size of the grid"
	gridSize := anObject
]

{ #category : #initialization }
GOLGameModel >> initialize [
	"Set te initial conditions of the model, excepts for the gridSize, 
	 that hast to be set bup depending on the board size"

	age := 0.
	currentState := GOLSparseMatrix new.
	statesHistory := OrderedCollection new
]

{ #category : #history }
GOLGameModel >> isHistoryEmpty [
	"SChecks if the states history is empty."

	statesHistory isEmpty
]

{ #category : #history }
GOLGameModel >> popLastStateFromHistory [
	"Recovers the last state stored in history."

	statesHistory removeLast
]

{ #category : #history }
GOLGameModel >> pushCurrentStateToHistory [
	"Stores the current state as the last element in the states history."

	statesHistory addLast: self currentState
]

{ #category : #initialization }
GOLGameModel >> setCellStateAt: aPoint value: aValue [
	"Sets a cell state into the currentState sparse matrix"

	currentState setCellStateAt: aPoint value: aValue

]
