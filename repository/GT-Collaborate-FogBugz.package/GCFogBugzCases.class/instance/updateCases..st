updating
updateCases: aCollectionOfFogBugzCase
	| announcement |
	announcement := GCFogBugzCasesUpdated new.
	mutex critical: [ 
		aCollectionOfFogBugzCase do: [ :eachFogBugzCase |
			collection 
				detect: [ :eachTopic | eachTopic id = eachFogBugzCase id ]
				ifFound: [ :aTopic | 
					(aTopic lastModification isNil or: [ 
						aTopic lastModification < eachFogBugzCase lastModification ]) ifTrue: [ 
							aTopic case: eachFogBugzCase.
							announcement updatedTopic: aTopic ] ]
				ifNone: [ announcement newTopic: (self addTopic: eachFogBugzCase asGCFogBugzCase) ] 
		] ].
	announcement hasTopics ifTrue: [ self announce: announcement ].