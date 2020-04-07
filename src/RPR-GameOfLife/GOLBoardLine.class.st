Class {
	#name : #GOLBoardLine,
	#superclass : #BlLineElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLBoardLine class >> from: fromPont to: toPoint [
	^ (BlLine from: fromPont to: toPoint) asElement
		border: (BlBorder paint: Color lightBrown width: 2);
		yourself
]
