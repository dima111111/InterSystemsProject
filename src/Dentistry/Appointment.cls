Class Dentistry.Appointment Extends (%Library.Persistent, %Library.Populate)
{

Relationship doctor As Dentistry.Doctor [ Cardinality = one, Inverse = appointments ];

Relationship patient As Dentistry.Patient [ Cardinality = one, Inverse = appointments ];

Property date As %PosixTime;

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
<Value name="8">
<Value>idAppointment</Value>
</Value>
<Value name="9">
<Value>doctorID</Value>
</Value>
<Value name="10">
<Value>patientID</Value>
</Value>
<Value name="11">
<Value>date</Value>
</Value>
<Value name="12">
<Value>result</Value>
</Value>
<Value name="13">
<Value>booked</Value>
</Value>
<Value name="14">
<Value>doctor</Value>
</Value>
<Value name="15">
<Value>patient</Value>
</Value>
<Value name="16">
<Value>patientComment</Value>
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
