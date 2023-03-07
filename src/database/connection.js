var knex = require('knex')({
    client: 'mysql2',
    connection: {
        host : 'localhost',      
        user : 'root',       
        password : 'admin', 
        database : 'serviceorder'       
     }
});
module.exports = knex