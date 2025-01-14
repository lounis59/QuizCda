const express = require('express'),
    router = express.Router(),
    becrypt = require('bcrypt'),
    jwt = require('jsonwebtoken'),
    mysql = require('mysql2');
    require('dotenv').config();

    const db = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME
    });

    router.get('/todo', (req, res) => {
        const sql = 'SELECT * FROM Todo';
        db.query(sql, (err, results) => {
            if(err){
                return res.status(500).send(err);
            }else{
                res.status(200).json(results);
            }
        })
    })
    
    module.exports=router;
