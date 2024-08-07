﻿using LCDE.Models;
using LCDE.Servicios;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace LCDE.Controllers
{
    [Authorize(Policy = "AdminPolicy")]
    public class UsuariosController : Controller
    {
        private readonly UserManager<Usuario> userManager;
        private readonly SignInManager<Usuario> signInManager;
        private readonly IRepositorioUsuarios repositorioUsuarios;

        public UsuariosController(UserManager<Usuario> userManager, IRepositorioUsuarios repositorioUsuarios,
            SignInManager<Usuario> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.repositorioUsuarios = repositorioUsuarios;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Registro()
        {
            try
            {
                UsuarioCrearDTO usuario = new UsuarioCrearDTO();
                usuario.Roles = await ObtenerRoles();
                return View(usuario);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Registro(UsuarioCrearDTO modelo)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    modelo.Roles = await ObtenerRoles();
                    return View(modelo);
                }

                var usuario = new Usuario() { Correo = modelo.Correo, Nombre_usuario = modelo.Nombre_usuario, Id_Role = modelo.Id_Role };
                var resultado = await userManager.CreateAsync(usuario, password: modelo.Contrasennia);

                if (resultado.Succeeded)
                {
                    return RedirectToAction("Index", "Usuarios");
                }
                else
                {
                    modelo.Roles = await ObtenerRoles();

                    foreach (var error in resultado.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }

                    return View(modelo);
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            try
            {
                await HttpContext.SignOutAsync(IdentityConstants.ApplicationScheme);
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            try
            {
                List<Usuario> respuesta = await repositorioUsuarios.VerUsuarios();
                return View(respuesta);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpGet]
        public async Task<IActionResult> Usuarios(int id)
        {
            try
            {
                Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(id);
                return View(usuario);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpGet]
        public async Task<ActionResult> Editar(int Id)
        {
            try
            {
                Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(Id);
                if (usuario == null)
                {
                    return RedirectToAction("NoEncontrado", "Home");
                }
                UsuarioActualizarDTO user = new UsuarioActualizarDTO()
                {
                    Id = usuario.Id,
                    Nombre_usuario = usuario.Nombre_usuario,
                    Correo = usuario.Correo,
                    Id_Role = usuario.Id_Role,
                    Roles = await ObtenerRoles()
                };
                return View(user);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Editar(UsuarioActualizarDTO usuario)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    usuario.Roles = await ObtenerRoles();
                    return View(usuario);
                }

                var userExist = await repositorioUsuarios.BuscarUsuarioPorEmail(usuario.Correo);
                if (userExist != null && userExist.Id != usuario.Id)
                {
                    ModelState.AddModelError(string.Empty, "Correo ya existe.");
                    return View(usuario);
                }

                var usuarioExistente = await userManager.FindByIdAsync(usuario.Id.ToString());
                if (usuarioExistente == null)
                {
                    return RedirectToAction("NoEncontrado", "Home");
                }

                usuarioExistente.Nombre_usuario = usuario.Nombre_usuario;
                usuarioExistente.Correo = usuario.Correo;
                usuarioExistente.Id_Role = usuario.Id_Role;

                bool codigoResult = await repositorioUsuarios.EditarUsuario(usuarioExistente);
                if (codigoResult)
                {
                    if (!string.IsNullOrEmpty(usuario.Contrasennia))
                    {
                        var removePasswordResult = await userManager.RemovePasswordAsync(usuarioExistente);
                        if (removePasswordResult.Succeeded)
                        {
                            var addPasswordResult = await userManager.AddPasswordAsync(usuarioExistente, usuario.Contrasennia);
                        }
                    }
                }
                else
                {
                    return RedirectToAction("Error", "Home");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpGet]
        public async Task<IActionResult> Borrar(int id)
        {
            try
            {
                Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(id);

                if (usuario is null)
                {
                    return RedirectToAction("NoEncontrado", "Home");
                }

                return View(usuario);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        [HttpPost]
        public async Task<IActionResult> BorrarUsuario(int id)
        {
            try
            {
                Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(id);
                if (usuario is null)
                {
                    return RedirectToAction("NoEncontrado", "Home");
                }

                if (await repositorioUsuarios.BorrarUsuario(id))
                {
                    return Ok(new { success = true });
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        private async Task<IEnumerable<SelectListItem>> ObtenerRoles()
        {
            return await repositorioUsuarios.ObtenerRoles();
        }
    }
}