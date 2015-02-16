<div id="pollErrorBox" class="alert alert-danger hidden"></div>

<div class="form-group">
    <label for="pollInputTitle">Título de la encuesta</label>
    <input data-poll-setting="title" type="text" class="form-control" id="pollInputTitle" placeholder="Introduce titulo">
</div>

<div class="form-group">
    <label for="pollInputOptions">Opciones</label>
    <textarea id="pollInputOptions" class="form-control" rows="5" placeholder="Introduce una opción por linea"></textarea>
</div>

<h3>Ajustes</h3>

<div class="form-group">
    <label for="pollInputAmount">Votos por usuario</label>
    <!-- TODO change this to defaults -->
    <input data-poll-setting="max" type="number" min="1" max="10" step="1" class="form-control" id="pollInputAmount" placeholder="Introduce numero de votos">
    <p class="help-block">Un valor mayor que 1 indica que el usuario puede votar varias opciones.</p>
</div>

<div class="form-group">
    <label for="pollInputAmount">Acabar automaticamente la encuesta el: </label>
    <input data-poll-setting="end" type="text" class="form-control" id="pollInputEnd" placeholder="Click para indicar fecha">
    <p class="help-block">Si se deja vacio, la encuesta no acabará nunca.</p>
</div>

<div id="dtBox"></div>