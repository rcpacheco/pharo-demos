Class {
	#name : #GOLGameModel,
	#superclass : #Object,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'age',
		'gridSize',
		'statesHistory',
		'currentState',
		'nextState',
		'deadNeighboarsBag',
		'cellsToToggleSet'
	],
	#category : #'RPR-GameOfLife-Model'
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
GOLGameModel >> cellsToToggleSet [
	^ cellsToToggleSet
]

{ #category : #accessing }
GOLGameModel >> cellsToToggleSet: anObject [
	cellsToToggleSet := anObject
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
GOLGameModel >> deadNeighboarsBag [
	^ deadNeighboarsBag
]

{ #category : #accessing }
GOLGameModel >> deadNeighboarsBag: anObject [
	deadNeighboarsBag := anObject
]

{ #category : #lifecycle }
GOLGameModel >> doLastLife [
	self pushCurrentStateToHistory.
	age := age + 1.
	currentState := nextState.
	nextState := GOLSparseMatrix new.
	deadNeighboarsBag removeAll.
	cellsToToggleSet removeAll
]

{ #category : #lifecycle }
GOLGameModel >> doNextLife [
	self pushCurrentStateToHistory.
	age := age + 1.
	currentState := nextState.
	nextState := GOLSparseMatrix new.
	deadNeighboarsBag removeAll.
	cellsToToggleSet removeAll
]

{ #category : #location }
GOLGameModel >> getAdjustedLocation: aPoint [
	^ ((aPoint x + gridSize x - 1) \\ gridSize x + 1)
		@ ((aPoint y + gridSize y - 1) \\ gridSize y + 1)
]

{ #category : #accessing }
GOLGameModel >> getAliveNeighborsAt: aPoint [
	^(self getNeighborsAt: aPoint)
		select:
			[ :adjustedLocation | self currentState isAlliveCellAt: adjustedLocation ]
]

{ #category : #accessing }
GOLGameModel >> getDeadNeighborsAt: aPoint [
	^(self getNeighborsAt: aPoint)
		reject:
			[ :adjustedLocation | self currentState isAlliveCellAt: adjustedLocation ]
]

{ #category : #accessing }
GOLGameModel >> getNeighborsAt: aPoint [
	^aPoint eightNeighbors
		collect: [ :location | self getAdjustedLocation: location ]
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
	nextState := GOLSparseMatrix new.
	statesHistory := OrderedCollection new.
	deadNeighboarsBag := Bag new.
	cellsToToggleSet := Set new.
]

{ #category : #testing }
GOLGameModel >> isAlliveCellAt: aPoint [
	"Returns true if a cell is registered as alive, otherwise returns false."

	^ currentState isAlliveCellAt: aPoint
]

{ #category : #history }
GOLGameModel >> isHistoryEmpty [
	"SChecks if the states history is empty."

	statesHistory isEmpty
]

{ #category : #lifecycle }
GOLGameModel >> lastLife [
	self doLastLife.
	self onLastLife
]

{ #category : #lifecycle }
GOLGameModel >> nextLife [
	| aliveNeighbors cellsToBeBorn |
	currentState content
		do: [ :cellLocation | 
			aliveNeighbors := self getAliveNeighborsAt: cellLocation.
			(aliveNeighbors size between: 2 and: 3)
				ifTrue: [ nextState addAll: cellLocation ]
				ifFalse: [ cellsToToggleSet addAll: cellLocation ].
			deadNeighboarsBag addAll: (self getDeadNeighborsAt: cellLocation) ].
	cellsToBeBorn := (deadNeighboarsBag valuesAndCounts
		associationsSelect: [ :assoc | assoc value = 3 ]) keys.
	nextState addAll: cellsToBeBorn.
	cellsToToggleSet addAll: cellsToBeBorn.
	self doNextLife.
	self onNextLife
]

{ #category : #accessing }
GOLGameModel >> nextState [
	^ nextState
]

{ #category : #accessing }
GOLGameModel >> nextState: anObject [
	nextState := anObject
]

{ #category : #lifecycle }
GOLGameModel >> onLastLife [
	self fireEvent: GOLLastDoneLifeEvent new
]

{ #category : #lifecycle }
GOLGameModel >> onNextLife [
		self fireEvent: GOLNextDoneLifeEvent new
]

{ #category : #history }
GOLGameModel >> popLastStateFromHistory [
	"Recovers the last state stored in history if there is one, otherwise trows an error."

	self
		assert: self isHistoryEmpty not
		description: [ 'History is empty' ].
	^ statesHistory removeLast
]

{ #category : #history }
GOLGameModel >> pushCurrentStateToHistory [
	"Stores the current state as the last element in the states history."

	self statesHistory addLast: self currentState
]

{ #category : #initialization }
GOLGameModel >> setCellStateAt: aPoint value: aValue [
	"Sets a cell state into the currentState sparse matrix"

	currentState setCellStateAt: aPoint value: aValue
]

{ #category : #lifecycle }
GOLGameModel >> startLife [
]

{ #category : #accessing }
GOLGameModel >> statesHistory [
	^ statesHistory
]

{ #category : #accessing }
GOLGameModel >> statesHistory: anObject [
	statesHistory := anObject
]

{ #category : #lifecycle }
GOLGameModel >> stopLife [
	
]
