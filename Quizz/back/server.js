require('dotenv').config()
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());





const userRoutes = require('./routes/users');
const userTodo = require('./routes/todo.js');
const themeRoute = require('./routes/theme.js');

app.use('/api/users', userRoutes)
app.use('/api/todo', userTodo)
app.use('/api/themes', themeRoute)


const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log('Serveur demarre sur le port ' + port);
    
})