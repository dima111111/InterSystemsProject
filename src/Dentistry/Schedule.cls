Class Dentistry.Schedule Extends %Library.Persistent
{

Property idSchedule As %Library.BigInt;

Relationship doctorID As Dentistry.Doctor [ Cardinality = one, Inverse = idDoctor ];

Property date As %Library.Date;

Property duration As %Library.Integer;

Storage Default
{
<Data name="ScheduleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
<Value name="3">
<Value>idSchedule</Value>
</Value>
<Value name="4">
<Value>DoctorID</Value>
</Value>
<Value name="5">
<Value>date</Value>
</Value>
<Value name="6">
<Value>duration</Value>
</Value>
<Value name="7">
<Value>doctorID</Value>
</Value>
</Data>
<DataLocation>^Dentistry.ScheduleD</DataLocation>
<DefaultData>ScheduleDefaultData</DefaultData>
<IdLocation>^Dentistry.ScheduleD</IdLocation>
<IndexLocation>^Dentistry.ScheduleI</IndexLocation>
<StreamLocation>^Dentistry.ScheduleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
