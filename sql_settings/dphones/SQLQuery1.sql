SELECT * FROM 
(SELECT ('7'+Telefon_klienta) as tk from Sootvetstvie_parametrov_zakaza
WHERE Summarn_chislo_vyzovov>2 AND LEN(Telefon_klienta)=10 AND 
(SUBSTRING(Telefon_klienta,1,3)='918' OR SUBSTRING(Telefon_klienta,1,3)='988' 
OR SUBSTRING(Telefon_klienta,1,3)='928') AND 
(((Summarn_chislo_vyzovov<350) AND (Summarn_chislo_vyzovov>325)) OR 
((Summarn_chislo_vyzovov<300) AND (Summarn_chislo_vyzovov>275)) OR 
((Summarn_chislo_vyzovov<250) AND (Summarn_chislo_vyzovov>225)) OR 
((Summarn_chislo_vyzovov<200) AND (Summarn_chislo_vyzovov>175)) OR 
((Summarn_chislo_vyzovov<125) AND (Summarn_chislo_vyzovov>100)) OR 
((Summarn_chislo_vyzovov<80) AND (Summarn_chislo_vyzovov>60)) OR 
((Summarn_chislo_vyzovov<45) AND (Summarn_chislo_vyzovov>35)) OR 
((Summarn_chislo_vyzovov<30) AND (Summarn_chislo_vyzovov>24)) OR 
((Summarn_chislo_vyzovov<19) AND (Summarn_chislo_vyzovov>14)) OR 
((Summarn_chislo_vyzovov<10) AND (Summarn_chislo_vyzovov>7)) OR 
((Summarn_chislo_vyzovov<6) AND (Summarn_chislo_vyzovov>4)))
UNION
SELECT ('7'+Telefon_klienta) as tk from SPZ2
WHERE Summarn_chislo_vyzovov>2 AND LEN(Telefon_klienta)=10 AND 
(SUBSTRING(Telefon_klienta,1,3)='918' OR SUBSTRING(Telefon_klienta,1,3)='988' 
OR SUBSTRING(Telefon_klienta,1,3)='928') AND 
( 
((Summarn_chislo_vyzovov<180) AND (Summarn_chislo_vyzovov>175)) OR 
((Summarn_chislo_vyzovov<105) AND (Summarn_chislo_vyzovov>100)) OR 
((Summarn_chislo_vyzovov<80) AND (Summarn_chislo_vyzovov>70)) OR 
((Summarn_chislo_vyzovov<43) AND (Summarn_chislo_vyzovov>36)) OR 
((Summarn_chislo_vyzovov<30) AND (Summarn_chislo_vyzovov>27)) OR 
((Summarn_chislo_vyzovov<19) AND (Summarn_chislo_vyzovov>16)) OR 
((Summarn_chislo_vyzovov<10) AND (Summarn_chislo_vyzovov>8)) OR 
((Summarn_chislo_vyzovov<6) AND (Summarn_chislo_vyzovov>4)))
) spz 
ORDER BY tk