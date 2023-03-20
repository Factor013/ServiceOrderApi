const connection = require('../database/connection')
const express = require('express')
const EquipamentoController = require('../controllers/equipamentoController')
const UserController = require('../controllers/userController')
const LoginController = require('../controllers/loginController')
const auth = require('../middleware/authToken')

const router = express.Router()

router.post('/login', LoginController.Login)

router.post('/newuser', auth, UserController.newUser)
router.post('/deluser', auth, UserController.delUser)
router.post('/attuser', auth, UserController.attUser)
router.get('/listusers', UserController.listUsers)
router.get('/listuser', UserController.listUser)

router.post('/newequipamento', EquipamentoController.newEquipamento)
router.post('/delequipamento', EquipamentoController.delEquipamento)

module.exports = router