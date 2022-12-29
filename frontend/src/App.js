import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import Dropdown from 'react-bootstrap/Dropdown';
import React, { useState } from 'react';
import { DropdownButton } from 'react-bootstrap';
import Table from 'react-bootstrap/Table';


function App() {
  const [commands2Sql] = useState({    
    "select": {
      "sql": "SELECT * FROM patients where patients.age > 30",
      "desp": "Despcrition"
    },    
    "insert": {
      "sql": "INSERT INTO patients (name, gender, age, contact_info) VALUES  ('John Wick', 'M', 45, 'john.wick@example.com');",
      "desp": "Despcrition"
    },
    "update": {
      "sql": "UPDATE patients SET age = 46 WHERE name = 'John Wick';",
      "desp": "Despcrition"
    },
    "delete": {
      "sql": "DELETE FROM patients where patients.name = 'John Wick';",
      "desp": "Despcrition"
    },
    "in": {
      "sql": "SELECT * FROM patients WHERE gender IN ('F');",
      "desp": "Despcrition"
    },
    "not_in":{
      "sql": "SELECT * FROM patients WHERE gender NOT IN ('F');",
      "desp": "Despcrition"
    },
    "exists":{
      "sql": "SELECT * FROM patients WHERE EXISTS (SELECT 1 FROM prescriptions WHERE prescriptions.patient_id = patients.patient_id);",
      "desp": "Despcrition"
    },
    "not_exists":{
      "sql": "SELECT * FROM patients WHERE NOT EXISTS (SELECT 1 FROM prescriptions WHERE prescriptions.patient_id = patients.patient_id)",
      "desp": "Despcrition"
    },
    "count":{
      "sql": "SELECT COUNT(*) FROM patients;",
      "desp": "Despcrition"
    },
    "sum":{
      "sql": "SELECT SUM(total_amount) FROM sales;",
      "desp": "Despcrition"
    },
    "max":{
      "sql": "SELECT * FROM drug_stocks WHERE price = (SELECT MAX(price) FROM drug_stocks);",
      "desp": "Despcrition"
    },
    "min":{
      "sql": "SELECT * FROM patients WHERE age = (SELECT MIN(age) FROM patients);",      
      "desp": "Despcrition"
    },
    "avg":{
      "sql": "SELECT AVG(age) FROM doctors;",
      "desp": "Despcrition"
    },
    "having":{
      "sql": "SELECT name, gender FROM patients GROUP BY name, gender HAVING gender='F'",
      "desp": "Despcrition"
    }
  })

  let requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  
  

  const [queryRows, setQueryRows] = useState(0)
  const [data, setData] = useState([])
  

  const [selectedCommand, setSelectedCommand] = useState("")

  const handleSelect= (e)=>{    
    if (e !== '') {
      
      setSelectedCommand(e)      
      let query = commands2Sql[e]["sql"]
      
      setData([]);
      fetch("http://0.0.0.0:8055/demo/test?q="+query, requestOptions)
      .then(response => response.text())
      .then(result => {
        result = JSON.parse(result)
        setData(result['rows']);          // Query row data
        setQueryRows(result['rowCount'])  // Query related data
      })
      .catch(error => console.log('error', error));
    }    
  }
  


  return (
    <div className="App">
      <header className="App-header">
        <DropdownButton 
          title={"Select your query"}
          onSelect={handleSelect} >
            { Object.keys(commands2Sql).map((key, index)=>{
              return <Dropdown.Item key={key} eventKey={key}>{key}</Dropdown.Item>            
            }) }                                  
        </DropdownButton>
        {(selectedCommand !== '')?
          <>
            <h4>You selected <font color='orange'>{selectedCommand}</font></h4>
            <h5><font color='cyan'>{commands2Sql[selectedCommand]["sql"]}</font></h5>
            <h6>Your query related to {queryRows} row.</h6>                        
              { (data.length > 0)?<>
                <div style={{width:"1000px", overflowX:"scroll"}}>
                  <Table striped bordered hover variant="dark" responsive="sm">
                    <thead>
                      <tr>
                        {Object.keys(data[0]).map((column_name, idx)=>{
                          return <th key={idx}>{column_name}</th>
                        })}                  
                      </tr>
                    </thead>
                    <tbody>
                      {data.map((row, i)=>{
                        return <>
                          <tr>
                          {Object.keys(data[0]).map((column_name, idx)=>{
                            return <th>{row[column_name]}</th>
                          })}                       
                          </tr>
                        </>
                      }) }                
                    </tbody>
                  </Table>
                </div>
              </>: null }            
          </>
          :
          <></>
        }       
      </header>
    </div>
  );
}

export default App;
