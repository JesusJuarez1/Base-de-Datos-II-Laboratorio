Select job_id, round(max(salary)) "Maximum", round(min(salary)) "Minimum", round(sum(salary)) "Sum", round(avg(salary)) "Average" 
from Employees group by job_id;