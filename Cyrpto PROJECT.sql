
SELECT ADA.Open AS ADA_Open, ADA.Close AS ADA_Close, ADA.Year,
    BCH.Open AS BCH_Open, BCH.Close AS BCH_Close,
    BTC.Open AS BTC_Open, BTC.Close AS BTC_Close,
    ETH.Open AS ETH_Open, ETH.Close AS ETH_Close,
    LTC.Open AS LTC_Open, LTC.Close AS LTC_Close
FROM ada_usd AS ADA
JOIN 
    bch_usd AS BCH ON ADA.Year = BCH.Year
    JOIN 
    btc_usd AS BTC ON ADA.Year = BTC.Year
JOIN 
    eth_usd AS ETH ON ADA.Year = ETH.Year
JOIN 
    ltc_usd AS LTC ON ADA.Year = LTC.Year;



SELECT open, close
FROM bch_usd
;
   
   # Subquery totaling the YTD Gains of the distinct years for BTC and ETH.
   SELECT 
    SUM(DistinctYears.Year) AS Total_Sum_of_Distinct_Years,
    AggregatedGains.Year,
    AggregatedGains.BTC_YTDGain,
    AggregatedGains.ETH_YTDGain
FROM (
    SELECT 
        BTC.Year, 
        SUM(BTC.YTD_Gain) AS BTC_YTDGain,
        SUM(ETH.YTD_Gain) AS ETH_YTDGain
    FROM btc_usd AS BTC
    LEFT JOIN ETH_USD AS ETH ON BTC.Year = ETH.Year
    WHERE BTC.Year >= 2017
    GROUP BY BTC.Year
) AS AggregatedGains
JOIN (
    SELECT DISTINCT Year
    FROM btc_usd
    WHERE Year >= 2017
) AS DistinctYears ON AggregatedGains.Year = DistinctYears.Year
GROUP BY DistinctYears.Year;
    
    # COMPARE HOW DIFFERENT CRYPTOCURRIENCIES HAVE PERFORMED OVER THE YEARS TO IDENTIFY TOP PERFORMERS.
    # Analysis of all 6 cryptocurriences saved in MSWord Doc.

SELECT  ADA.Year, 
AVG(ADA.YTD_Gain) AS ADA_YTD,
AVG(BCH.YTD_Gain) AS BCH_YTD
FROM ada_usd AS ADA
LEFT JOIN 
    bch_usd AS BCH ON ADA.Year = BCH.Year
    GROUP BY ADA.Year
    ORDER BY ADA.Year
    ;
    
SELECT BTC.Year, 
AVG(BTC.YTD_Gain) AS BTC_YTDGain,
AVG(ETH.YTD_Gain) AS ETH_YTDGain
FROM btc_usd AS BTC
LEFT JOIN 
	ETH_USD AS ETH ON BTC.Year = ETH.Year
WHERE BTC.Year >= 2017
GROUP BY BTC.Year
;

SELECT LTC.Year, 
	AVG(LTC.YTD_Gain) AS LTC_YTDGain,
    AVG(XRP.YTD_Gain) AS XRP_YTDGain
FROM ltc_usd AS LTC
LEFT JOIN 
	xrp_usd AS XRP ON LTC.Year = XRP.Year
    WHERE LTC.Year >= 2017
    GROUP BY LTC.Year
;

# UNDERSTAND THE VOLATILITY RANGE IN PRICE WITHIN A YEAR FOR EACH CRYPTOCURRENCY.
# Volatility Range; Defined as the difference between the max and min prices within a specific period (in this case, within a year).
# The analysis provides insights into the volatility range between the cyrptocurriences for each year by calculating the difference between
# their highest and lowest prices. This helps us understand how much the prices fluctuated within each year, highlighting periods of
#high volatility or stability. The wider the spread between the high and low prices, the more volatile the cryptocurrency was during that year.

SELECT 
	ADA.Year, 
	MAX(ADA.High) AS ADA_High, 
	MIN(ADA.Low) AS ADA_Low,
	(MAX(ADA.High) - MIN(ADA.Low)) AS ADA_HighLowSpread,
	MAX(BCH.High) AS BCH_High,
	MIN(BCH.Low) AS BCH_Low,
	(MAX(BCH.High) - MIN(BCH.Low)) AS BCH_HighLowSpread
FROM 
	ada_usd AS ADA
LEFT JOIN 
    bch_usd AS BCH 
ON 
	ADA.Year = BCH.Year
GROUP BY 
	ADA.Year
ORDER BY
	ADA.Year
;
# Analysis:
# 2017 shows extreme volatility for both ADA and BCH, with large fluctuations in price.
# 2018 still shows high volatility for both, but less than in 2017.
# 2019 sees a significant drop in volatility for both ADA and BCH, especially for ADA.
# 2020 shows moderate volatility, with ADA seeing more fluctuation than BCH.
# 2021 is a year of renewed volatility, particularly for ADA, with BCH also experiencing a substantial range.
# 2022 shows decreased volatility, but still some fluctuations for both cryptocurrencies.
# 2023 shows the least volatility, with both ADA and BCH exhibiting relatively stable price behavior compared to previous years.
# Both Cardano (ADA) and Bitcoin Cash (BCH) had their highest volatility in 2017, with a steady decline in volatility through the years, particularly 
# in 2023 where volatility is at its lowest, they have become more steady as the years go by. 
# Initially, there was high volatility in 2017, especially for both cryptocurrencies. 
# Over the years, the price fluctuations have reduced, showing a steadying trend.
# Key points:
# 2017 had extreme volatility, especially for ADA and BCH.
# By 2023, both ADA and BCH show much lower volatility, indicating that their price movements have become more stable 
# and less susceptible to large swings. This could suggest that as the cryptocurrencies mature, 
# their market behavior stabilizes, possibly due to increased market adoption, more regulation, or a maturing investor base.

SELECT 
	BTC.Year, 
	MAX(BTC.High) AS BTC_High, 
	MIN(BTC.Low) AS BTC_Low,
	(MAX(BTC.High) - MIN(BTC.Low)) AS BTC_HighLowSpread,
	MAX(ETH.High) AS ETH_High,
	MIN(ETH.Low) AS ETH_Low,
	(MAX(ETH.High) - MIN(ETH.Low)) AS ETH_HighLowSpread
FROM 
	btc_usd AS BTC
LEFT JOIN 
    eth_usd AS ETH 
ON 
	BTC.Year = ETH.Year
GROUP BY 
	BTC.Year
ORDER BY
	BTC.Year
;
# Analysis:
# 2017 experienced the highest volatility for both BTC and ETH, with large price swings.
# 2020 also shows a significant increase in volatility for both cryptocurrencies, particularly due to a strong market recovery.
# 2021 had extreme volatility for both BTC and ETH, driven by market speculation and massive price growth.
# 2023 shows the lowest volatility for both cryptocurrencies, suggesting a more stable market compared to the earlier years.
# These findings show that both BTC and ETH experienced their highest volatility during 2017 and 2021, 
# while the market has become more stable in recent years.

SELECT 
	LTC.Year, 
	MAX(LTC.High) AS LTC_High, 
	MIN(LTC.Low) AS LTC_Low,
	(MAX(LTC.High) - MIN(LTC.Low)) AS LTC_HighLowSpread,
	MAX(XRP.High) AS XRP_High,
	MIN(XRP.Low) AS XRP_Low,
	(MAX(XRP.High) - MIN(XRP.Low)) AS XRP_HighLowSpread
FROM 
	ltc_usd AS LTC
LEFT JOIN 
    xrp_usd AS XRP 
ON 
	LTC.Year = XRP.Year
GROUP BY 
	LTC.Year
ORDER BY
	LTC.Year
;
# ANALYSIS;
# 2017 had extreme volatility for both LTC and XRP.
# Over the following years, both LTC and XRP experienced a decline in volatility, indicating a steadying trend in their price movements.
# By 2023, the volatility for both LTC and XRP was at its lowest, with XRP showing more stability than LTC.
# Similar to the previous cryptocurrencies, both Litecoin (LTC) and Ripple (XRP) have shown reduced volatility, with more stable
# price behavior as the years progressed.

# Aggregate volume data by year for each cryptocurrency to determine trading activity trends and identify
# years of high trading interest or liquidity.
# USE THE FORMAT FXN to dermarcate numbers with commas for easy reading.
SELECT 
    ADA.Year, 
    FORMAT(SUM(ADA.Volume), 0) AS ADA_Total_Volume,  -- You can use SUM or AVG depending on the analysis
    FORMAT(SUM(BCH.Volume), 0) AS BCH_Total_Volume
FROM 
    ada_usd AS ADA
LEFT JOIN 
    bch_usd AS BCH ON ADA.Year = BCH.Year
WHERE
	ADA.Year >= 2017
GROUP BY 
    ADA.Year
ORDER BY 
    ADA.Year;

SELECT 
    BTC.Year, 
	FORMAT(SUM(BTC.Volume), 0) AS BTC_Total_Volume,
    FORMAT(SUM(ETH.Volume), 0) AS ETH_Total_Volume
FROM 
    btc_usd AS BTC
LEFT JOIN 
    eth_usd AS ETH ON BTC.Year = ETH.Year
WHERE
	BTC.Year >= 2017
GROUP BY 
    BTC.Year
ORDER BY 
    BTC.Year
;

SELECT 
    LTC.Year, 
    FORMAT(SUM(LTC.Volume), 0) AS LTC_Total_Volume,
    FORMAT(SUM(XRP.Volume),0) AS XRP_Total_Volume
FROM 
    ltc_usd AS LTC
LEFT JOIN 
    xrp_usd AS XRP ON LTC.Year = XRP.Year
WHERE
	LTC.Year >= 2017
GROUP BY 
    LTC.Year
ORDER BY 
    LTC.Year
;
# ANALYSIS; 