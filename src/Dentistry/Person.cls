/// Description
Class Dentistry.Person Extends (%Populate, %JSON.Adaptor, %XML.Adaptor) [ Abstract ]
{
	Property FIO As %String [ Required ];
	Property Birth_date As %Date [ Required ];
	Property Email As %String [ Required ];
	Property Phone As list Of %String [ Required ];
}