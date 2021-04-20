import axios from 'axios'
import { useHistory } from 'react-router-dom';
import style from './app.module.css'

export async function sendJsonToAddr(addr, data) {
	const json = data;
	return axios({
		method: 'post',
		url: addr,
		data: json
	});
}

async function signUpForm(event) {
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
	await sendJsonToAddr('http://localhost:9098/bmstuapi/login', dict)
	localStorage.setItem("user_email", email)
}

export function SignUp() {
	const hist = useHistory()
	const email = localStorage.getItem("user_email")
	if (email !== null) {
		hist.push("/patient")
	}
	return (
		<div>
			<form onSubmit={(event)=>signUpForm(event).then(()=>hist.push("/patient"))}>
			<div>
				<p>
				<label>
					<span className={style.secondary}>FIO: </span>
				<input type="text" placeholder="Enter FIO" name="FIO" required />
				</label>
				</p>

				<p>
				<label>
				<span className={style.secondary}>Birth date: </span>
				<input type="date" placeholder="Enter date" name="birthDate" required />
				</label>
				</p>

				<p>
				<label><span className={style.secondary}>Email: </span>
				<input type="email" placeholder="Enter email" name="email" required />
				</label>
				</p>

				<p>
				<label><span className={style.secondary}>Phone: </span>
				<input type="text" placeholder="Enter phone" name="phone" required />
				</label>
				</p>
				
				<div>
				<button type="submit">
					Sign Up</button>
				</div>
			</div>
			</form>
		</div>
	)
}