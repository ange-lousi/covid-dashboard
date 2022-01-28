/* Covid Tableau Project */


-- 1.  Global death percentage
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, SUM(cast(new_deaths AS int))/SUM(New_Cases)*100 AS DeathPercentage
FROM portfolioProject..[covid-deaths]
--Where location like '%states%'
WHERE continent is not NULL 
--Group By date
ORDER BY 1,2

-- 2. Showing the continents w/ the highest death count
SELECT continent, SUM(CAST(new_deaths AS int)) AS totalDeathCount
FROM portfolioProject..[covid-deaths]
--WHERE location like '%New Zealand%'
WHERE continent is not null AND location not in ('World', 'European Union', 'International')
GROUP BY continent
ORDER BY totalDeathCount DESC

-- 3. Percent of world population infected
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 AS PercentPopulationInfected
FROM portfolioProject..[covid-deaths]
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

-- 4. HighestInfectionCount
SELECT Location, Population, date, MAX(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM portfolioProject..[covid-deaths]
--Where location like '%states%'
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC
 

