const database = require('../database/connection')


class PeriodoController{
    newPeriodo(request, response){
        var {periodo} = request.body
                
        database.insert({periodo:periodo}).table("periodicidade").then(data =>{
            console.log(data)
            response.json({message:'Período criado com sucesso'})
        }).catch(error => {
            console.log(error)
        })
    }
}
module.exports = new PeriodoController()