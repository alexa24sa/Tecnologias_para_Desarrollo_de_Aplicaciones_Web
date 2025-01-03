    <div class="modal fade" id="editarEmpleadoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 titulo_modal">Actualizar Información Empleado</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formularioEmpleadoEdit" action="" method="POST" enctype="multipart/form-data" autocomplete="off">
                        <input type="hidden" name="curp" id="curp" />
                        <div class="mb-3">
                            <label class="form-label">CURP</label>
                            <input type="text" name="curp" id="curp" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="nombre" id="nombre" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Primer Apellido</label>
                            <input type="text" name="primer_apellido" id="primer_apellido" class="form-control" />
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">Seleccione número de empleado</label>
                                <select class="form-select" name="numero_empleado" id="numero_empleado" required>
                                    <option value="">Numero Empleado</option>
                                    <?php
                                    for ($i = 1000; $i <= 4000; $i++) {
                                        echo "<option value='$i'>$i</option>";
                                    } ?>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Seleccione el Cargo</label>
                            <select name="cargo" id="cargo" class="form-select" required>
                                <option selected value="">Cargo</option>
                                <?php
                                $cargos = array(
                                    "Administrador",
                                    "Capital Humano",
                                    "Jefe de Academia",
                                    "Docente"
                                );
                                foreach ($cargos as $cargo) {
                                    echo "<option value='$cargo'>$cargo</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="mb-3 mt-4">
                            <label class="form-label">Foto actual del empleado </label>
                            <br>
                            <img src"" id="avatar" style="display: block;" class="rounded-circle float-start" alt="Foto del empleado" width="80">
                        </div>
                        <br> <br>

                        <div class="mb-3 mt-4">
                            <label class="form-label">Cambiar Foto del empleado</label>
                            <input class="form-control form-control-sm" type="file" name="avatar" accept="image/png, image/jpeg" />
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn_add" onclick="actualizarEmpleado(event)">
                                Actualizar datos del empleado
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
