const ethers = require('ethers');
const jsonabi = require('./abi/contract.json');
const provider = ethers.getDefaultProvider('rinkeby');
const address = '';

provider.getBalance(address).then((balance) => {
    const contract = new ethers.Contract(address, jsonabi.abi, provider);
    const balanceInEth = ethers.utils.formatEther(balance);
    //instead of logging in console, use express to send the response

    console.log(`balance: ${balanceInEth} ETH`);
    console.log("contract: " + contract);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.warn(`App listening on http://localhost:${PORT}`);
});

app.get('/balance', (req, res) => {
   return res.send(`balance: ${balanceInEth} ETH`);
 });

 app.get('/publishers', (req, res) => {
  return res.getPublishers();
});

 app.get('/balances', (req, res) => {
  const publishersList = res.getPublishers();
  const balances = [];
  for (let i = 0; i < publishersList.length; i++) {
    balances.push(res.getBalance(publishersList[i]));
  }
  return balances;
});

app.get('/games', (req, res) => {
  return res;
});
 
 app.post('/', (req, res) => {
   return res.send('no POST HTTP method call');
 });
 
 app.put('/', (req, res) => {
   return res.send('no PUT HTTP method call');
 });
 
 app.delete('/', (req, res) => {
   return res.send('no DELETE HTTP method call');
 });



