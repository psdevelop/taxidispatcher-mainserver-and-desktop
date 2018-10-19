<?php 

    $unicode_to_cp1251_tbl = array(
	0x0402 => "\x80",
	0x0403 => "\x81",
	0x201A => "\x82",
	0x0453 => "\x83",
	0x201E => "\x84",
	0x2026 => "\x85",
	0x2020 => "\x86",
0x2021 => "\x87",
0x20AC => "\x88",
0x2030 => "\x89",
0x0409 => "\x8A",
0x2039 => "\x8B",
0x040A => "\x8C",
0x040C => "\x8D",
0x040B => "\x8E",
0x040F => "\x8F",
0x0452 => "\x90",
0x2018 => "\x91",
0x2019 => "\x92",
0x201C => "\x93",
0x201D => "\x94",
0x2022 => "\x95",
0x2013 => "\x96",
0x2014 => "\x97",
0x2122 => "\x99",
0x0459 => "\x9A",
0x203A => "\x9B",
0x045A => "\x9C",
0x045C => "\x9D",
0x045B => "\x9E",
0x045F => "\x9F",
0x00A0 => "\xA0",
0x040E => "\xA1",
0x045E => "\xA2",
0x0408 => "\xA3",
0x00A4 => "\xA4",
0x0490 => "\xA5",
0x00A6 => "\xA6",
0x00A7 => "\xA7",
0x0401 => "\xA8",
0x00A9 => "\xA9",
0x0404 => "\xAA",
0x00AB => "\xAB",
0x00AC => "\xAC",
0x00AD => "\xAD",
0x00AE => "\xAE",
0x0407 => "\xAF",
0x00B0 => "\xB0",
0x00B1 => "\xB1",
0x0406 => "\xB2",
0x0456 => "\xB3",
0x0491 => "\xB4",
0x00B5 => "\xB5",
0x00B6 => "\xB6",
0x00B7 => "\xB7",
0x0451 => "\xB8",
0x2116 => "\xB9",
0x0454 => "\xBA",
0x00BB => "\xBB",
0x0458 => "\xBC",
0x0405 => "\xBD",
0x0455 => "\xBE",
0x0457 => "\xBF",
0x0410 => "\xC0",
0x0411 => "\xC1",
0x0412 => "\xC2",
0x0413 => "\xC3",
0x0414 => "\xC4",
0x0415 => "\xC5",
0x0416 => "\xC6",
0x0417 => "\xC7",
0x0418 => "\xC8",
0x0419 => "\xC9",
0x041A => "\xCA",
0x041B => "\xCB",
0x041C => "\xCC",
0x041D => "\xCD",
0x041E => "\xCE",
0x041F => "\xCF",
0x0420 => "\xD0",
0x0421 => "\xD1",
0x0422 => "\xD2",
0x0423 => "\xD3",
0x0424 => "\xD4",
0x0425 => "\xD5",
0x0426 => "\xD6",
0x0427 => "\xD7",
0x0428 => "\xD8",
0x0429 => "\xD9",
0x042A => "\xDA",
0x042B => "\xDB",
0x042C => "\xDC",
0x042D => "\xDD",
0x042E => "\xDE",
0x042F => "\xDF",
0x0430 => "\xE0",
0x0431 => "\xE1",
0x0432 => "\xE2",
0x0433 => "\xE3",
0x0434 => "\xE4",
0x0435 => "\xE5",
0x0436 => "\xE6",
0x0437 => "\xE7",
0x0438 => "\xE8",
0x0439 => "\xE9",
0x043A => "\xEA",
0x043B => "\xEB",
0x043C => "\xEC",
0x043D => "\xED",
0x043E => "\xEE",
0x043F => "\xEF",
0x0440 => "\xF0",
0x0441 => "\xF1",
0x0442 => "\xF2",
0x0443 => "\xF3",
0x0444 => "\xF4",
0x0445 => "\xF5",
0x0446 => "\xF6",
0x0447 => "\xF7",
0x0448 => "\xF8",
0x0449 => "\xF9",
0x044A => "\xFA",
0x044B => "\xFB",
0x044C => "\xFC",
0x044D => "\xFD",
0x044E => "\xFE",
0x044F => "\xFF",
);

$cp1251_to_utf8_tbl = array(
0x80 => "\xD0\x82",
0x81 => "\xD0\x83",
0x82 => "\xE2\x80\x9A",
0x83 => "\xD1\x93",
0x84 => "\xE2\x80\x9E",
0x85 => "\xE2\x80\xA6",
0x86 => "\xE2\x80\xA0",
0x87 => "\xE2\x80\xA1",
0x88 => "\xE2\x82\xAC",
0x89 => "\xE2\x80\xB0",
0x8A => "\xD0\x89",
0x8B => "\xE2\x80\xB9",
0x8C => "\xD0\x8A",
0x8D => "\xD0\x8C",
0x8E => "\xD0\x8B",
0x8F => "\xD0\x8F",
0x90 => "\xD1\x92",
0x91 => "\xE2\x80\x98",
0x92 => "\xE2\x80\x99",
0x93 => "\xE2\x80\x9C",
0x94 => "\xE2\x80\x9D",
0x95 => "\xE2\x80\xA2",
0x96 => "\xE2\x80\x93",
0x97 => "\xE2\x80\x94",
0x99 => "\xE2\x84\xA2",
0x9A => "\xD1\x99",
0x9B => "\xE2\x80\xBA",
0x9C => "\xD1\x9A",
0x9D => "\xD1\x9C",
0x9E => "\xD1\x9B",
0x9F => "\xD1\x9F",
0xA0 => "\xC2\xA0",
0xA1 => "\xD0\x8E",
0xA2 => "\xD1\x9E",
0xA3 => "\xD0\x88",
0xA4 => "\xC2\xA4",
0xA5 => "\xD2\x90",
0xA6 => "\xC2\xA6",
0xA7 => "\xC2\xA7",
0xA8 => "\xD0\x81",
0xA9 => "\xC2\xA9",
0xAA => "\xD0\x84",
0xAB => "\xC2\xAB",
0xAC => "\xC2\xAC",
0xAD => "\xC2\xAD",
0xAE => "\xC2\xAE",
0xAF => "\xD0\x87",
0xB0 => "\xC2\xB0",
0xB1 => "\xC2\xB1",
0xB2 => "\xD0\x86",
0xB3 => "\xD1\x96",
0xB4 => "\xD2\x91",
0xB5 => "\xC2\xB5",
0xB6 => "\xC2\xB6",
0xB7 => "\xC2\xB7",
0xB8 => "\xD1\x91",
0xB9 => "\xE2\x84\x96",
0xBA => "\xD1\x94",
0xBB => "\xC2\xBB",
0xBC => "\xD1\x98",
0xBD => "\xD0\x85",
0xBE => "\xD1\x95",
0xBF => "\xD1\x97",
0xC0 => "\xD0\x90",
0xC1 => "\xD0\x91",
0xC2 => "\xD0\x92",
0xC3 => "\xD0\x93",
0xC4 => "\xD0\x94",
0xC5 => "\xD0\x95",
0xC6 => "\xD0\x96",
0xC7 => "\xD0\x97",
0xC8 => "\xD0\x98",
0xC9 => "\xD0\x99",
0xCA => "\xD0\x9A",
0xCB => "\xD0\x9B",
0xCC => "\xD0\x9C",
0xCD => "\xD0\x9D",
0xCE => "\xD0\x9E",
0xCF => "\xD0\x9F",
0xD0 => "\xD0\xA0",
0xD1 => "\xD0\xA1",
0xD2 => "\xD0\xA2",
0xD3 => "\xD0\xA3",
0xD4 => "\xD0\xA4",
0xD5 => "\xD0\xA5",
0xD6 => "\xD0\xA6",
0xD7 => "\xD0\xA7",
0xD8 => "\xD0\xA8",
0xD9 => "\xD0\xA9",
0xDA => "\xD0\xAA",
0xDB => "\xD0\xAB",
0xDC => "\xD0\xAC",
0xDD => "\xD0\xAD",
0xDE => "\xD0\xAE",
0xDF => "\xD0\xAF",
0xE0 => "\xD0\xB0",
0xE1 => "\xD0\xB1",
0xE2 => "\xD0\xB2",
0xE3 => "\xD0\xB3",
0xE4 => "\xD0\xB4",
0xE5 => "\xD0\xB5",
0xE6 => "\xD0\xB6",
0xE7 => "\xD0\xB7",
0xE8 => "\xD0\xB8",
0xE9 => "\xD0\xB9",
0xEA => "\xD0\xBA",
0xEB => "\xD0\xBB",
0xEC => "\xD0\xBC",
0xED => "\xD0\xBD",
0xEE => "\xD0\xBE",
0xEF => "\xD0\xBF",
0xF0 => "\xD1\x80",
0xF1 => "\xD1\x81",
0xF2 => "\xD1\x82",
0xF3 => "\xD1\x83",
0xF4 => "\xD1\x84",
0xF5 => "\xD1\x85",
0xF6 => "\xD1\x86",
0xF7 => "\xD1\x87",
0xF8 => "\xD1\x88",
0xF9 => "\xD1\x89",
0xFA => "\xD1\x8A",
0xFB => "\xD1\x8B",
0xFC => "\xD1\x8C",
0xFD => "\xD1\x8D",
0xFE => "\xD1\x8E",
0xFF => "\xD1\x8F",
);

function utf8_to_cp1251($s) {
//$tbl = $GLOBALS['unicode_to_cp1251_tbl'];
$uc = 0;
$bits = 0;
$r = "";
for($i = 0, $l = strlen($s); $i < $l; $i++) {
$c = $s{$i};
$b = ord($c);
if($b & 0x80) {
if($b & 0x40) {
if($b & 0x20) {
$uc = ($b & 0x0F) << 12;
$bits = 12;
}
else {
$uc = ($b & 0x1F) << 6;
$bits = 6;
}
}
else {
$bits -= 6;
if($bits) {
$uc |= ($b & 0x3F) << $bits;
}
else {
$uc |= $b & 0x3F;
if($cc = @$unicode_to_cp1251_tbl[$uc]) {
$r .= $cc;
}
else {
$r .= '?';
}
}
}
}
else {
$r .= $c;
}
}
return $r;
}
function cp1251_to_utf8($s) {
//$tbl = $GLOBALS['cp1251_to_utf8_tbl'];
$r = "";
for($i = 0, $l = strlen($s); $i < $l; $i++) {
$c = $s{$i};
$b = ord($c);
if($b < 128) {
$r .= $c;
}
else {
//$r .= 'd';
$r .= @$cp1251_to_utf8_tbl[$b];
}
}
return $r;
}

    $error_tags="";
    
    /* Извлечение имени операции */
    if (isset($_GET['operation_name'])) {
      	$operation_name=$HTTP_GET_VARS['operation_name'];
      }
    else
      {
      	$operation_name="DEFAULT_OPERATION";
      }

    
    /* Количество гостиниц в строке */
    $dr_num=3;   

	/* Соединение, выбор БД */
    if($link = mysql_connect("localhost", "av_admin", "orb1ngu8gel"))
      {
          if ($operation_name == "DEFAULT_OPERATION")
          	{
			die("Скрипт не может получить доступ к серверу баз данных!")
		}
          else  {
          		$error_tags.="<error>Скрипт не может получить доступ к серверу баз данных!</error>"; 
		}
      }
    
    if not mysql_select_db("AVALON") 
      {
          if ($operation_name == "DEFAULT_OPERATION")
          	{
			die("Скрипт не может получить доступ к базе данных!")
		}
          else  {
          		$error_tags.="<error>Скрипт не может получить доступ к базе данных!</error>"; 
		}
      }

    /* Выполнение SQL query */
    mysql_query("set names cp1251")  or die("Неудачная установка кодировки!");
      {
          if ($operation_name == "DEFAULT_OPERATION")
          	{
			die("Неудачная установка кодировки!")
		}
          else  {
          		$error_tags.="<error>Неудачная установка кодировки!</error>"; 
		}
      }
    
    
    if ($operation_name == "DEFAULT_OPERATION") {
	print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"";
        print " \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
        print "<html xmlns=\"http://www.w3.org/1999/xhtml\">";
	print "<head lang=\"ru\" xml:lang=\"ru\">";
	print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1251\" />";
	print "<title>Список заявок</title>";
	print "<link href=\"styles/main_frame.css\" rel=\"stylesheet\" type=\"text/css\" />";
	print "</head>";
	print "<body leftmargin=\"0\" topmargin=\"0\">";
	print "<table border='0'><tr><td align=center>";
	print "Список активных заявок";
        print "<table border='2'>";
        print "\t<tr>\n";
                print "\t\t<td>MSG_ID</td>\n"; 
		print "\t\t<td>OPERATION_NAME</td>\n";
		print "\t\t<td>SOURCE_ID</td>\n";
		print "\t\t<td>DEST_ID</td>\n";
		print "\t\t<td>OBJ_ID</td>\n";
		print "\t\t<td>STR_PARAM_1</td>\n";
		print "\t\t<td>STR_PARAM_2</td>\n";
		print "\t\t<td>STR_PARAM_3</td>\n";
		print "\t\t<td>INT_PARAM_1</td>\n";
		print "\t\t<td>INT_PARAM_2</td>\n";
		print "\t\t<td>INT_PARAM_3</td>\n";
		print "\t\t<td>IN_DEST</td>\n";
		print "\t\t<td>ANSWER</td>\n";
		print "\t\t<td>CREATE_DT</td>\n";
        print "\t</tr>\n";
        $query = "SELECT * FROM TD_MESSAGES";
        $result = mysql_query($query) or die("Неудачное выполнение инструкции!");
            while($message_row=mysql_fetch_array($result, MYSQL_BOTH)) {
                print "\t<tr>\n";
                printf ("\t\t<td>%d</td>\n",$message_row[MSG_ID]); 
		printf ("\t\t<td>%s</td>\n",$message_row[OPERATION_NAME]);
		printf ("\t\t<td>%d</td>\n",$message_row[SOURCE_ID]);
		printf ("\t\t<td>%d</td>\n",$message_row[DEST_ID]);
		printf ("\t\t<td>%d</td>\n",$message_row[OBJ_ID]);
		printf ("\t\t<td>%s</td>\n",$message_row[STR_PARAM_1]);
		printf ("\t\t<td>%s</td>\n",$message_row[STR_PARAM_2]);
		printf ("\t\t<td>%s</td>\n",$message_row[STR_PARAM_3]);
		printf ("\t\t<td>%d</td>\n",$message_row[INT_PARAM_1]);
		printf ("\t\t<td>%d</td>\n",$message_row[INT_PARAM_2]);
		printf ("\t\t<td>%d</td>\n",$message_row[INT_PARAM_3]);
		printf ("\t\t<td>%d</td>\n",$message_row[IN_DEST]);
		printf ("\t\t<td>%d</td>\n",$message_row[ANSWER]);
		printf ("\t\t<td>%s</td>\n",$message_row[CREATE_DT]);
                print "\t</tr>\n";
              
    		mysql_free_result($result);
              }
        print "</table>";
        print "<br/>psdevelop@yandex.ru</td></tr></table>";
	print "</body></html>";
	}
    else if($operation_name == "GET_MSG_BY_DRNUM") { 
        print "<td_messages>\n"; 
        $query = "SELECT * FROM TD_MESSAGES WHERE DEST_ID=$dr_num";
        if($result = mysql_query($query)) { 
            while($message_row=mysql_fetch_array($result, MYSQL_BOTH)) {
                print "\t<td_message>\n";
                printf ("\t\t<MSG_ID>%s</MSG_ID>\n",$message_row[MSG_ID]); 
		printf ("\t\t<OPERATION_NAME>%s</OPERATION_NAME>\n",$message_row[OPERATION_NAME]);
		printf ("\t\t<SOURCE_ID>%s</SOURCE_ID>\n",$message_row[SOURCE_ID]);
		printf ("\t\t<DEST_ID>%s</DEST_ID>\n",$message_row[DEST_ID]);
		printf ("\t\t<OBJ_ID>%s</OBJ_ID>\n",$message_row[OBJ_ID]);
		printf ("\t\t<STR_PARAM_1>%s</STR_PARAM_1>\n",$message_row[STR_PARAM_1]);
		printf ("\t\t<STR_PARAM_2>%s</STR_PARAM_2>\n",$message_row[STR_PARAM_2]);
		printf ("\t\t<STR_PARAM_3>%s</STR_PARAM_3>\n",$message_row[STR_PARAM_3]);
		printf ("\t\t<INT_PARAM_1>%s</INT_PARAM_1>\n",$message_row[INT_PARAM_1]);
		printf ("\t\t<INT_PARAM_2>%s</INT_PARAM_2>\n",$message_row[INT_PARAM_2]);
		printf ("\t\t<INT_PARAM_3>%s</INT_PARAM_3>\n",$message_row[INT_PARAM_3]);
		printf ("\t\t<IN_DEST>%s</IN_DEST>\n",$message_row[IN_DEST]);
		printf ("\t\t<ANSWER>%s</ANSWER>\n",$message_row[ANSWER]);
		printf ("\t\t<CREATE_DT>%s</CREATE_DT>\n",$message_row[CREATE_DT]);
                print "\t</td_message>\n";
              
		/* Освобождение resultset */
    		mysql_free_result($result);
              }
            }
            else {
              $error_tags.="<error>Неудачное выполнение инструкции!</error>"; }
        print "</td_messages>\n";
     }
    else
      {
      }

    /* Закрытие соединения */
    mysql_close($link);
       
    ?>

