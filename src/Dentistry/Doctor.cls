/// Description
Class Dentistry.Doctor Extends Dentistry.Person
{

Property ID As %Integer [ Required ];

Property Experience As %String [ Required ];

Property Education As %String [ Required ];

Property SpecID As %String [ Required ];

Storage Default
{
<Data name="DoctorDefaultData">
<Subscript>"Doctor"</Subscript>
<Value name="1">
<Value>ID</Value>
</Value>
<Value name="2">
<Value>Experience</Value>
</Value>
<Value name="3">
<Value>Education</Value>
</Value>
<Value name="4">
<Value>SpecID</Value>
</Value>
</Data>
<DefaultData>DoctorDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
