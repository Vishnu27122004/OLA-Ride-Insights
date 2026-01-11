-- OLA Ride Insights SQL Queries
-- Data Analysis and Business Intelligence Queries

-- 1. Total rides and booking metrics
SELECT 
    COUNT(*) as total_rides,
    COUNT(DISTINCT user_id) as unique_users,
    COUNT(DISTINCT driver_id) as unique_drivers,
    AVG(ride_distance) as avg_distance_km,
    AVG(ride_duration_minutes) as avg_duration_minutes
FROM rides;

-- 2. Ride completion rate
SELECT 
    status,
    COUNT(*) as count,
    ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER(), 2) as percentage
FROM rides
GROUP BY status;

-- 3. Revenue analysis by time period
SELECT 
    DATE(booking_time) as date,
    HOUR(booking_time) as hour,
    COUNT(*) as rides_count,
    SUM(fare_amount) as daily_revenue,
    AVG(fare_amount) as avg_fare
FROM rides
GROUP BY DATE(booking_time), HOUR(booking_time)
ORDER BY date DESC, hour DESC;

-- 4. Peak hours analysis
SELECT 
    HOUR(booking_time) as hour,
    DAYNAME(booking_time) as day_name,
    COUNT(*) as ride_count,
    AVG(ride_distance) as avg_distance,
    ROUND(AVG(customer_rating), 2) as avg_rating
FROM rides
GROUP BY HOUR(booking_time), DAYNAME(booking_time)
ORDER BY ride_count DESC;

-- 5. Customer satisfaction trends
SELECT 
    customer_rating,
    COUNT(*) as count,
    ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER(), 2) as percentage
FROM rides
WHERE customer_rating IS NOT NULL
GROUP BY customer_rating
ORDER BY customer_rating DESC;

-- 6. Top routes by revenue
SELECT 
    pickup_location,
    dropoff_location,
    COUNT(*) as trips,
    SUM(fare_amount) as total_revenue,
    AVG(fare_amount) as avg_fare,
    ROUND(AVG(customer_rating), 2) as avg_rating
FROM rides
GROUP BY pickup_location, dropoff_location
HAVING COUNT(*) > 5
ORDER BY total_revenue DESC
LIMIT 20;

-- 7. Driver performance metrics
SELECT 
    driver_id,
    COUNT(*) as total_rides,
    SUM(fare_amount) as total_earnings,
    ROUND(AVG(customer_rating), 2) as avg_rating,
    MIN(booking_time) as first_ride,
    MAX(booking_time) as last_ride
FROM rides
GROUP BY driver_id
HAVING COUNT(*) >= 10
ORDER BY total_earnings DESC
LIMIT 15;

-- 8. Cancellation analysis
SELECT 
    cancellation_reason,
    COUNT(*) as cancellations,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM rides WHERE status = 'CANCELLED'), 2) as percentage
FROM rides
WHERE status = 'CANCELLED' AND cancellation_reason IS NOT NULL
GROUP BY cancellation_reason
ORDER BY cancellations DESC;

-- 9. Distance and fare correlation
SELECT 
    CASE 
        WHEN ride_distance < 5 THEN '0-5 km'
        WHEN ride_distance < 10 THEN '5-10 km'
        WHEN ride_distance < 15 THEN '10-15 km'
        WHEN ride_distance < 20 THEN '15-20 km'
        ELSE '20+ km'
    END as distance_range,
    COUNT(*) as rides,
    ROUND(AVG(fare_amount), 2) as avg_fare,
    ROUND(AVG(ride_duration_minutes), 2) as avg_duration
FROM rides
GROUP BY distance_range
ORDER BY distance_range;

-- 10. Monthly trends
SELECT 
    YEAR(booking_time) as year,
    MONTH(booking_time) as month,
    COUNT(*) as rides,
    SUM(fare_amount) as revenue,
    ROUND(AVG(customer_rating), 2) as avg_rating
FROM rides
GROUP BY YEAR(booking_time), MONTH(booking_time)
ORDER BY year DESC, month DESC;
