/// Description
Class Dentistry.Doctor Extends (%Persistent, Dentistry.Person)
{
	Property ID As %Long [ Required ];
	Property Experience As %String [ Required ];
	Property Education As %String [ Required ];
	Property Spec_ID As %String [ Required ];
}