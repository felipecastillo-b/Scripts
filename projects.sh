#!/bin/bash

# directorio de proyectos
DIRECTORIO=~/Documentos/projects/

# verifica si existe el directorio
if [ ! -d "$DIRECTORIO" ]; then
	echo "El directorio $DIRECTORIO no existe"
	exit 1
fi

# lista los proyectos y los enumera
xfce4-terminal --geometry 80x20 -e "bash -c '
	echo \"Lista de proyectos:\";
	projects=(\"$DIRECTORIO\"*/);
	if [ \${#projects[@]} -eq 0 ]; then
		echo \"No hay proyectos en $DIRECTORIO\";
		sleep 3;
		exit 1;
	fi;

	# proyectos enumerados
	for i in \"\${!projects[@]}\"; do
		folder_name=\$(basename \"\${projects[\$i]}\");
		echo \"\$((i+1)). \$folder_name\";
	done;

	# seleccionar proyecto
	read -p \"Seleccionar Proyecto (1-\${#projects[@]}): \" selection;

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
