'use strict';

const fs = require('fs');
const service = require('./service');

(async function () {
    try {
        await service.connect();

        const resellerProfit = await service.getResellersProfit();
        writeFile('resellerProfit', resellerProfit);

        const clientCost = await service.getClientCost();
        writeFile('clientCost', clientCost);

        const topClientsList = await service.getTopClientsList();
        writeFile('topClientsList', topClientsList);

        const ordersInfo = await service.getOrdersInfo();
        writeFile('ordersInfo', ordersInfo);
    } catch (e) {
        console.log(e);
    } finally {
        service.close();
    }
}());

function writeFile(filename, data) {
    fs.writeFile(`data/${filename}.json`, JSON.stringify(data), () => {
        console.log(`The file ${filename}.json has been written`);
    });
}
