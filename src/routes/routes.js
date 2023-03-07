const connection = require('../database/connection')
const express = require('express')
const PeriodoController = require('../controllers/periodoController')
const UserController = require('../controllers/userController')
const LoginController = require('../controllers/loginController')

const router = express.Router()

router.post('/newuser',UserController.newUser)
router.post('/login',LoginController.Login)
router.post('/newperiodo',PeriodoController.newPeriodo)

module.exports = router