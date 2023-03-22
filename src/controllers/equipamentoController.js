const database = require('../database/connection')


class EquipamentoController{
    newEquipamento(request, response){
        var {tipo_equipamento} = request.body
        database.select('tipo_equipamento').where("tipo_equipamento","=",tipo_equipamento).from('equipamento').then((data) => {
           var equipData = data[0]
            if(equipData){
                return response.status(401).send({ "message": 'Ja existe o equimento cadastrado' })
            }else{
                database.insert({"tipo_equipamento": tipo_equipamento}).table('equipamento').then(data =>{
                    response.json({message:'equipamento criado com sucesso'})
                }).catch(error => {
                    console.log(error)
                })
            }
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
    attEquipamento(request, response) {
        var { idequipamento, tipo_equipamento} = request.body
        database.select('*').where("idequipamento","=",idequipamento).from('equipamento').then((data) => {
            var dataEquip = data[0]
            if(dataEquip){
                console.log(idequipamento)
            database('equipamento').where('idequipamento','=', idequipamento).update({tipo_equipamento: tipo_equipamento}).then((data) => {
                response.status(200).send({ mensagem: "equipamento editado com sucesso" })
            }).catch((error) => {
                console.log(error)
            })
            }else{
                return response.status(402).send('Esse equipamento nao existe')
            }
        })
        
    }
}
module.exports = new EquipamentoController()