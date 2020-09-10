<%@page import="cad.UsuarioCad"%>
<%@page session="true"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VivaSalud |  Compra los mejores productos para tu salud</title>
        <%@include file="WEB-INF/css.jsp"%>
    </head>
    <body>

        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose>        

        <div class="panel-izquierdo">

            <ul>
                <li><a href="condicionesUso.jsp">Condiciones de Uso</a></li>
                <li><a href="privacidad.jsp" class="activado">Política de privacidad</a></li>
                <li><a href="reembolso.jsp">Política de reembolso</a></li>
                <li><a href="nosotros.jsp">Nosotros</a></li>
                <li><a href="preguntas-frecuentes.jsp"> Preguntas Frecuentes </a></li>
                <li><a href="garantia.jsp" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp"> Formas de pago </a></li>
            </ul>
        </div>
        <div class="texto-politica">
            <h1> Politica de privacidad </h1>
            <h3> I. ALCANCE </h3>
            <p>
                La presente “Política de Privacidad” se aplica a toda actividad de tratamiento de datos personales realizada por parte de VIVASALUD. (en adelante “VIVASALUD”)
                con RUC 20100128056. Será también de aplicación para aquellas personas o empresas a las que VIVASALUD requiera el tratamiento de datos personales de los cuales
                sea responsable.

            </p>   
            <h3> II. INFORMACIÓN GENERAL </h3>
            <p>
                Como parte de nuestra actividad, tratamos datos personales en cumplimiento con lo dispuesto en la Ley 29733 – Ley de Protección de Datos Personales, su Reglamento, 
                aprobado por Decreto Supremo 003-2013-JUS, y sus normas complementarias y modificatorias (todas éstas en adelante definidas como la “Normativa de Protección de Datos
                Personales”). Los datos personales cuyo tratamiento realizamos son almacenados en bancos de datos personales de titularidad de VIVASALUD, debidamente inscritos
                ante la Autoridad de Protección de Datos Personales:

                Banco de datos “Clientes” con el código RNPDP-PJP N.° 9566
                Banco de Datos “Prevención y Seguridad” con el código RNPDP-PJP N.° 14487
                Banco de Datos “Videovigilancia” con el código RNPDP-PJP N.° 9567
                Banco de Datos “Recursos Humanos” con el código RNPDP-PJP N.° 9569
                Banco de Datos “Proveedores” con el código RNPDP-PJP N.° 9568

            </p>
            <h3> III. OBJETIVO </h3>
            <p>
                La presente Política tiene por objeto hacer de conocimiento del público nuestro compromiso con la protección de datos personales, así como los lineamientos 
                bajo los cuales realizamos el tratamiento de los mismos en ejercicio de nuestras actividades comerciales, la finalidad para la que lo hacemos, así como los 
                procedimientos para que los titulares de los mismos puedan ejercer los derechos de acceso, rectificación, cancelación y oposición previstos en la Normativa 
                de Protección de Datos Personales
            </p>
            <h3> IV. PRINCIPIOS RECTORES </h3>
            <p>
                VIVASALUD se compromete a respetar los principios rectores establecidos en la Normativa de Protección de Datos Personales. Estos son: Principio de legalidad:
                El tratamiento de los datos personales se hace conforme a lo establecido en la ley, estando prohibida la recopilación de los datos personales por medios
                fraudulentos, desleales o ilícitos. Principio de consentimiento: Para el tratamiento de los datos personales debe mediar el consentimiento de su titular. Principio
                de finalidad: Los datos personales deben ser recopilados para una finalidad determinada, explícita y lícita, y su tratamiento no debe extenderse a otra finalidad 
                distinta a aquella para la cual fueron recopilados. Principio de proporcionalidad: El tratamiento de datos personales debe ser adecuado, relevante y no excesivo
                a la finalidad para la que estos hubiesen sido recopilados. Principio de calidad: Los datos personales que vayan a ser tratados deben ser veraces, exactos y, 
                en la medida de lo posible, actualizadas, necesarias, pertinentes y adecuadas respecto de la finalidad para la que fueron recopilados. Principio de seguridad:
                El titular del banco de datos personales y el encargado de su tratamiento deben adoptar las medidas técnicas, organizativas y legales necesarias para garantizar 
                la seguridad de los datos personales. Principio de disposición de recurso: El titular de datos personales debe contar con las vías administrativas o jurisdiccionales 
                necesarias para reclamar y hacer valer sus derechos, cuando estos sean vulnerados por el tratamiento de sus datos personales. Principio de nivel de protección adecuado: 
                Para el flujo transfronterizo de datos personales, se debe garantizar un nivel suficiente de protección para los datos personales que se vayan a tratar o, por lo menos,
                equiparable a lo previsto por la Ley de Protección de Datos Personales o por los estándares internacionales en la materia.
            </p>
            <h3> V. FINALIDAD DEL TRATAMIENTO DE LOS DATOS PERSONALES </h3>
            <p>
                VIVASALUD realiza tratamiento de datos personales de trabajadores, clientes y potenciales clientes, proveedores y de todas aquellas personas que visitan nuestras
                instalaciones y/o tienen alguna relación jurídica o comercial con nuestra empresa, con la finalidad de cumplir con la legislación vigente, ejecutar la relación 
                jurídica que los titulares de los datos personales mantengan con nuestra empresa, así como resguardar la seguridad de nuestros clientes y trabajadores.
                El tratamiento de datos personales para cualquier otra finalidad lícita distinta a las antes mencionadas es debidamente informada a los dichos titulares de datos
                personales, requiriendo una autorización específica

            </p>
            <h3> VI. TRATAMIENTO POR ENCARGO </h3>
            <p>
                VIVASALUD puede encargar todo o parte del tratamiento de datos personales de los cuales es responsable del tratamiento o que forman parte de los bancos de datos 
                personales de los cuales es titular, a proveedores legítimos para el cumplimiento de sus actividades empresariales,para fines de procesamiento, equipamiento y 
                soluciones tecnológicas. Conozca la relación de proveedores que podrán recibir los datos personales como encargados de tratamiento de VIVASALUD: relación de 
                proveedores

            </p>
            <h3> VII. CONSENTIMIENTO </h3>
            <p>
                VIVASALUD requerirá del consentimiento libre, previo, expreso, inequívoco e informado del titular de los datos personales para el tratamiento de los mismos, 
                salvo en los casos de excepción expresamente establecidos por Ley. VIVASALUD no requerirá consentimiento para tratar sus datos personales obtenidos de fuentes 
                accesibles al público, gratuitas o no; así mismo, podrá tratar sus datos personales o de fuentes no públicas, siempre que dichas fuentes cuenten con su consentimiento
                para tratar y transferir dichos datos personales.

            </p>
            <h3> VII. DERECHOS DE LOS TITULARES </h3>
            <p>
                De acuerdo con la Ley, los titulares de datos personales tienen los siguientes derechos:</br>

                ●  1. Derecho de Acceso e información:
                El titular de datos personales tiene derecho a obtener la información que sobre sí mismo sea objeto de tratamiento en bancos de datos de titularidad de VIVASALUD.</br>
                ●  2. Derecho de rectificación, actualización e inclusión:
                El titular de datos personales tiene derecho a la actualización, inclusión y rectificación de sus datos personales materia de tratamiento por parte de VIVASALUD 
                cuando estos sean parcial o totalmente inexactos, incompletos o cuando se hubiere advertido omisión, error o falsedad.</br>
                ●  3. Derecho de Cancelación o Supresión:
                El titular de datos personales podrá solicitar la cancelación o supresión de sus datos personales no relacionados o necesarios para la ejecución de las 
                obligaciones de cargo de VIVASALUD previstas en los contratos suscritos o las dispuestas por la normativa vigente.</br>
                ●  4. Derecho de Oposición:
                El titular de datos personales puede oponerse al tratamiento de sus datos personales en cualquier momento. La oposición procederá</br>

            </p>

        </div>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>
