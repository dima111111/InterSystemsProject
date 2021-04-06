Class Dentistry.Doctor Extends Dentistry.Person
{

Relationship appointments As Dentistry.Appointment [ Cardinality = many, Inverse = doctor ];

Relationship schedules As Dentistry.Schedule [ Cardinality = many, Inverse = doctor ];

Property experience As %Library.String [ Required ];

Property education As %Library.String [ Required ];

Relationship specializations As Dentistry.Specialization [ Cardinality = many, Inverse = doctor ];

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
<Value name="6">
<Value>experience</Value>
</Value>
<Value name="7">
<Value>education</Value>
</Value>
</Data>
<DefaultData>DoctorDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
