tests
testProposedCaseIsSyncedAndModelUpdated
	| case1 case2 |
	"Do not test it for now, because Trantor framework is problematic for testing,
	and I am about to replace it with MQTT framework"
	true ifTrue: [ ^ self ].
	nodes newTwoClients; addThreeCases.
	case1 := nodes firstClientProposeCase.
	nodes syncTwoClients.
	case2 := nodes secondClient all detect: [ :eachCase | eachCase id = case1 id ].
	self assert: case2 isProposed.
