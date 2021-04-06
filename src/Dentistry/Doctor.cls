/// Description
Class Dentistry.Doctor Extends Dentistry.Person
{

Relationship idDoctor As Dentistry.Appointment [ Cardinality = many, Inverse = DoctorID ];
Relationship idDoctor As Dentistry.Schedule [ Cardinality = many, Inverse = DoctorID ];

Property experience As %Library.String [ Required ];

Property education As %Library.String [ Required ];

Property specID As %Library.String [ Required ];

Storage Default
{
<Data name="DoctorDefaultData">
<Subscript>"Doctor"</Subscript>
<Value name="1">
<Value>Experience</Value>
</Value>
<Value name="2">
<Value>Education</Value>
</Value>
<Value name="3">
<Value>SpecID</Value>
</Value>
<Value name="4">
<Value>idPEP</Value>
</Value>
<Value name="5">
<Value>idDoctorA</Value>
</Value>
</Data>
<DefaultData>DoctorDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
