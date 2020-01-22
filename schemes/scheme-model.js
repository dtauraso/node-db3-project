const db = require('../data/db-config.js')

module.exports = {

    find,
    findById,
    findSteps,
    add,
    update,
    remove,


    addStep
}

// works
function find() {
    return db('schemes')
}

// works
function findById(id) {
    return db('schemes')
            .where({id})
            .first()
}
// works
function findSteps(id) {

    // select *
    // from schemes as s
    // left join steps as st on s.id=st.scheme_id
    return db('schemes as s')
            .leftJoin('steps as st', 's.id', 'st.scheme_id')
            .where('s.id', id)
            .select('s.id', 's.scheme_name', 'st.step_number', 'st.instructions')
            .orderBy('st.step_number')
}
// works
function add(newScheme) {
    return db('schemes')
            .insert(newScheme)
            .then(([id]) => {
                return findById(id)
            })
}


// works
function update(changes, id) {

    return db('schemes')
            .where('id', id)
            .update(changes)
}

// works
function remove(id) {
    return db('schemes')
            .where('id', id)
            .del()
}


// stretch goal
function addStep(newStep, id) {

}