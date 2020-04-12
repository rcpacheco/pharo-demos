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
