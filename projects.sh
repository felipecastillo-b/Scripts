#!/bin/bash

# directorio de proyectos
DIRECTORIO=~/Documents/projects/

# verifica si existe el directorio
if [ ! -d "$DIRECTORIO" ]; then
	echo "El directorio $DIRECTORIO no existe"
	exit 1
fi

# lista los proyectos y los enumera
xfce4-terminal --geometry 80x20 -e "bash -c '
	echo -e \"\\e[1;35mLista de proyectos:\\e[0m\";
	echo "";
	projects=(\"$DIRECTORIO\"*/);
	if [ \${#projects[@]} -eq 0 ]; then
		echo \"No hay proyectos en $DIRECTORIO\";
		sleep 3;
		exit 1;
	fi;

	# proyectos enumerados
	for i in \"\${!projects[@]}\"; do
		folder_name=\$(basename \"\${projects[\$i]}\");
		echo -e \"    \\e[95m\$((i+1)).\\e[0m \$folder_name\";
	done;

	# seleccionar proyecto
	echo "";
	echo -e \"\\e[1;35mSeleccionar Proyecto (1-\${#projects[@]}): \\e[0m\";
	read selection;

	# validar seleccion
	if [[ ! \"\$selection\" =~ ^[0-9]+\$ ]] || (( selection < 1 || selection > \${#projects[@]} )); then
		echo \"Seleccion no valida\";
		sleep 3;
		exit 1;
	fi;

	# obtener proyecto seleccionado
	selected_project=\"\${projects[\$((selection-1))]}\";

	# abrir vscode vim nano
	code \"\$selected_project\";

	# cerrar terminal
	exit;
'"
