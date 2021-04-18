
import axios from 'axios'

function sendJsonToAddr(addr, data) {
	const json = data;
	axios({
		method: 'post',
		url: addr,
		data: json
	});
}

function loginForm(event) {
	event.preventDefault()
	const fio = event.target.FIO.value;
	const birthDate = event.target.birthDate.value
	const email = event.target.email.value
	const phone = event.target.phone.value
	const dict = {
		FIO: fio,
		birthDate: birthDate,
		email: email,
		phone: phone
	}
	sendJsonToAddr('http://localhost:9098/bmstuapi/login', dict)
}

function getDoctors() {
	console.log("get Doctors")
	var addr = 'http://localhost:9098/bmstuapi/getDoctors'
	const json = {}
	axios({
		method: 'get',
		url: addr,
		data: json
	})
	console.log(json)
}

function App() {
	return (
		<p>
			Welcome to Dentistry
			<p>
			<a href='loginForm.html'>
				Register
			</a>
			</p>
		</p>
	)
}

export default App;
