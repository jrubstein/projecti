import * as Koa from 'koa'
const app = new Koa()

app.use(ctx => {
    ctx.body = 'works1234'
})
  
app.listen( process.env.PORT || 3000, () => {
    console.log('started')
})