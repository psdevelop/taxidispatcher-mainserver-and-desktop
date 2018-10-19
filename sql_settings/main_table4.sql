select  c.*,
(CAST(DATEPART(hh , c.nachalo_zakaza_data) as CHAR(2))+':'+
CAST(DATEPART(mi, c.nachalo_zakaza_data) as CHAR(2))
) as start_dt,
(CAST(DATEPART(hh, c.konec_zakaza_data) as CHAR(2))+':'+
CAST(DATEPART(mi, c.konec_zakaza_data) as CHAR(2))
) as end_dt, 
         dbo.GetCustComment(c.nomer_zakaza,c.nachalo_zakaza_data,
c.telefon_klienta+c.adres_vyzova_vvodim, c.otpuskaetsya_dostepcherom, c.otpravlyaetsya, c.Pozyvnoi_ustan) as MainCComment, 
dbo.GetOrderINumComment(c.Adres_okonchaniya_zayavki) as INumInfo, 
dbo.GetEndSectorNameByID(c.konechnyi_sektor_raboty) as esect,
dbo.GetEndSectorNameByID(c.SECTOR_ID) as order_sect,
dbo.GetEndSectorNameByID(c.direct_sect_id) as dir_sect,
dbo.GetRemoteCustComment ( c.REMOTE_SET, 
c.REMOTE_INCOURSE, c.REMOTE_ACCEPTED, c.REMOTE_DRNUM) as RemCustComment,
dbo.GetSendSMSCustComment ( c.DRIVER_SMS_SEND_STATE, c.CLIENT_SMS_SEND_STATE, 
c.SMS_SEND_DRNUM, c.SMS_SEND_CLPHONE) as SendSMSCustComment,
dbo.GetOrdTarifNameByTId(c.TARIFF_ID) as tarif_name,
dbo.GetEndSectorNameByID(c.detected_sector) as det_sect_name         
        from Zakaz c 
        where 
        (c.zavershyon=0) 
        and 
        (c.otpuskaetsya_dostepcherom=:disp_id) 
        order by c.nomer_zakaza