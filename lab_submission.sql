-- CREATE EVN_average_customer_waiting_time_every_1_hour

CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
DO
BEGIN
    INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
    SELECT AVG(customer_service_total_wait_time_minutes)
    FROM customer_service_ticket
    WHERE customer_service_ticket_raise_time >= NOW() - INTERVAL 1 HOUR;
END;


-- CREATED THE TABLE USING THE CODE GIVE--

CREATE TABLE `customer_service_kpi` (
`customer_service_KPI_timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
`customer_service_KPI_average_waiting_time_minutes` INT NOT NULL,
PRIMARY KEY (`customer_service_KPI_timestamp`));