const Joi = require('joi');

// Schemas
const productSchema = Joi.object({
    name: Joi.string().min(3).max(10).required(),
    price: Joi.number().min(1).max(10000).required(),
    description: Joi.string().min(10).required(),
    categoryId: Joi.number().min(1).required()
})

const validateData = (schema) =>{
    return (
        function (req, res, next){
            let data = req.body
            const validationOutput = schema.validate(data)
            // {value: , error: }

            if(validationOutput.error){
                res.send(validationOutput.error)
            }else{
                next()
            }
        }
    )
}

module.exports = {
    productSchema,
    validateData
};