Class {
	#name : #GOLBoardLine,
	#superclass : #BlLineElement,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #'instance creation' }
GOLBoardLine class >> from: fromPont to: toPoint [
	" Creates a new instance of a line and positions it based on the receoved arguments"

	^ (BlLine from: fromPont to: toPoint) asElement
		border: (BlBorder paint: Color lightBrown width: 2);
		yourself
]
