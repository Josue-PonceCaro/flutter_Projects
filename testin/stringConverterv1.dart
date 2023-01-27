void main() {
  List<String> ansi = [r'Á',r'á',r'É', r'é',r'Í',r'í',r'Ó',r'ó',r'Ú' ,r'ú',r'Ñ',r'ñ',r'¿'];
  List<String> utf8 = ['Ã','Ã¡','Ã‰','Ã©', 'Ã','Ã­­','Ã“' ,'Ã³' ,'Ãš','Ãº','Ã‘','Ã±','Â¿'];
  String text = '''
TÉRMINOS Y CONDICIONES DE USO
Este documento establece los términos y condiciones de uso a los cuales se rige la aplicación â€œRespira Limpioâ€ y el usuario final.
1.- Servicios:
La aplicación â€œRespira Limpioâ€ es una aplicación móvil que tiene como finalidad monitorear la calidad en tiempo real de tu recorrido utilizando predicciones de la concentración de PM2.5  de las calles por la cual transitas. Este aplicativo solo tiene cobertura en el área de Cercado de Lima.
â€œRespira Limpioâ€ cuenta con una parte backend, la cual es el encargado de gestionar las predicciones y brindárselas al frontend mediante APIs. 
El Usuario al utilizar cualquiera de servicios ofrecidos por â€œRespira Limpioâ€ ya sea visual o de data que esté disponible, voluntariamente acepta de manera previa, expresa e informada el contenido de los presentes Términos y Condiciones de Uso en su totalidad, por lo cual, se obliga irrevocablemente a éstos. Esto quiere decir, que el Usuario declara haber leído y entendido todas las condiciones en la Política de Privacidad y en los presentes Términos y Condiciones de Uso, manifestando su conformidad y aceptación al hacer uso de la aplicación y se considerará que ha aceptado estos Términos y Condiciones de Uso y que por lo tanto entra en un acuerdo vinculante.
Su acuerdo con nosotros incluye estos Términos y Condiciones de Uso, cualquiera de los derechos y obligaciones a los que se hace referencia y de cualquier término adicional que rija ciertos aspectos o funcionalidades de nuestros servicios.
2- Uso de â€œRespira Limpioâ€
Requerimientos legales
Para utilizar los servicios ofrecidos en â€œRespira Limpioâ€ declara que la información enviada es correcta. Usted promete y acepta que está utilizando los servicios ofrecidos para su uso no comercial. La data obtenida de los dispositivos de medición, pertenecen a los creadores de â€œRespira Limpioâ€ o a sus socios estratégicos y estos no pueden ser vendidos ni transferidos. Todos los servicios ofrecidos por el aplicativo no pueden ser utilizados para cualquier acto ilegal o que vulnere la tranquilidad pública. El Usuario se compromete a hacer un uso adecuado y lícito de la aplicación â€œRespira Limpioâ€ de conformidad con la legislación aplicable, los presentes Términos y Condiciones de Uso, la moral y buenas costumbres generalmente aceptadas y el orden público.
Usted acepta cumplir con nuestras reglas provistas en los acuerdos y no usar nuestros servicios que no estén expresamente permitidos.
3.- Actividades prohibidas
- Escaneo continuo de la data obtenida por las APIs;
- Scanear los servicios o usar cualquier medio automatizado para ver, acceder o recopilar información.
- Vender, alquilar, sublicenciar o arrendar cualquier parte de los servicios o data obtenida en â€œRespira Limpioâ€;
- Manipular, escanear o probar vulnerabilidades en los servicios y/o conexiones a base de datos;
- Cualquier actividad que entre en conflicto con los acuerdos, según lo determine â€œRespira Limpioâ€.
4. Disponibilidad
Nos reservamos el derecho en cualquier momento, sin previo aviso de realizar cualquiera de las siguientes acciones:
- Modificar, complementar o restringir los servicios y/o data obtenida en en el aplicativo móvil, sus funcionalidades o características;
- Cambiar o actualizar la versión de la plataforma.
5.- Protección de Datos
Los propietarios de â€œRespira Limpioâ€ se rige estrictamente a toda ley de protección de datos y se esfuerza por mantenerlos seguros.
Los datos personales que los Usuarios proporcionen en el Registro, serán almacenados y tratados según lo dispone la Ley N° 29733, Ley de Protección de Datos Personales, su Reglamento, aprobado mediante Decreto Supremo N° 003-2013-JUS, demás normas conexas y la Política de Privacidad de â€œRespira Limpioâ€ y Tratamiento de Datos Personales que aceptan los Usuarios al momento del Registro. 
Los Usuarios declaran que los datos personales han sido entregados de forma absolutamente libre y voluntaria, sin ningún tipo de presión, obligación o condición de por medio.
''';
  for(var i =0; i<ansi.length; i++){
    text = text.replaceAll(RegExp(ansi[i]),utf8[i]);
  }

  print(text);
  // print('rEsume'.replaceAll(RegExp(r'e'), 'é'));
}
String text1 = '''
TÃ‰RMINOS Y CONDICIONES DE USO\n\n\n
Este documento establece los tÃ©rminos y condiciones de uso a los cuales se rige la aplicaciÃ³n â€œRespira Limpioâ€ y el usuario final.\n\n
1.- Servicios:\n\n
La aplicaciÃ³n â€œRespira Limpioâ€ es una aplicaciÃ³n mÃ³vil que tiene como finalidad monitorear la calidad en tiempo real de tu recorrido utilizando predicciones de la concentraciÃ³n de PM2.5  de las calles por la cual transitas. Este aplicativo solo tiene cobertura en el Ã¡rea de Cercado de Lima.\n\n
â€œRespira Limpioâ€ cuenta con una parte backend, la cual es el encargado de gestionar las predicciones y brindÃ¡rselas al frontend mediante APIs.\n\n
El Usuario al utilizar cualquiera de servicios ofrecidos por â€œRespira Limpioâ€ ya sea visual o de data que estÃ© disponible, voluntariamente acepta de manera previa, expresa e informada el contenido de los presentes TÃ©rminos y Condiciones de Uso en su totalidad, por lo cual, se obliga irrevocablemente a Ã©stos. Esto quiere decir, que el Usuario declara haber leÃ­­do y entendido todas las condiciones en la PolÃ­­tica de Privacidad y en los presentes TÃ©rminos y Condiciones de Uso, manifestando su conformidad y aceptaciÃ³n al hacer uso de la aplicaciÃ³n y se considerarÃ¡ que ha aceptado estos TÃ©rminos y Condiciones de Uso y que por lo tanto entra en un acuerdo vinculante.\n\n
Su acuerdo con nosotros incluye estos TÃ©rminos y Condiciones de Uso, cualquiera de los derechos y obligaciones a los que se hace referencia y de cualquier tÃ©rmino adicional que rija ciertos aspectos o funcionalidades de nuestros servicios.\n\n
2- Uso de â€œRespira Limpioâ€\n\n
Requerimientos legales\n\n
Para utilizar los servicios ofrecidos en â€œRespira Limpioâ€ declara que la informaciÃ³n enviada es correcta. Usted promete y acepta que estÃ¡ utilizando los servicios ofrecidos para su uso no comercial. La data obtenida de los dispositivos de mediciÃ³n, pertenecen a los creadores de â€œRespira Limpioâ€ o a sus socios estratÃ©gicos y estos no pueden ser vendidos ni transferidos. Todos los servicios ofrecidos por el aplicativo no pueden ser utilizados para cualquier acto ilegal o que vulnere la tranquilidad pÃºblica. El Usuario se compromete a hacer un uso adecuado y lÃ­­cito de la aplicaciÃ³n â€œRespira Limpioâ€ de conformidad con la legislaciÃ³n aplicable, los presentes TÃ©rminos y Condiciones de Uso, la moral y buenas costumbres generalmente aceptadas y el orden pÃºblico.\n\n
Usted acepta cumplir con nuestras reglas provistas en los acuerdos y no usar nuestros servicios que no estÃ©n expresamente permitidos.\n\n
3.- Actividades prohibidas\n\n
- Escaneo continuo de la data obtenida por las APIs;\n\n
- Scanear los servicios o usar cualquier medio automatizado para ver, acceder o recopilar informaciÃ³n.\n\n
- Vender, alquilar, sublicenciar o arrendar cualquier parte de los servicios o data obtenida en â€œRespira Limpioâ€;\n\n
- Manipular, escanear o probar vulnerabilidades en los servicios y/o conexiones a base de datos;\n\n
- Cualquier actividad que entre en conflicto con los acuerdos, segÃºn lo determine â€œRespira Limpioâ€.\n\n
4. Disponibilidad\n\n
Nos reservamos el derecho en cualquier momento, sin previo aviso de realizar cualquiera de las siguientes acciones:\n\n
- Modificar, complementar o restringir los servicios y/o data obtenida en en el aplicativo mÃ³vil, sus funcionalidades o caracterÃ­­sticas;\n\n
- Cambiar o actualizar la versiÃ³n de la plataforma.\n\n
5.- ProtecciÃ³n de Datos\n\n
Los propietarios de â€œRespira Limpioâ€ se rige estrictamente a toda ley de protecciÃ³n de datos y se esfuerza por mantenerlos seguros.\n\n
Los datos personales que los Usuarios proporcionen en el Registro, serÃ¡n almacenados y tratados segÃºn lo dispone la Ley N° 29733, Ley de ProtecciÃ³n de Datos Personales, su Reglamento, aprobado mediante Decreto Supremo N° 003-2013-JUS, demÃ¡s normas conexas y la PolÃ­­tica de Privacidad de â€œRespira Limpioâ€ y Tratamiento de Datos Personales que aceptan los Usuarios al momento del Registro.\n\n
Los Usuarios declaran que los datos personales han sido entregados de forma absolutamente libre y voluntaria, sin ningÃºn tipo de presiÃ³n, obligaciÃ³n o condiciÃ³n de por medio.\n\n\n\n
''';
String text2 = '''
POLÃTICAS DE USO DE DATOS PERSONALES\n\n\n
Apreciamos que valore su privacidad y la protecciÃ³n de sus datos personales tanto como nosotros, es por eso que presentamos nuestra PolÃ­­tica de privacidad:\n\n
1) El Titular consiente de manera libre, expresa, previa e informada que los datos personales que usted nos proporcione mediante los formularios electrÃ³nicos que se le proponga, se almacene en un banco de datos.\n\n
2) No se compartirÃ¡n ni cederÃ¡n a terceros algÃºn dato personal del usuario sin el consentimiento previo y expreso de este Ãºltimo, salvo cuando dicha comunicaciÃ³n sea exigida por la legislaciÃ³n vigente, por orden judicial o por una autoridad competente.\n\n
3) Estas polÃ­­ticas estÃ¡n reguladas siguiendo la Ley N° 29733, Ley de ProtecciÃ³n de Datos Personales (https://www.gob.pe/institucion/congreso-de-la-republica/normas-legales/243470-29733) y el Decreto Supremo N° 003-2013-JUS, Reglamento de la Ley de ProtecciÃ³n de Datos Personales.\n\n
4) Se tiene siempre el compromiso de garantizar que todos los datos que se almacenen estÃ© protegidos de acuerdo a los Ãºltimos estÃ¡ndares de seguridad.\n\n
''';

String textF = '''
TÃ‰RMINOS Y CONDICIONES DE USO\n\n\nEste documento establece los tÃ©rminos y condiciones de uso a los cuales se rige la aplicaciÃ³n â€œRespira Limpioâ€ y el usuario final.\n\n1.- Servicios:\n\nLa aplicaciÃ³n â€œRespira Limpioâ€ es una aplicaciÃ³n mÃ³vil que tiene como finalidad monitorear la calidad en tiempo real de tu recorrido utilizando predicciones de la concentraciÃ³n de PM2.5  de las calles por la cual transitas. Este aplicativo solo tiene cobertura en el Ã¡rea de Cercado de Lima.\n\nâ€œRespira Limpioâ€ cuenta con una parte backend, la cual es el encargado de gestionar las predicciones y brindÃ¡rselas al frontend mediante APIs.\n\nEl Usuario al utilizar cualquiera de servicios ofrecidos por â€œRespira Limpioâ€ ya sea visual o de data que estÃ© disponible, voluntariamente acepta de manera previa, expresa e informada el contenido de los presentes TÃ©rminos y Condiciones de Uso en su totalidad, por lo cual, se obliga irrevocablemente a Ã©stos. Esto quiere decir, que el Usuario declara haber leÃ­­do y entendido todas las condiciones en la PolÃ­­tica de Privacidad y en los presentes TÃ©rminos y Condiciones de Uso, manifestando su conformidad y aceptaciÃ³n al hacer uso de la aplicaciÃ³n y se considerarÃ¡ que ha aceptado estos TÃ©rminos y Condiciones de Uso y que por lo tanto entra en un acuerdo vinculante.\n\nSu acuerdo con nosotros incluye estos TÃ©rminos y Condiciones de Uso, cualquiera de los derechos y obligaciones a los que se hace referencia y de cualquier tÃ©rmino adicional que rija ciertos aspectos o funcionalidades de nuestros servicios.\n\n2- Uso de â€œRespira Limpioâ€\n\nRequerimientos legales\n\nPara utilizar los servicios ofrecidos en â€œRespira Limpioâ€ declara que la informaciÃ³n enviada es correcta. Usted promete y acepta que estÃ¡ utilizando los servicios ofrecidos para su uso no comercial. La data obtenida de los dispositivos de mediciÃ³n, pertenecen a los creadores de â€œRespira Limpioâ€ o a sus socios estratÃ©gicos y estos no pueden ser vendidos ni transferidos. Todos los servicios ofrecidos por el aplicativo no pueden ser utilizados para cualquier acto ilegal o que vulnere la tranquilidad pÃºblica. El Usuario se compromete a hacer un uso adecuado y lÃ­­cito de la aplicaciÃ³n â€œRespira Limpioâ€ de conformidad con la legislaciÃ³n aplicable, los presentes TÃ©rminos y Condiciones de Uso, la moral y buenas costumbres generalmente aceptadas y el orden pÃºblico.\n\nUsted acepta cumplir con nuestras reglas provistas en los acuerdos y no usar nuestros servicios que no estÃ©n expresamente permitidos.\n\n3.- Actividades prohibidas\n\n- Escaneo continuo de la data obtenida por las APIs;\n\n- Scanear los servicios o usar cualquier medio automatizado para ver, acceder o recopilar informaciÃ³n.\n\n- Vender, alquilar, sublicenciar o arrendar cualquier parte de los servicios o data obtenida en â€œRespira Limpioâ€;\n\n- Manipular, escanear o probar vulnerabilidades en los servicios y/o conexiones a base de datos;\n\n- Cualquier actividad que entre en conflicto con los acuerdos, segÃºn lo determine â€œRespira Limpioâ€.\n\n4. Disponibilidad\n\nNos reservamos el derecho en cualquier momento, sin previo aviso de realizar cualquiera de las siguientes acciones:\n\n- Modificar, complementar o restringir los servicios y/o data obtenida en en el aplicativo mÃ³vil, sus funcionalidades o caracterÃ­­sticas;\n\n- Cambiar o actualizar la versiÃ³n de la plataforma.\n\n5.- ProtecciÃ³n de Datos\n\nLos propietarios de â€œRespira Limpioâ€ se rige estrictamente a toda ley de protecciÃ³n de datos y se esfuerza por mantenerlos seguros.\n\nLos datos personales que los Usuarios proporcionen en el Registro, serÃ¡n almacenados y tratados segÃºn lo dispone la Ley N° 29733, Ley de ProtecciÃ³n de Datos Personales, su Reglamento, aprobado mediante Decreto Supremo N° 003-2013-JUS, demÃ¡s normas conexas y la PolÃ­­tica de Privacidad de â€œRespira Limpioâ€ y Tratamiento de Datos Personales que aceptan los Usuarios al momento del Registro.\n\nLos Usuarios declaran que los datos personales han sido entregados de forma absolutamente libre y voluntaria, sin ningÃºn tipo de presiÃ³n, obligaciÃ³n o condiciÃ³n de por medio.\n\n\n\nPOLÃTICAS DE USO DE DATOS PERSONALES\n\n\nApreciamos que valore su privacidad y la protecciÃ³n de sus datos personales tanto como nosotros, es por eso que presentamos nuestra PolÃ­­tica de privacidad:\n\n1) El Titular consiente de manera libre, expresa, previa e informada que los datos personales que usted nos proporcione mediante los formularios electrÃ³nicos que se le proponga, se almacene en un banco de datos.\n\n2) No se compartirÃ¡n ni cederÃ¡n a terceros algÃºn dato personal del usuario sin el consentimiento previo y expreso de este Ãºltimo, salvo cuando dicha comunicaciÃ³n sea exigida por la legislaciÃ³n vigente, por orden judicial o por una autoridad competente.\n\n3) Estas polÃ­­ticas estÃ¡n reguladas siguiendo la Ley N° 29733, Ley de ProtecciÃ³n de Datos Personales (https://www.gob.pe/institucion/congreso-de-la-republica/normas-legales/243470-29733) y el Decreto Supremo N° 003-2013-JUS, Reglamento de la Ley de ProtecciÃ³n de Datos Personales.\n\n4) Se tiene siempre el compromiso de garantizar que todos los datos que se almacenen estÃ© protegidos de acuerdo a los Ãºltimos estÃ¡ndares de seguridad.\n\n
''';
