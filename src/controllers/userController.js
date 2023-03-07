const database = require('../database/connection')
const bcrypt = require('bcryptjs');

class UserController{
    newUser(request, response){
        var {user, password, tipo,email,empresa,contato} = request.body
        var hash = bcrypt.hashSync(password, 10);
        database.select('email','password','tipo').from('usuarios').where('email', email).then((data)=>{
           const userData = data[0] 
            if(userData){
                return response.status(401).send({"message":'Ja existe um usuario com esse email'})
            }else{
                database.insert({"user":user, "password":hash, "tipo":tipo, "email":email, "empresa":empresa, "contato":contato}).table("usuarios").then(data =>{
                    return response.status(200).send({"message":'Usuario Criado com sucesso'})
                }).catch(error => {
                    console.log(error)
                })
            }
        })
        
    }
}
module.exports = new UserController()