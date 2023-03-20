const database = require('../database/connection')


class EquipamentoController{
    newEquipamento(request, response){
        var {tipo_equipamento} = request.body
        database.insert({"tipo_equipamento": tipo_equipamento}).table('equipamento').then(data =>{
            response.json({message:'equipamento criado com sucesso'})
        }).catch(error => {
            console.log(error)
        })
    }
    delEquipamento(request, response) {
        var {idequipamento} = request.body
        database('equipamento').where("idequipamento", '=', idequipamento).del().then(() => {
            response.status(200).send({ message: "Equipamento excluido com sucesso" })
        }).catch((error) => {
            return response.status(401).send('Nao foi possivel excluir equipamento')
        })
    }
}
module.exports = new EquipamentoController()