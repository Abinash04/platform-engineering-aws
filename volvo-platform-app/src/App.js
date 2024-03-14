import React, {useState, useEffect} from 'react';
import './App.css';


function App() { 
    const [userAgent, setUserAgent] = useState('');
  
    useEffect(() => {
      // Fetch user agent information when page loads
      const userAgentInfo = navigator.userAgent;
      setUserAgent(userAgentInfo);
    }, []);

  return (
    <div className="App">
      <header className="App-header">        
        <h1> Welcome to 2022</h1>
        <p>User Agent: {userAgent}</p>
      </header>
    </div>
  );
}

export default App;
