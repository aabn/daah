#Who are the main funders of DAAH projects?
select InstitutionName, count(ProjectInstitutionsID) as NumProjects
from AADH_Institutions
inner join AADH_ProjectInstitutions
using (InstitutionID)
where ProjInstRole = "Funder"
group by InstitutionName
order by NumProjects desc;

#What are the most popular categories of projects?
select CategoryName, CategoryDesc, count(ProjectCategoriesID) as NumProjects
from AADH_Categories
inner join AADH_ProjectCategories
using (CategoryID)
group by CategoryName
order by NumProjects desc;

#What tools are used most frequently for mapping projects?
select ToolName, count(ProjectToolsID) as NumProjects
from AADH_Tools
inner join AADH_ProjectTools
using (ToolID)
inner join AADH_Projects
using (ProjectID)
inner join AADH_ProjectCategories
using (ProjectID)
inner join AADH_Categories
using (CategoryID)
where CategoryName="Mapping"
group by ToolName
order by NumProjects desc;

#What projects focus on Mississippi and Virginia?
select GeographicName, ProjectName, ProjectDesc, ProjectURL
from AADH_Projects
inner join AADH_ProjectGeographic
using (ProjectID)
inner join AADH_GeographicAreas
using (GeographicID)
where GeographicName in ('Mississippi','Virginia');

#Who is sponsoring oral history projects, and what are these projects?
select ProjectName, ProjectURL, InstitutionName from AADH_Projects
inner join AADH_ProjectCategories
using (ProjectID)
inner join AADH_Categories
using (CategoryID)
inner join AADH_ProjectInstitutions
using (ProjectID)
inner join AADH_Institutions
using (InstitutionID)
where ProjInstRole="Sponsor" AND CategoryName="Oral History";
