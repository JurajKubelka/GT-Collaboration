initialization
initialize
	super initialize.
	tracker := FogBugzTracker pharo.
	queue := GCFogBugzCommandsQueue new.
	cases := GCFogBugzCases new.