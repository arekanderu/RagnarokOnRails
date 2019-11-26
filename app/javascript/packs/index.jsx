import React from 'react'
import ReactDOM from 'react-dom'
import App from '../components/App'

document.addEventListener('DOMContentLoad', () => {
  ReactDOM.render(
    <div>
    <App/>
    </div>,
    document.body.appendChild(document.createElement('div')),
  )
})