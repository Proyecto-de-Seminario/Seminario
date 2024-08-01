﻿using LCDE.Models;
using LCDE.Servicios;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using System.Security.Claims;

namespace LCDE.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly UserManager<Usuario> userManager;
        private readonly SignInManager<Usuario> signInManager;
        private IRepositorioUsuarios repositorioUsuarios;

        public UsuariosController(UserManager<Usuario> userManager, IRepositorioUsuarios repositorioUsuarios,
            SignInManager<Usuario> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.repositorioUsuarios = repositorioUsuarios;
        }

        [AllowAnonymous]
        public IActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Registro(RegistroViewModel modelo)
        {
            if (!ModelState.IsValid)
            {
                return View(modelo);
            }

            var usuario = new Usuario() { Correo = modelo.Email, Nombre_usuario = modelo.Nombre_usuario };

            var resultado = await userManager.CreateAsync(usuario, password: modelo.Password);

            if (resultado.Succeeded)
            {
                await signInManager.SignInAsync(usuario, isPersistent: true);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                foreach (var error in resultado.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }

                return View(modelo);
            }

        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel modelo)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(modelo);
                }

                var resultado = await signInManager.PasswordSignInAsync(modelo.Email,
                    modelo.Password, modelo.Recuerdame, lockoutOnFailure: false);

                if (resultado.Succeeded)
                {
                    return RedirectToAction("Index", "Ventas");
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Nombre de usuario o password incorrecto.");
                    return View(modelo);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }

        [AllowAnonymous] //Se agrega para poder ingresar a esta acción sin estar registrado
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(IdentityConstants.ApplicationScheme);
            return RedirectToAction("Index", "Home");
        }
        //Obtener todos los usuarios
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            List<Usuario> respuesta = await repositorioUsuarios.VerUsuarios();
            return View(respuesta);
        }

        //Obtener Usuarios por ID
        [HttpGet]
        public async Task<IActionResult> Usuarios(int id)
        {
            Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(id);
            return View(usuario);
        }

        //editar Uusario
        //aqui deben de crear una vista para mostrar en el formulario la info del usuario pa editar chtm
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
                return View(usuario);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        // POST: ClientesController1/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Editar(Usuario usuario)
        {
            try
            {
                bool codigoResult = await repositorioUsuarios.EditarUsuario(usuario);
                if (codigoResult)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Error", "Home");
                }
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        //BORRAR USUARIO
        [HttpGet]
        public async Task<IActionResult> Borrar(int id)
        {
            Usuario usuario = await repositorioUsuarios.BuscarUsuarioId(id);

            if (usuario is null)
            {
                return RedirectToAction("NoEncontrado", "Home");
            }

            return View(usuario);
        }

        [HttpPost]
        public async Task<IActionResult> BorrarUsuario(int id)
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
    }

}
