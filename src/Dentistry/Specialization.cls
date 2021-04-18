Class Dentistry.Specialization Extends (%Library.Persistent, %Populate)
{

Relationship doctor As Dentistry.Doctor [ Cardinality = one, Inverse = specializations ];

Property type As %Library.String;

Property description As %Library.String;

/// Returns ID of the new Object
ClassMethod InsertSpecialization(type As %String, description As %String) As %Integer
{
    &sql(INSERT INTO Dentistry.Specialization(type,description) VALUES(:type, :description))
    if (SQLCODE=0) {
        return %ROWID
    } 
    return 0
}

Storage Default
{
<Data name="SpecializationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idSpec</Value>
</Value>
<Value name="3">
<Value>specID</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>description</Value>
</Value>
<Value name="6">
<Value>doctor</Value>
</Value>
</Data>
<DataLocation>^Dentistry.SpecializationD</DataLocation>
<DefaultData>SpecializationDefaultData</DefaultData>
<IdLocation>^Dentistry.SpecializationD</IdLocation>
<IndexLocation>^Dentistry.SpecializationI</IndexLocation>
<StreamLocation>^Dentistry.SpecializationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
