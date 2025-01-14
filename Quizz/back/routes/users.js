const express = require('express'),
    router = express.Router(),
    bcrypt = require('bcrypt'),
    jwt = require('jsonwebtoken'),
    db = require('../config/db');
require('dotenv').config();



router.get('/', (req, res) => {
    const sql = 'SELECT * FROM users';
    // const sql = 'SELECT * FROM vueForm';

    db.query(sql, (err, results) => {
        if(err){
            return res.status(500).send(err);
        }else{
            res.status(200).json(results);
        }
    })
})

router.post('/register', async (req, res) => {
    console.log(req.body);
    
    const {  name , password , email , firstName , lastName} = req.body;
    console.log(lastName, "ici back");
    
    
    try{
        // const checkUserSql = 'SELECT * FROM vueForm WHERE name = ?'
        const checkUserSql = 'SELECT * FROM users WHERE name = ?'
        const users = await new Promise((resolve,reject)=> {
            db.query(checkUserSql, [name],async (err,user) => {
                if(err){
                    return reject(err)
                }
                resolve(user)
            }) 
        })
        
        if(users.length > 0){
            return res.status(400).json({message: 'Utilisateur existent'})
        }
        const   hashedPassword = await bcrypt.hash(password, 10);
        const   sql = 'INSERT INTO users (name, password , email , nom , prenom) VALUES (?,?,?,?,?)';
        // const   sql = 'INSERT INTO vueForm (name, password , email) VALUES (?,?,?)';
        
        const result = await new Promise((resolve, reject) =>{      
            db.query(sql, [name, hashedPassword , email , lastName, firstName], (err, result) => {
                if(err){
                    return reject(err);
                }
                resolve(result)
            })
        })
        const token = jwt.sign({
            id: result.insertId,
            name: name,
            password: password,
            fistname: firstName,
            lastName: lastName,
            role : 'user'
        },process.env.SECRETKEY,{ expiresIn: '2d'})
        
        res.status(201).send({token});
        
    }
    catch(err){
        res.status(500).send(err);
        
    }
})

router.put('/update', async(req,resultat) => {
    const {id, name, email,  prenom,  nom, password} = req.body
    // console.log(req.body);
    console.log("kjdhljdjsugfkjshkfhslkfhlisjflsfj",req.body);
    
    try{

        const sqlTab = [],
        values = [];
        if (name) {
            sqlTab.push('name = ?')
            values.push(name)
        }
        if (email) {
            sqlTab.push('email = ?')
            values.push(email)
        }
        if (password) {
            sqlTab.push('password = ?')
            values.push(password)
        }
        if (prenom) {
            sqlTab.push('prenom = ?')
            values.push(prenom)
            console.log("ici",prenom);
            
        }
        if (nom) {
            sqlTab.push('nom = ?')
            values.push(nom)
        }
        
        values.push(id)
        
        const sql = `UPDATE users SET ${sqlTab.join(", ")} WHERE id = ?`;
        await new Promise ((resolve,reject)=> {
           db.query(sql, values, (err,result) => {
            if (err) {
                return reject(err);
              }
              resolve(result);
        }) 
        })
        const newUser = await new Promise((resolve, reject) => {
    
            const getUserSql = 'SELECT * FROM users WHERE id = ?';
        
            db.query(getUserSql, [id], (err, result) => {
                if (err) {
                    return reject(err);
                  }
                  resolve(result[0]);
                  
            })
        })
        const user = { 
            id: newUser.id,
            name: newUser.name,
            password: newUser.password,
            email: newUser.email,
            firstName: newUser.prenom,
            lastName: newUser.nom,
            createdAt: newUser.createdAT
        };
        const token = jwt.sign(
            { id: user.id, name: user.name , firstName: user.firstName, lastName: user.lastName , createdAt : user.createdAt , email : user.email , password: user.password},
            'secretKey',
            { expiresIn: '1d' });
            
            resultat.status(200).send({messsage: 'Utilisateur modifier',token: token}) 
        } catch (err) {
            console.log('t la bb ! ', err) ;
            
    }
})

router.delete('/:id', async(req, res) => {
    const 
        id = req.params.id,
        sql = "DELETE FROM users WHERE id = ?";

    db.query(sql, [id], (err, result) => {
        if(err){
            return res.status(500).send(err);
        }
        res.status(200).send('Utilisateur supprimer');

        
    })
})

router.post('/login', async (req, res) => {
    const { name, password } = req.body;
    const sql = 'SELECT * FROM users WHERE name = ?';

    db.query(sql, [name], async (err, results) => {
        if (err) {
            return res.status(500).send({message:'Erreur lors de la connexion'});

        }

        if (results.length === 0 || !(await bcrypt.compare(password, results[0].password))) {
            return res.status(401).send({ message: 'Nom d\'utilisateur ou mot de passe incorrect' });
        }

        const user = { 
            id: results[0].id,
            name: results[0].name,
            password: results[0].password,
            email: results[0].email,
            firstName: results[0].prenom,
            lastName: results[0].nom,
            createdAt: results[0].createdAT
        };
        const token = jwt.sign(
            { id: user.id, name: user.name , firstName: user.firstName, lastName: user.lastName , createdAt : user.createdAt , email : user.email , password: user.password},
            'secretKey',
            { expiresIn: '1d' });

        res.status(200).send({ token });
    });
});

router.get('/mesage',async (req, res) => {
    const token = req.headers.authorization.split(' ')[1];
    const decodedToken = jwt.verify(token, 'secretkey');
    const userId = decodedToken.userId;
    req.auh = {
        userId: userId
    };
    const sql = 'SELECT message FROM message WHERE EXISTS (SELECT 1 FROM users WHERE users.id = ?);';
    db.query(sql ,[userId],async (err, res ) => {
        if(err){
            res.status(400).send('Probleme de conexion')
        }
        
    })
})

module.exports=router;