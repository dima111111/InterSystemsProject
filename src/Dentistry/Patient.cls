/// Description
Class Dentistry.Patient Extends (%Persistent, Dentistry.Person)
{
	Property ID As %Long [ Required ];
	Property Medical_history As %String [ Required ];
	Property Add_info As %String;
}