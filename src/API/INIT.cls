Class API.INIT
{

ClassMethod SetDataSettings() As %Status
{
    set ^%SYS("CSP","DefaultFileCharset") = "utf-8"
    Do ##class(Dentistry.Specialization).Populate(5)
    Do ##class(Dentistry.Doctor).Populate(10)
    Do ##class(Dentistry.Patient).Populate(5)
    Do ##class(Dentistry.Schedule).Populate(100)
    Return $$$OK
}

ClassMethod FillSpec() As %Status
{

    set obj1 = ["Терапевт","Стоматолог-терапевт занимается лечением заболеваний зубов, например, известного всем кариеса, ставит пломбы, занимается реставрацией зубов, общим лечением воспалений в ротовой полости."]
    set obj2 = ["Хирург","Стоматолог-хирург занимается «сложными» случаями, то есть при лечении болезней полости рта оказывает хирургическое вмешательство, например, хирургическое удаление зубов и корней зубов."]
    set obj3 = ["Ортопед","Стоматолог-ортопед занимается восстановлением и имплантацией зубов. "]
    set obj4 = ["Парадонтолог","Работа специалиста-пародонтолога связна с диагностикой и лечением заболеваний тканей, удерживающих зуб, например, различных воспалений десен (парадонтит, гингивит)."]
    set obj5 = ["Ортодонт","Исправления прикуса, выравнивание зубного ряда"]

    set st5 = ##class(Dentistry.Specialization).InsertSpecialization(obj5.%Get(0), obj5.%Get(1))

    Return $$$OK
}

}
