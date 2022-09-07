use dbNuvem

db.createCollection('Clientes')

db.Clientes.insertMany([
    {
        Nome: 'José',
        Sobrenome: 'Silva',
        Idade: 45,
        Sexo: 'Masculino'
    },
    {
        Nome: 'Jão',
        Sobrenome: 'Barros',
        Idade: 39,
        Sexo: 'Masculino'
    },
    {
        Nome: 'Joana',
        Sobrenome: 'Santos',
        Idade: 19,
        Sexo: 'Femenino',
    },
    {
        Nome: 'Olívia',
        Sobrenome: 'Ferreira',
        Idade: 25,
        Sexo: 'Femenino',
    }
])

db.Clientes.find().sort({ Idade: -1 }).limit(1)

db.Clientes.find().sort({ Idade: 1 }).limit(1)

