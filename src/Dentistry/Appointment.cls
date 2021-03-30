/// Description
Class Dentistry.Appointment Extends %Library.Persistent
{

Property AppointmentID As %Library.BigInt;

Relationship DoctorID As Dentistry.Doctor [ Cardinality = one, Inverse = idDoctor ];

Relationship PatientID As Dentistry.Patient [ Cardinality = one, Inverse = idPatient ];

Property Date As %Library.Date;

Property Result As %Library.String;

Property Booked As %Library.Boolean;

Storage Default
{
<Data name="AppointmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AppointmentID</Value>
</Value>
<Value name="3">
<Value>DoctorID</Value>
</Value>
<Value name="4">
<Value>PatientID</Value>
</Value>
<Value name="5">
<Value>Date</Value>
</Value>
<Value name="6">
<Value>Result</Value>
</Value>
<Value name="7">
<Value>Booked</Value>
</Value>
</Data>
<DataLocation>^Dentistry.AppointmentD</DataLocation>
<DefaultData>AppointmentDefaultData</DefaultData>
<IdLocation>^Dentistry.AppointmentD</IdLocation>
<IndexLocation>^Dentistry.AppointmentI</IndexLocation>
<StreamLocation>^Dentistry.AppointmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
