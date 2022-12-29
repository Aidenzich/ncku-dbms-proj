import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import Dropdown from 'react-bootstrap/Dropdown';
import React, { useState } from 'react';
import { DropdownButton } from 'react-bootstrap';
import Table from 'react-bootstrap/Table';


function App() {
  const [commands2Sql ] = useState({
    "select": {
      "sql": "SELECT * FROM doctors where doctors.age > 30",
      "desp": "Despcrition"
    },
    "delete": {
      "sql": "DELETE FROM doctors where doctors.status = 'draft'",
      "desp": "Despcrition"
    },
    "insert": {
      "sql": "INSERT INTO doctors (name) VALUES ('sante')",
      "desp": "Despcrition"
    },
    "update": {
      "sql": "UPDATE doctors SET name = 'sante'",
      "desp": "Despcrition"
    },
    "in": {
      "sql": "SELECT name from doctors WHERE doctor_id IN (SELECT doctor_id  FROM prescriptions)",
      "desp": "Despcrition"
    },
    "not_in":{
      "sql": "SELECT name from patients WHERE patient_id IN (SELECT patient_id  FROM prescriptions)",
      "desp": "Despcrition"
    },
    "exists":{
      "sql": "SELECT name from patients WHERE EXISTS (SELECT * FROM prescriptions where prescriptions.patient_id = patients.patient_id)",
      "desp": "Despcrition"
    },
    "not_exists":{
      "sql": "SELECT name from patients WHERE NOT EXISTS (SELECT * FROM prescriptions where prescriptions.patient_id = patients.patient_id)",
      "desp": "Despcrition"
    },
    "count":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    },
    "sum":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    },
    "max":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    },
    "min":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    },
    "avg":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    },
    "having":{
      "sql": "SQL-STR",
      "desp": "Despcrition"
    }
  })

  var requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  
  


  const [data, setData] = useState([])
  

  const [selectedCommand, setSelectedCommand] = useState("select")

  const handleSelect= (e)=>{
    console.log(e)
    setSelectedCommand(e)
    
    var query = commands2Sql[selectedCommand]["sql"]
    fetch("http://0.0.0.0:8055/demo/test?q="+query, requestOptions)
    .then(response => response.text())
    .then(result => {setData(JSON.parse(result)); console.log(result)})
    .catch(error => console.log('error', error));
  }
  


  return (
    <div className="App">
      <header className="App-header">
        <DropdownButton 
          title={"testing"}
          onSelect={handleSelect} >
            { Object.keys(commands2Sql).map((key, index)=>{
              return <Dropdown.Item key={key} eventKey={key}>{key}</Dropdown.Item>            
            }) }                                  
        </DropdownButton>
        <h4>You selected {selectedCommand}</h4>
        <h6> {commands2Sql[selectedCommand]["sql"]}</h6>
        <div style={{width:"1000px", overflow:"scroll"}}>
          { (data.length > 0)?<>
            <Table striped bordered hover variant="dark" responsive="sm">
              <thead>
                <tr>
                  {Object.keys(data[0]).map((column_name, idx)=>{
                    return <th>{column_name}</th>
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
          </>: null }
        </div>
       
      </header>
    </div>
  );
}

export default App;
