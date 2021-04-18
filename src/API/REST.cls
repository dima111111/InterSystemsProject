/// Description
Class API.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CONTENTTYPE = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/test" Method="GET" Call="Test"/>
	<Route Url="/login" Method="POST" Call="signUp"/>
	<Route Url="/getDoctors" Method="GET" Call="getDoctors"/>
	<Route Url="/doctors/:idDoctor" Method="GET" Call="getDoctor"/>
	<Route Url="/doctors/:idDoctor" Method="GET" Call="getDoctor"/>
	<Route Url="/patient" Method="GET" Call="patientByEmail"/>
	<Route Url="/appointments" Method="POST" Call="makeAppointment"/>

</Routes>
}

ClassMethod Test() As %Status
{
	Set currentDate = $ZDATE($NOW(), 3)
	Set obj = {"msg":"It works","today": (currentDate)}
	Write obj.%ToJSON()
	Return $$$OK
}

ClassMethod signUp() As %Status
{
	Set sc = $$$OK
	try{
		set jo = {}.%FromJSON(%request.Content)
		set client = ##class(Dentistry.Patient).%New()
		set client.FIO = jo.FIO
		set client.birthDate = $ZDATEH(jo.birthDate, 3)
		set client.email = jo.email
		set client.phone = jo.phone
		set sc = client.%Save()
	} catch ex {
		Set errText = $SYSTEM.Status.GetErrorText(ex.AsStatus())
		Write errText
		return ex
	}
	Return sc
}

ClassMethod getDoctors() As %Status
{
	Set sc = $$$OK
	Set sql = "select JSON_OBJECT('ID': ID, 'FIO':FIO, 'birthDate':birthDate, 'email': email, 'phone': phone) as doctor FROM Dentistry.Doctor"
	Set rs = ##class(%SQL.Statement).%ExecDirect(, sql)
	Set obj = {"doctors": []}

	while rs.%Next() {
		Set doctor = {}.%FromJSON(rs.doctor)
		Do obj.doctors.%Push(doctor)
	}
	Write obj.%ToJSON()
	Return sc
}

ClassMethod getDoctor(idDoctor As %Integer) As %Status
{
	Set sc = $$$OK
	Set doctor = ##class(Dentistry.Doctor).%OpenId(idDoctor)
	Set d = {"schedules": []}
	Set key = ""
	Do {
		Set schedule = doctor.schedules.GetNext(.key)
		If (schedule '= "") {
			Set sch = {"date": (schedule.date)}
			Do d.schedules.%Push(sch)
		}
	} While (key '= "")

	Set dDoctor = {
		"ID": (doctor.%Id()),
		"FIO": (doctor.FIO),
		"birthDate": (doctor.birthDate), 
		"education": (doctor.education), 
		"email": (doctor.email), 
		"experience": (doctor.experience), 
		"phone": (doctor.phone)
	}
	Set d.doctor = dDoctor

	Write d.%ToJSON()
	Return sc
}

ClassMethod patientByEmail() As %Status
{
	Set sc = $$$OK
	Set FormEmail = $GET(%request.Data("email", 1))
	Set pat = ##class(Dentistry.Patient).emailKeyOpen(FormEmail)
	Set pPat = {
		"FIO": (pat.FIO), 
		"birthDate": (pat.birthDate), 
		"medicalHistory": (pat.medicalHistory), 
		"email": (pat.email), 
		"addInfo": (pat.addInfo), 
		"phone": (pat.phone)
	}
	
	
	Set p = {"appointments": [], "patient": (pPat)}
	Set key = ""
	Do {
		Set appointment = pat.appointments.GetNext(.key)
		If (appointment '= "") {
			Set doctor = appointment.doctor
			Set dDoctor = {
				"FIO": (doctor.FIO),
				"birthDate": (doctor.birthDate),
				"education": (doctor.education),
				"email": (doctor.email),
				"experience": (doctor.experience),
				"phone": (doctor.phone)
			}
			Set sch = {"date": (appointment.date), "doctor": (dDoctor)}
			Do p.appointments.%Push(sch)
		}
	} While (key '= "")

	Write p.%ToJSON()

	Return sc
}

ClassMethod makeAppointment() As %Status
{
	Set sc = $$$OK
	set jo = {}.%FromJSON(%request.Content)
	Set pat = ##class(Dentistry.Patient).emailKeyOpen(jo.userEmail)

	Set appointment = ##class(Dentistry.Appointment).%New()

	set appointment.date = jo.date

	Do appointment.patientSetObjectId(pat.%Id())
	Do appointment.doctorSetObjectId(jo.doctorId)
	Do appointment.%Save()

	Return sc
}

}
