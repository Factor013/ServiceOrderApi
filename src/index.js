const express = require('express')
const cors = require('cors')
const router = require('./routes/routes')

const app = express()
app.use(cors())
app.use(express.json())
app.use(router)

app.listen(3000, () => {
    console.log('Servidor On')
})

app.get('/', (request, response) => {
    response.send("Fala fio...")
})