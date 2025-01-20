const express = require('express'),
    router = express.Router(),
    db = require('../config/db');
require('dotenv').config();

router.get('/theme' ,(req,res) => {
    const sql = 'SELECT * FROM themes  '

    db.query(sql, (err, results) => {
        if(err){
            return res.status(500).send(err);
        }else{
            res.status(200).json(results);
        }
    })

})

router.get('/question/:id', (req , res) => {
    const id = req.params.id
    const sql = "SELECT * FROM questions WHERE theme_id = ?"

    db.query(sql , [id] , (err,results) => {
        if (err) {
            return res.status(500).send(err)
        } else {
            res.status(200).json(results);
        }
    })
})

router.get('/response/:id', (req , res) =>{
    const idQuestion = req.params.id
    const sql = "SELECT * FROM response WHERE question_id = ?" 

    db.query(sql , [idQuestion] , (err,results) => {
        if (err) {
            return res.status(500).send(err)
        } else {
            res.status(200).json(results);
        }
    })
})

module.exports=router;