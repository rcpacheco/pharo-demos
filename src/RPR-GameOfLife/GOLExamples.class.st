Class {
	#name : #GOLExamples,
	#superclass : #Object,
	#category : #'RPR-GameOfLife-Examples'
}

{ #category : #'instance creation' }
GOLExamples class >> open [
	"I create and start a game"

	<gtExample>
	^ GOLSpace new 
]
