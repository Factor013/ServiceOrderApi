const database = require('../database/connection')
const bcrypt = require('bcryptjs');

class UserController {

    newUser(request, response) {
        var { user, password, tipo, email, empresa, contato } = request.body
        var hash = bcrypt.hashSync(password, 10);
        database.select('email', 'password', 'tipo').from('usuarios').where('email', email).then((data) => {
            const userData = data[0]
            if (userData) {
                return response.status(401).send({ "message": 'Ja existe um usuario com esse email' })
            } else {
                database.insert({ "user": user, "password": hash, "tipo": tipo, "email": email, "empresa": empresa, "contato": contato }).table("usuarios").then(data => {
                    return response.status(200).send({ "message": 'Usuario Criado com sucesso' })
                }).catch(error => {
                    console.log(error)
                })
            }
        })
    }
    delUser(request, response) {
        var idUser = request.body.idusuarios
        database('usuarios').where("idusuarios", '=', idUser).del().then(() => {
            response.status(200).send({ message: "usuario excluido com sucesso" })
        }).catch((error) => {
            return response.status(401).send('Nao foi possivel excluir usuário')
        })
    }
    attUser(request, response) {
        var { idusuarios, user, password, tipo, email, empresa, contato } = request.body
        var hash = bcrypt.hashSync(password, 10);
        database('usuarios').where('idusuarios', '=', idusuarios)
            .update({
                user: user,
                password: hash,
                email: email,
                tipo: tipo,
                empresa: empresa,
                contato: contato
            }).then((data) => {
                response.status(200).send({ mensagem: "Usuario editado com sucesso" })
            }).catch((error) => {
                console.log(error)
            })
    }
    listUsers(request, response) {
        database.select('idusuarios', 'user', 'tipo', 'email', 'empresa', 'contato').from('usuarios').then((data) => {
            response.status(200).send({ data })
        }).catch((error) => {
            return response.status(400).send('Nao foi possivel mostrar dados')
        })
    }
    listUser(request, response){
        var usuario = request.body
        database.select('idusuarios', 'user', 'tipo', 'email', 'empresa', 'contato').from('usuarios').where('user', usuario.user).then((data) => {
            response.status(200).send(data)
        }).catch((error) => {
            return response.status(400).send('Nao foi possivel mostrar dados')
        })
    }
}

module.exports = new UserController()