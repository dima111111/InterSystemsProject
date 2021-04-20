import {useHistory} from 'react-router-dom'



export function Start() {
	const hist = useHistory()
	function signIn() {
		hist.push("/signIn")
	}
	function signUp() {
		hist.push("/signUp")
	}
	return (
		<div>
			
			<button onClick={signIn} type="button">Sign In</button>
			<button onClick={signUp} type="button">Sign Up</button>

			<h2>
				Welcome to<br />
				Dentistry
			</h2>

		</div>
	)
}

