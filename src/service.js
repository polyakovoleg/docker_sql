'use strict';

const mysql = require('mysql');
const { promisify } = require('util');

const CONFIG = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME,
};

let connection;
let query;

// waiting while docker-compose run mysql container
function connect(count) {
    connection = mysql.createConnection(CONFIG);

    if (!count) {
        count = 1;
    }

    return new Promise((resolve, reject) => {
        connection.connect(err => {
            if (err) {
                if (count < 60) {
                    connection.end();
                    setTimeout(() => resolve(connect(count + 1)), 1000);
                } else {
                    console.log(err);
                    reject(err);
                }
            } else {
                query = promisify(connection.query).bind(connection);
                resolve();
            }
        });
    });
}

exports.connect = connect;

exports.close = function () {
    connection.end();
};

exports.getResellersProfit = async function () {
    const queryStr = `
        SELECT r.name, SUM(o.sum) as profit
        FROM order_items as o
        LEFT OUTER JOIN auto_models as m
            ON o.model_id = m.id
        LEFT OUTER JOIN resellers as r
            ON m.reseller_id = r.id
        group by r.name;
    `;

    return query(queryStr);
};

exports.getClientCost = async function () {
    const queryStr = `
        SELECT c.second_name, b.name as brand, SUM(oi.quantity) as quantity, SUM(oi.sum) as cost FROM mydb.orders as o
        LEFT OUTER JOIN clients as c
            ON c.id = o.client_id
        LEFT OUTER JOIN order_items as oi
            ON oi.order_id = o.id
        LEFT OUTER JOIN auto_models as m
            ON m.id = oi.model_id
        LEFT OUTER JOIN auto_brands as b
            ON b.id = m.brand_id
        group by c.second_name, b.name
        order by cost DESC;
    `;

    return query(queryStr);
};

exports.getTopClientsList = async function () {
    const queryStr = `
        SELECT DISTINCT c.first_name, c.second_name FROM mydb.orders as o
        LEFT OUTER JOIN mydb.clients as c
            ON c.id = o.client_id
        group by o.date_created, c.id
        HAVING SUM(o.sum) > 2500000;
    `;

    return query(queryStr);
};

exports.getOrdersInfo = async function () {
    const queryStr = `
        SELECT c.first_name, c.second_name, o.sum as cost, o.date_created as date
            FROM mydb.orders as o
        LEFT OUTER JOIN mydb.clients as c
            ON c.id = o.client_id
        group by o.id, c.id
        order by o.sum DESC;
    `;

    return query(queryStr);
};
