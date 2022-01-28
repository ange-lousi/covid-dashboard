/* Covid Tableau Project */


-- 1.  Global death percentage
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From portfolioProject..[covid-deaths]
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- 2. Showing the continents w/ the highest death count
SELECT continent, SUM(CAST(new_deaths AS int)) AS totalDeathCount
FROM portfolioProject..[covid-deaths]
--WHERE location like '%New Zealand%'
WHERE continent is not null AND location not in ('World', 'European Union', 'International')
GROUP BY continent
ORDER BY totalDeathCount DESC

-- 3. Percent of world population infected
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From portfolioProject..[covid-deaths]
Group by Location, Population
order by PercentPopulationInfected desc

-- 4. HighestInfectionCount
Select Location, Population, date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From portfolioProject..[covid-deaths]
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc
 

