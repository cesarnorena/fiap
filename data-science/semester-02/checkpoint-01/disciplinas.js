use cesarNorena

//db.Disciplinas.drop()

db.createCollection('Disciplinas')

db.Disciplinas.insertMany([
    {
        name: 'Python',
        professor: 'Edson',
        dia: 1
    },
    {
        name: 'Statistics',
        professor: 'Reinaldo',
        dia: 1
    },
    {
        name: 'Neural networks',
        professor: 'Michele',
        dia: 2
    },
    {
        name: 'Artificial intelligence',
        professor: 'André',
        dia: 2
    },
    {
        name: 'Cyber security',
        professor: 'Carolinne',
        dia: 3
    },
    {
        name: 'Data science',
        professor: 'Fernando',
        dia: 3
    },
    {
        name: 'Platforms and services',
        professor: 'Fernando',
        dia: 4
    },
    {
        name: 'Machine learning',
        professor: 'Michel',
        dia: 4
    },
    {
        name: 'Python',
        professor: 'Edson',
        dia: 5
    },
    {
        name: 'Artificial intelligence',
        professor: 'André',
        dia: 5
    },
])

db.Disciplinas.find()

db.Disciplinas.find({
    dia: 5
})

db.Disciplinas.updateOne(
    { dia: 5 },
    { $set: { dia: 6 }}
)

db.Disciplinas.find({
    dia: 6
})

db.Disciplinas.insertOne({
    name: 'Happy hour',
    professor: 'César',
    dia: 6
})

db.Disciplinas.deleteOne({
    dia: 1
})

db.Disciplinas.find({
    dia: 1
})

