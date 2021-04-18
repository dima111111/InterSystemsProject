import axios from 'axios'

export function sendJsonToAddr(addr, data) {
	const json = data;
	axios({
		method: 'post',
		url: addr,
		data: json
	});
}

function signUpForm(event) {
	event.preventDefault()
	const fio = event.target.FIO.value
	const birthDate = event.target.birthDate.value
	const email = event.target.email.value
	const phone = event.target.phone.value
	const dict = {
		FIO: fio,
		birthDate: birthDate,
		email: email,
		phone: phone
	}
	console.log(dict)
	sendJsonToAddr('http://localhost:9098/bmstuapi/login', dict)
}

export function SignUp() {
	return (
		<div>
			<form onSubmit={signUpForm}>
			<div>
				<p>
				<label><b>FIO</b>
				<input type="text" placeholder="Enter FIO" name="FIO" required />
				</label>
				</p>

				<p>
				<label><b>Birth Date</b>
				<input type="date" placeholder="Enter date" name="birthDate" required />
				</label>
				</p>

				<p>
				<label><b>Email</b>
				<input type="email" placeholder="Enter email" name="email" required />
				</label>
				</p>

				<p>
				<label><b>Phone</b>
				<input type="text" placeholder="Enter phone" name="phone" required />
				</label>
				</p>
				
				<p>
				<button type="submit">
					Sign Up</button>
				</p>
			</div>
			</form>
		</div>
	)
}