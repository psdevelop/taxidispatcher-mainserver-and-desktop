select  c.nomer_zakaza,
c.pozyvnoi_ustan as pozyvnoi, c.telefon_klienta,
c.adres_vyzova_vvodim, c.nachalo_zakaza_data,
c.konec_zakaza_data, c.uslovn_stoim as stoimostj_zakaza,
c.kolichestvo_chasov,
dbo.GetCustComment(c.nomer_zakaza,c.nachalo_zakaza_data,
c.telefon_klienta+c.adres_vyzova_vvodim, c.otpuskaetsya_dostepcherom, 
c.otpravlyaetsya, c.Pozyvnoi_ustan) as poln_imya_disp 
from Zakaz c
where 
(c.zavershyon=1)
and 
(c.arhivnyi=0)
and
(c.nachalo_zakaza_data<=:end_del_date)
order by c.nomer_zakaza