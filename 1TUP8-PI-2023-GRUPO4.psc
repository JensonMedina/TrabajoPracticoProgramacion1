Algoritmo trabajoPractico
	Definir cantidadArticulos, columnas Como Entero;
	Definir arregloArticulos como caracter;
	definir quincena como entero;
	columnas = 6;
	
	//Pido cantidad de articulos con los que cuenta la ferreteria
	Repetir
		Escribir "Ingrese la cantidad de articulos que posee la ferreteria: ";
		Leer cantidadArticulos;
		si cantidadArticulos <= 0 Entonces
			Escribir "Cantidad de articulos incorrecta";
		FinSi
	Mientras Que cantidadArticulos <= 0

	//defino las dimensiones del arreglo
	//invocamos un subproceso para cargar los articulos
	fila=cantidadArticulos;
	//fila=9; // PARA USAR ARREGLO PRECARGADO
	dimension arregloArticulos[fila,columnas];
	CargarArticulos(arregloArticulos, cantidadArticulos); // PARA CARGAR MANUALMENTE
	//arregloArticulosPrecargada(arregloArticulos,fila,columnas);  //PARA USAR MATRIZ PRECARGADA DE EJEMPLO
	
	
	//en el vector rubros vamos a cargar los nombres de los rubros. 
	definir vectorRubros Como Caracter;
	Dimension vectorRubros[5];
	//hacemos un arreglo parea guardar los titulos de las columnas del arreglo de articulos
	definir arregloTitulosArticulos Como Caracter;
	Dimension arregloTitulosArticulos[5];
	arregloTitulosArticulos[0] = "CODIGO: ";
	arregloTitulosArticulos[1] = "DESCRIPCION: ";
	arregloTitulosArticulos[2] = "PRECIO: $";
	arregloTitulosArticulos[3] = "Cantidad total vendidad en el mes: ";
	arregloTitulosArticulos[4] = "Importe total venta: ";
	
	definir opcion Como Entero;
	Repetir
		escribir " ";
		Escribir "Ingrese una opcion: ";
		Escribir "1. Mostrar lista de artículos ordenada por descripción ";
		Escribir "2. Mostrar lista de artículos ordenada por cantidad vendida ";
		Escribir "3. Mostrar stock actual de artículos ";
		Escribir "4. Buscar artículo por código ";
		Escribir "5. Mostrar estadísticas ";
		Escribir "6. Salir";
		leer opcion;
		Segun opcion Hacer
			1:
				Escribir "Lista de artículos ordenada por descripción ";
				ordenarDescripcion(arregloArticulos,fila,columnas);
				imprimirLista(arregloArticulos,fila,3, arregloTitulosArticulos);
			2:
				Escribir "Lista de artículos ordenada por cantidad vendida ";
				ordenarCantVendida(arregloArticulos,fila,columnas);
				imprimirListaOrdenCantArt(arregloArticulos,fila,4,arregloTitulosArticulos);
			3:
				Escribir "Stock actual de artículos: ";
				stockActual(arregloArticulos,fila,columnas);
			4:
				Escribir "Buscar artículo por código ";
				buscarCodigo(arregloArticulos,fila,columnas);
			5:
				Escribir " ";
				Escribir "Estadísticas ";
				escribir " ";
				Escribir "Porcentaje de la cantidad de artículos vendidos de cada rubro: ";
				estadisticas(arregloArticulos,fila,columnas,vectorRubros);
				escribir " ";
				Escribir "Porcentaje de venta de cada quincena por Rubro sobre el total del mes: ";
				Escribir " ";
				Escribir "Primer Quincena: ";
				porcentajeQuincenasRubro(arregloArticulos,fila,4,vectorRubros);
				escribir " ";
				Escribir "Segunda Quincena: ";
				porcentajeQuincenasRubro(arregloArticulos,fila,5,vectorRubros);
				escribir " ";
				escribir "Rubro con mayor importe total de ventas";
				Escribir sin saltar "Primer Quincena: ";
				escribir  calculoVentasMes(arregloArticulos,fila,4,vectorRubros);
				Escribir sin saltar "Segunda Quincena: ";
				escribir  calculoVentasMes(arregloArticulos,fila,5,vectorRubros);
			6:
				Escribir "Hasta Luego";
				Escribir "Muchas Gracias";
			De Otro Modo:
				Escribir "Ingrese una opcion correcta";
		Fin Segun
	hasta Que opcion=6;
FinAlgoritmo
SubProceso arregloArticulosPrecargada(arregloArticulos,fila,columnas) // Matriz de ejemplo
	arregloArticulos[0, 0] <- "10012345";
	arregloArticulos[0, 1] <- "Tornillo autorroscante";
	arregloArticulos[0, 2] <- "19.9";
	arregloArticulos[0, 3] <- "100";
	arregloArticulos[0, 4] <- "25";
	arregloArticulos[0, 5] <- "30";
	// Datos para la segunda fila
	arregloArticulos[1, 0] <- "10052348";
	arregloArticulos[1, 1] <- "Tuerca de seguridad";
	arregloArticulos[1, 2] <- "24.99";
	arregloArticulos[1, 3] <- "50";
	arregloArticulos[1, 4] <- "15";
	arregloArticulos[1, 5] <- "20";
	// Datos para la tercera fila
	arregloArticulos[2, 0] <- "45032145";
	arregloArticulos[2, 1] <- "Bisagras de puerta";
	arregloArticulos[2, 2] <- "12.99";
	arregloArticulos[2, 3] <- "75";
	arregloArticulos[2, 4] <- "10";
	arregloArticulos[2, 5] <- "40";
	// Datos para la cuarta fila
	arregloArticulos[3, 0] <- "45099999"; // Código
	arregloArticulos[3, 1] <- "Cerraduras para ventanas"; // Descripción
	arregloArticulos[3, 2] <- "34.99"; // Precio de Venta
	arregloArticulos[3, 3] <- "30"; // Cantidad Existente STOCK
	arregloArticulos[3, 4] <- "5"; // Cantidad Vendida 1ª quincena
	arregloArticulos[3, 5] <- "20"; // Cantidad Vendida 2ª quincena
	// Datos para quinta fila
	arregloArticulos[4, 0] <- "68087560"; // Código
	arregloArticulos[4, 1] <- "Bombillas LED"; // Descripción
	arregloArticulos[4, 2] <- "39.99"; // Precio de Venta
	arregloArticulos[4, 3] <- "600"; // Cantidad Existente STOCK
	arregloArticulos[4, 4] <- "38"; // Cantidad Vendida 1ª quincena
	arregloArticulos[4, 5] <- "32"; // Cantidad Vendida 2ª quincena
	// Datos para sexta fila
	arregloArticulos[5, 0] <- "72045678"; // Código
	arregloArticulos[5, 1] <- "Cables eléctricos"; // Descripción
	arregloArticulos[5, 2] <- "12.99"; // Precio de Venta
	arregloArticulos[5, 3] <- "35"; // Cantidad Existente
	arregloArticulos[5, 4] <- "5"; // Cantidad Vendida 1ª quincena
	arregloArticulos[5, 5] <- "18"; // Cantida Vendida 2ª quincen
	// Datos para septima fila
	arregloArticulos[6, 0] <- "30046876"; // Código
	arregloArticulos[6, 1] <- "Pegamento multiusos"; // Descripción
	arregloArticulos[6, 2] <- "15.99"; // Precio de Venta
	arregloArticulos[6, 3] <- "250"; // Cantidad Existente
	arregloArticulos[6, 4] <- "75"; // Cantidad Vendida 1ª quincena
	arregloArticulos[6, 5] <- "18"; // Cantida Vendida 2ª quincen
	//Datos para octava fila
	arregloArticulos[7, 0] <- "30045640"; // Código
	arregloArticulos[7, 1] <- "Silicona para sellado"; // Descripción
	arregloArticulos[7, 2] <- "10.99"; // Precio de Venta
	arregloArticulos[7, 3] <- "250"; // Cantidad Existente
	arregloArticulos[7, 4] <- "90"; // Cantidad Vendida 1ª quincena
	arregloArticulos[7, 5] <- "18"; // Cantida Vendida 2ª quincen
	//Datos para novena fila
	arregloArticulos[8, 0] <- "72045478"; // Código
	arregloArticulos[8, 1] <- "Cables"; // Descripción
	arregloArticulos[8, 2] <- "15.99"; // Precio de Venta
	arregloArticulos[8, 3] <- "40"; // Cantidad Existente
	arregloArticulos[8, 4] <- "10"; // Cantidad Vendida 1ª quincena
	arregloArticulos[8, 5] <- "10"; // Cantida Vendida 2ª quincena
FinSubProceso
// INICIO CODIGO DE VALIDACIONES //////////////////////////INICIO
//Creamos un subproceso para cargar los articulos
SubProceso CargarArticulos(arregloArticulos, cantidadArticulos)
	Definir cantidadExistente, auxCantidadVendidaQuincena, cantidadVendidaMes Como Entero;
	definir codigo como cadena;
	Definir descripcion Como Caracter;
	Definir precioVenta Como Real;
	definir j Como Entero;
	Definir codigoValido, banStock Como Logico;
	para i = 0 hasta cantidadArticulos - 1 con paso 1 Hacer
		//validamos el codigo y lo cargamos
		Repetir
			Escribir "Ingrese codigo de articulo: ";
			Leer codigo;
			si !validarCodigo(codigo) Entonces
				Escribir "Codigo invalido.";
				codigoValido = falso;
			SiNo
				codigoValido = Verdadero;
			FinSi
		Mientras Que !codigoValido
		arregloArticulos[i,0] = codigo;
		//Cargamos la descripcion
		Escribir "Ingrese una descripcion para el articulo: ";
		Leer descripcion;
		arregloArticulos[i, 1] = descripcion;
		//Validamos el precio de articulo y lo cargamos
		Repetir
			Escribir "Ingrese el precio de venta del articulo: ";
			Leer precioVenta;
			si precioVenta <= 0 Entonces
				Escribir "Precio de venta incorrecto";
			FinSi
		Mientras Que precioVenta <= 0
		arregloArticulos[i, 2] = ConvertirATexto(precioVenta);
		//Validamos el stock del articulo y lo cargamos
		Repetir
			Escribir "Ingrese stock de articulo: ";
			Leer cantidadExistente;
			si cantidadExistente < 0 Entonces
				Escribir "Cantidad de articulos incorrecta";
			FinSi
		Mientras Que cantidadExistente < 0
		arregloArticulos[i, 3] = ConvertirATexto(cantidadExistente); // Guardamos el Stock 
		//Con un mientras pedimos las cantidades vendidas en las quincenas, validamos que los valores ingresados sean correctos y que no se supere el stock
		//uso una variable j para llevar cuenta de las quincenas
		j = 0; // Si j es 0 hablamos de la Primer Quincena, si j es 1 hablamos de la Segunda Quincena
		//Tengo que hacer la validacion para que la cantidad vendida por mes no supere el stock
		Mientras j < 2  Hacer
			Repetir
				banStock = Verdadero;
				Escribir "Ingrese la cantidad vendida la quincena " ,j + 1;
				Leer auxCantidadVendidaQuincena;
				si auxCantidadVendidaQuincena < 0 Entonces // La cantidad vendida no puede ser negativa
					Escribir "Cantidad ingresada incorrecta. Debe ingresar un valor correcto";
					banStock = falso;
				FinSi
				si j = 0 Entonces // Primer Quincena
					si auxCantidadVendidaQuincena > cantidadExistente Entonces
						Escribir "La cantidad ingresada es mayor que el stock disponible. Debe ingresar una cantidad valida";
						banStock = falso;
					SiNo
						arregloArticulos[i,4]=ConvertirATexto(auxCantidadVendidaQuincena);
						banStock = Verdadero;
					FinSi
				SiNo // SINO PARA LA SEGUNDA QUINCENA
					si auxCantidadVendidaQuincena > cantidadExistente - ConvertirANumero(arregloArticulos[i,4]) Entonces
						Escribir "La cantidad ingresada es mayor que el stock disponible. Debe ingresar una cantidad valida";
						banStock = falso;
					SiNo
						arregloArticulos[i,5]=ConvertirATexto(auxCantidadVendidaQuincena);
						banStock = Verdadero;
					FinSi
					
				FinSi
			Mientras Que !banStock
			j = j + 1;
		Fin Mientras
		Escribir "Proceso de venta completado.";
		Escribir "Articulo " ,i + 1, " cargado correctamente";
	FinPara
FinSubProceso

funcion codigoValido <- validarCodigo (codigo)
	definir codigoValido Como Logico;
	definir rubro Como numero;
	definir letras como logico;
	letras=Falso;
	//primero que todo verifico que la longitud del codigo sea exactamente 8
	si Longitud(codigo) == 8 Entonces
		Para i=0 hasta Longitud(codigo)-1 Hacer
			digito=Subcadena(codigo,i,i);//Extraemos letra por letra y la asignamos a digito
			si digito < "0" o digito > "9" Entonces //comparamos para validar que la letra no sea menor que cero o mayor que 9
				i=longitud(codigo); // para salir del para si ya encontramos al menos una letra en el codigo
				letras=Verdadero; // Letra encontrada entonces Verdadero
				Escribir "El codigo no puede contener letras/caracteres especiales";
			FinSi
		FinPara
		si letras=Falso Entonces // si es Falso no contiene letras el codigo del articulo
			rubro = ConvertirANumero(Subcadena(codigo,0,2));
			//comparo rubro para ver si coincide con los rubros de la ferreteria
			Segun rubro Hacer
				100:
					codigoValido = Verdadero;
				300:
					codigoValido = Verdadero;
				450:
					codigoValido = Verdadero;
				680:
					codigoValido = Verdadero;
				720:
					codigoValido = Verdadero;
				De Otro Modo:
					codigoValido = falso;
					Escribir "Rubro Inexistente";
			Fin Segun
		FinSi
	SiNo
		codigoValido = falso;
		Escribir "Longitud de codigo incorrecta";
	FinSi
FinFuncion
// FIN CODIGO DE VALIDACIONES //

//este subproceso implementa un algoritmo de selección para ordenar los artículos por sus descripciones en un arreglo bidimensional. 
//A medida que avanza a través del arreglo, encuentra el artículo con la descripción más baja en cada iteración y lo intercambia 
//con el artículo en la posición actual, logrando finalmente el orden deseado.
SubProceso ordenarDescripcion(arregloArticulos,fila,columnas)
	definir posMenor como entero;
	definir i,j,k Como Entero;
	definir temp como cadena;
	Para i=0 hasta fila-2 Hacer
		posMenor=i;
		para j=i+1 hasta fila-1 Hacer
			si Minusculas(arregloArticulos[j,1])<Minusculas(arregloArticulos[posMenor,1]) Entonces //convertimos ambas descripciones a minusculas para que no haya ningun problema al momento de comparar
				posMenor=j;
			FinSi
		FinPara
		para k=0 hasta columnas-1 Hacer
			temp=arregloArticulos[i,k];
			arregloArticulos[i,k]=arregloArticulos[posMenor,k];
			arregloArticulos[posMenor,k]=temp;
		FinPara
	FinPara
FinSubProceso

//este subproceso recorre el arreglo bidimensional "arregloArticulos" y muestra sus valores junto con los títulos correspondientes en la pantalla. 
//Cada fila del arreglo corresponde a un artículo, y cada columna del arreglo representa una propiedad del artículo, como 
//su descripción, código, precio, cantidad vendida, entre otros. El subproceso imprime esta información de manera organizada y 
//utiliza saltos de línea para separar los artículos.
SubProceso imprimirLista(arregloArticulos,fila,columnas, arregloTitulosArticulos)
	Para i=0 hasta fila-1 Hacer
		para j=0 hasta columnas-1 Hacer
			Escribir Sin Saltar arregloTitulosArticulos[j];
			Escribir Sin Saltar arregloArticulos[i,j]," ";
		FinPara
		Escribir " ";
	FinPara
FinSubProceso

//este subproceso se encarga de ordenar los artículos almacenados en el arreglo "arregloArticulos" de manera ascendente según la cantidad vendida. 
//Utiliza el algoritmo de selección, que compara la cantidad vendida de todos los pares de artículos y mueve el artículo con la menor cantidad vendida 
//hacia la parte superior de la lista.
SubProceso ordenarCantVendida(arregloArticulos,fila,columnas)
	definir posMenor como entero;
	definir auxiliar como cadena;
	definir i,k,j Como Entero;
	definir suma1 como entero; 
	definir suma2 como entero;
	Para i = 0 hasta fila - 2 Hacer
		posMenor = i;
		para j=i+1 hasta fila-1 Hacer
			suma1 = sumaQuincenas(arregloArticulos, posMenor); //sumaQuincenas nos devuelve el valor de la suma de las ventas del mes de las quincenas de dicho articulo (segun la fila que le pasamos como parametro)
			suma2 = sumaQuincenas(arregloArticulos, j); //suma 2 es nuestro pivote
			si suma1<suma2 //comparamos si el valor de la posicion menor es menor que el pivote, si es asi entonces guardamos en posMenor el valor que tiene j en ese momento
				posMenor=j;
			FinSi
		FinPara
		para k=0 hasta columnas-1 Hacer
			auxiliar = arregloArticulos[i,k];
			arregloArticulos[i,k] = arregloArticulos[posMenor,k];
			arregloArticulos[posMenor,k] = auxiliar;
		FinPara
	FinPara
FinSubProceso

//En este subproceso devolvemos la lista de los articulos ordenada por cantidad vendida de mayor a menor:
SubProceso imprimirListaOrdenCantArt(arregloArticulos,fila,columnas,arregloTitulosArticulos)
	definir acumuladorVentasTotal Como Real;
	acumuladorVentasTotal = 0;
    Para i=0 hasta fila-1 Hacer
        sumaCant = sumaQuincenas(arregloArticulos, i); // sumaCant guarda el valor de la suma de las quincenas de dicho articulo
        // Calcula el importe total del artículo
        importeVenta = sumaCant * ConvertirANumero(arregloArticulos[i,2]); //sumaCant tiene guardado la suma de las cantidades que vendio en cada quincena dicho articulo y lo multiplicamos por su precio para calcular el monto
		//Calculamos los importes de venta por quincena y los vamos acumulando para obtener un importe total.
		acumuladorVentasTotal = acumuladorVentasTotal + importeVenta;
		Escribir "";
		Escribir "Codigo: " ,arregloArticulos[i,0];
		Escribir "Descripcion: " ,arregloArticulos[i,1];
		Escribir "Cantidad Total vendida en el mes: " ,sumaQuincenas(arregloArticulos, i);
		Escribir "Importe Total venta : $" ,importeVenta;
        Escribir  "";
    FinPara
	
	Escribir "Monto total de ventas realizadas en el mes: $" ,acumuladorVentasTotal;
	Escribir "";
FinSubProceso


//el subproceso "stockActual" calcula y muestra el stock actual de los artículos en función de la diferencia entre la cantidad total disponible y la cantidad 
//vendida de cada artículo. Luego, imprime esta información junto con el código y la descripción de cada artículo.
SubProceso stockActual(arregloArticulos,fila,columnas)
	definir stock como entero;
	para i=0 hasta fila-1 Hacer
		para j=0 hasta columnas-1 Hacer
			stock=ConvertirANumero(arregloArticulos[i,3]) - sumaQuincenas(arregloArticulos, i); //stock actual = stock original - vendido
		FinPara
		Escribir Sin Saltar arregloArticulos[i,0]," ",arregloArticulos[i,1]," ","->STOCK ACTUAL: ",stock;
		Escribir " ";
	FinPara
FinSubProceso


//En este subproceso pedimos un codigo a buscar al usuario, validamos que ingrese un codigo correcto, verificamos si el codigo existe y mostramos los datos del articulo
SubProceso buscarCodigo(arregloArticulos,fila,columnas)
	definir codigo como cadena;
	//verificamos que el usuario ingrese un codigo valido
	Repetir
		Escribir "Ingrese codigo de articulo a buscar: ";
		leer codigo;
	Mientras Que !validarCodigo(codigo);
	
	definir posEncontrado como entero;
	definir banEncontrado como logico;
	definir importeTotal como real;
	definir i como entero;
	i=0;
	banEncontrado = Falso;
	
	//buscamos el codigo en el arreglo para ver si existe
	Repetir
		si codigo=arregloArticulos[i,0] Entonces
			banEncontrado=Verdadero;
			posEncontrado = i;
		FinSi
		i=i+1;
	Mientras Que !banEncontrado y i < fila-1
	
	//si el codigo existe realizamos los calculos y mostramos el articulo
	si banEncontrado Entonces
		stock = ConvertirANumero(arregloArticulos[posEncontrado,3]) - sumaQuincenas(arregloArticulos, posEncontrado); //Calculamos el stock actual del articulo encontrado
		importeTotal = sumaQuincenas(arregloArticulos, posEncontrado) *ConvertirANumero(arregloArticulos[posEncontrado,2]); //calculamos el valor en dinero de lo que se vendio de ese articulo
		Escribir "Codigo: ",arregloArticulos[posEncontrado,0]," ";
		Escribir "Quincena 1: " ,arregloArticulos[posEncontrado, 4];
		Escribir "Quincena 2: " ,arregloArticulos[posEncontrado, 5];
		Escribir "->STOCK ACTUAL: ",stock;
		Escribir "Importe total: ","$",importeTotal;
	sino 
		Escribir "No existe artículo con ese código";
	FinSi
FinSubProceso

SubProceso estadisticas(arregloArticulos,fila,columnas,vectorRubros)
	//en rubro vamos a guardar el rubro que extraigamos del codigo del articulo
	definir rubro como entero;
	//en el vector rubros vamos a cargar los nombres de los rubros.
	//definir vectorRubros Como Caracter;
	
	//Dimension vectorRubros[5];
	vectorRubros[0] = "Tornillos y tuercas";
	vectorRubros[1] = "Adhesivos";
	vectorRubros[2] = "Herrajes";
	vectorRubros[3] = "Pinturas";
	vectorRubros[4] = "Electricidad";
	
	// en vector acumulador rubros vamos a cargar los acumuladores de los rubros
	definir vectorAcumuladorRubros Como Entero;
	Dimension vectorAcumuladorRubros[5];
	
	//posicion 0 para el rubro 100: Tornillos y tuercas
	//posicion 1 para el rubro 300: Adhesivos
	//posicion 2 para el rubro 450: Herrajes
	//posicion 3 para el rubro 680: Pinturas
	//posicion 4 para el rubro 720: Electricidad
	
	// en vector porcentajes rubros vamos a cargar los porcentajes de los rubros
	definir vectorPorcentajesRubros Como Real;
	Dimension vectorPorcentajesRubros[5];
	//posicion 0 para el rubro 100: Tornillos y tuercas
	//posicion 1 para el rubro 300: Adhesivos
	//posicion 2 para el rubro 450: Herrajes
	//posicion 3 para el rubro 680: Pinturas
	//posicion 4 para el rubro 720: Electricidad
	
	//con un para inicializamos los acumuladores en 0
	para i = 0 hasta 4 con paso 1 Hacer
		vectorAcumuladorRubros[i] = 0; 
	FinPara
	
	//con este para extraemos el rubro y los vamos cargando en el vector acumulador rubros
	Para i=0 hasta fila-1 Hacer
		rubro = ObtenerRubro(arregloArticulos[i,0]); //La funcion ObtenerRubro nos devuelve los 3 primeros digitos, es decir el rubro, del codigo de dicho articulo
		Segun rubro Hacer
			100:
				//si el rubro es 100 vamos acumulando lo que tenia el vectorAcumuladorRubros mas lo que devuelve la suma de quincenas
				vectorAcumuladorRubros[0] = vectorAcumuladorRubros[0] +sumaQuincenas(arregloArticulos, i);
			300:
				//si el rubro es 300 vamos acumulando lo que tenia el vectorAcumuladorRubros mas lo que devuelve la suma de quincenas
				vectorAcumuladorRubros[1] = vectorAcumuladorRubros[1] +sumaQuincenas(arregloArticulos, i);
			450:
				//si el rubro es 450 vamos acumulando lo que tenia el vectorAcumuladorRubros mas lo que devuelve la suma de quincenas
				vectorAcumuladorRubros[2] = vectorAcumuladorRubros[2] +sumaQuincenas(arregloArticulos, i);
			680:
				//si el rubro es 680 vamos acumulando lo que tenia el vectorAcumuladorRubros mas lo que devuelve la suma de quincenas
				vectorAcumuladorRubros[3] = vectorAcumuladorRubros[3] +sumaQuincenas(arregloArticulos, i);
			De Otro Modo:
				//si el rubro es 720 vamos acumulando lo que tenia el vectorAcumuladorRubros mas lo que devuelve la suma de quincenas
				vectorAcumuladorRubros[4] = vectorAcumuladorRubros[4] +sumaQuincenas(arregloArticulos, i);
		Fin Segun
	FinPara
	
	//con este para vamos a calcular los porcentajes para cada rubro
	para i = 0 hasta 4 con paso 1 Hacer
		vectorPorcentajesRubros[i] = (vectorAcumuladorRubros[i] * 100) / sumaCantidadDeVentas(arregloArticulos, fila); 
	FinPara
	
	//con este para mostramos los porcentajes redondeados:
	para i = 0 hasta 4 con paso 1 Hacer
		Escribir "El porcentaje del rubro " ,vectorRubros[i], " es: " ,redon(vectorPorcentajesRubros[i]), "%";
	FinPara
FinSubProceso

//la función "sumaCantidadDeVentas" recorre todas las filas del arreglo de artículos, suma las cantidades de ventas de cada artículo y 
//devuelve el resultado como la suma total de las cantidades de ventas de todos los artículos en la ferretería.
Funcion resultadoSumaCantidadDeVentas <- sumaCantidadDeVentas(arregloArticulos, fila)
	//en la variable acumulador cantidad de ventas vamos a ir acumulando las ventas que se hicieron
	Definir acumuladorCantidadVentas Como Entero;
	acumuladorCantidadVentas = 0;
	Para i = 0 Hasta fila - 1 Hacer
		//recorremos todas las filas del arreglo de articulos, vamos sumando lo vendido en las quincenas y lo vamos acumulando
		acumuladorCantidadVentas = acumuladorCantidadVentas + sumaQuincenas(arregloArticulos, i);
	FinPara
	resultadoSumaCantidadDeVentas = acumuladorCantidadVentas;
FinFuncion

//esta funcion devuelve el dato por mes de la suma de las quincenas
Funcion resultadoSumaQuincenas <- sumaQuincenas(arregloArticulos,posicionQuincena)
	resultadoSumaQuincenas = convertiranumero(arregloArticulos[posicionQuincena,4])+convertiranumero(arregloArticulos[posicionQuincena,5]);
FinFuncion

// DEVOLVER EL RUBRO CON MAYOR IMPORTE DE VENTAS EN EL MES
Funcion rubroImporteMayor<-calculoVentasMes(arregloArticulos,fila,quincena,vectorRubros) 
	definir rubroImporteMayor como cadena;
	Definir importeVentasRubro como real;
	definir ventaMayor como real;
	Dimension importeVentasRubro[5]; // porque son 5 rubros;
	Para i=0 hasta fila-1 Hacer
		rubro = ObtenerRubro(arregloArticulos[i,0]);
		Segun rubro Hacer
			100:
				//si el rubro es 100 acumulamos el valor de la venta( cant vendida en quincena 1 o 2 por el valor del articulo) para el rubro tornillos y tuercas
				importeVentasRubro[0] = importeVentasRubro[0] + importeVentaQuincena(arregloArticulos,i,quincena);
			300:
				//si el rubro es 300 acumulamos el valor de la venta( cant vendida en quincena 1 o 2 por el valor del articulo) para el rubro Adhesivos
				importeVentasRubro[1] = importeVentasRubro[1] + importeVentaQuincena(arregloArticulos,i,quincena);
			450:
				//si el rubro es 450 acumulamos el valor de la venta( cant vendida en quincena 1 o 2 por el valor del articulo) para el rubro herrajes
				importeVentasRubro[2] = importeVentasRubro[2] + importeVentaQuincena(arregloArticulos,i,quincena);
			680:
				//si el rubro es 680 acumulamos el valor de la venta( cant vendida en quincena 1 o 2 por el valor del articulo) para el rubro pinturas
				importeVentasRubro[3] = importeVentasRubro[3] + importeVentaQuincena(arregloArticulos,i,quincena);
			De Otro Modo:
				// si el rubro es 720 acumulamos el valor de la venta( cant vendida en quincena 1 o 2 por el valor del articulo) para el rubro electricidad
				importeVentasRubro[4] = importeVentasRubro[4] + importeVentaQuincena(arregloArticulos,i,quincena);
		Fin Segun
	FinPara	
	mayor=importeVentasRubro[0]; //Establecemos al primer rubro como mayor
	definir posmayor como entero;
	Para j=1 hasta 4 Hacer // arrancamos en 1 para no compararlo consigo mismo
		si importeVentasRubro[j]>mayor Entonces
			mayor=importeVentasRubro[j];
			posmayor=j;
		FinSi
	FinPara
	
	rubroImporteMayor=vectorRubros[posmayor]; // Devuelvo el nombre del rubro con mayor importe de ventas segun quincena
FinFuncion

//con esta funcion obtenemos el rubro
funcion resultadoObtenerRubro<- ObtenerRubro(codigo)
	//con subcadena(codigo, 0, 2) le saco los primeros 3 digitos al codigo
	resultadoObtenerRubro = ConvertirANumero(Subcadena(codigo,0 , 2));
FinFuncion

//Esta funcion devuelve el importe de venta por quincena
Funcion resultadoImporteImporteVenta<- importeVentaQuincena(arregloArticulos,filaQuincena, columnaQuincena)
	resultadoImporteImporteVenta<-(ConvertirANumero(arregloArticulos[filaQuincena,columnaQuincena]) * ConvertirANumero(arregloArticulos[filaQuincena,2]));// devuelve el importe de venta de cda qincena 
FinFuncion

//el subproceso porcentajeQuincenasRubro calcula y muestra el porcentaje de ventas para cada rubro en una quincena específica en función de las cantidades de ventas y 
//el rubro al que pertenecen los artículos en la ferretería.
SubProceso porcentajeQuincenasRubro(arregloArticulos,fila,quincena,vectorRubros)
	//quincena : le pasamos el valor de 4 o 5 segun la quincena que queremos sumar
	definir vectorSumaRubro como entero;// vector que guarda las sumas de las cantidades por quincena
	Dimension vectorSumaRubro[5];
	Definir sumaTotalCantVentas como entero; // suma para la cantidad total de ventas del mes
	sumaTotalCantVentas=0;
	
	para i=0 hasta 4 Hacer
		vectorSumaRubro[i]=0; // inicializamos en 0 porque vamos a sumar
	FinPara
	
	Para i=0 hasta fila-1 Hacer
		rubro = ObtenerRubro(arregloArticulos[i,0]);
		Segun rubro Hacer
			100:
				//si el rubro es 100 sumamos la quincena de rubro tornillos y tuercas
				vectorSumaRubro[0] = vectorSumaRubro[0] + ConvertirANumero(arregloArticulos[i,quincena]);
			300:
				//si el rubro es 300 sumamos la quincena adhesivos
				vectorSumaRubro[1] = vectorSumaRubro[1] + ConvertirANumero(arregloArticulos[i,quincena]);
			450:
				//si el rubro es 450 sumamos la quincena de herrajes
				vectorSumaRubro[2] = vectorSumaRubro[2] + ConvertirANumero(arregloArticulos[i,quincena]);
			680:
				//si el rubro es 680 sumamos la quincena de pinturas
				vectorSumaRubro[3] = vectorSumaRubro[3] + ConvertirANumero(arregloArticulos[i,quincena]);
			De Otro Modo:
				// si el rubro es 720 sumamos la quincena de electricidad
				vectorSumaRubro[4] = vectorSumaRubro[4] + ConvertirANumero(arregloArticulos[i,quincena]);
		Fin Segun
	FinPara
	
	para i=0 hasta 4 Hacer
		porcentajePorQuincena = (vectorSumaRubro[i]*100) / sumaCantidadDeVentas(arregloArticulos, fila);
		porcentajePorQuincena=redon(porcentajePorQuincena); // Redondeamos los porcentajes
		Escribir "El porcentaje de ventas del rubro: ",vectorRubros[i]," es: ",porcentajePorQuincena,"%";
	FinPara
FinSubProceso