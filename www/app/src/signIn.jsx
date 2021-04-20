import axios from 'axios'
import { useHistory } from 'react-router-dom';
import style from './app.module.css'

async function signInForm(event) {
	event.preventDefault()
	const email = event.target.email.value	
	console.log(email)	
	localStorage.setItem("user_email", email)
}

export function SignIn() {
	const hist = useHistory()

	const email = localStorage.getItem("user_email")
	if (email !== null) {
		hist.push("/patient")
	}
	return (
		<div>
			<form onSubmit={(event)=>signInForm(event).then(()=>hist.push("/patient"))}>
			<div>

				<p>
				<label><b>Email</b>
				<input type="text" placeholder="Enter email" name="email" required />
				</label>
				</p>

				<p>
				<button type="submit">
					Sign In</button>
				</p>
			</div>
			</form>
		</div>
	)
}