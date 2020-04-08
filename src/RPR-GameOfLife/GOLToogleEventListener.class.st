"
I listen for Events from the Toggle button to start or stop the game

When the game starts  start a loop t apply the evolution rules and wait sometime for the next cicle.
After starting each cicle I force the update uf the age message and to update the board with the living cells.
"
Class {
	#name : #GOLToogleEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'golSpace'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #'mouse handlers' }
GOLToogleEventListener >> clickEvent: anEvent [
"Responds to a click event to the object asociated with the Event Listener"
	Transcript
		show: 'hello world ';
		cr
]

{ #category : #accessing }
GOLToogleEventListener >> golSpace [
	"Gives access to the reference of the Game of life space"
	^ golSpace
]

{ #category : #accessing }
GOLToogleEventListener >> golSpace: aGolSpace [
	"Updates the reference to the Game of life space"

	golSpace := aGolSpace
]
