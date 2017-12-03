﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Logica;
using Datos;

namespace Asada
{
    /// <summary>
    /// Lógica de interacción para Usuarios.xaml
    /// </summary>
    public partial class Usuarios : Window
    {
        private IServiciosUsuarios usuarios = new AccionesUsuarios();

        public Usuarios()
        {
            InitializeComponent();
           
        }

        private void cargarUsuarios()
        {
            this.dgUsuarios.ItemsSource = this.usuarios.listar();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Usuario usuario = this.dgUsuarios.CurrentItem as Usuario;
            this.usuarios.actualizar(usuario.Id, usuario.Nombre, usuario.Clave);
            this.cargarUsuarios();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
               Usuario usuario = this.dgUsuarios.SelectedItem as Usuario;
               this.usuarios.borrar(usuario.Id);
               MessageBox.Show("Usuario eliminado");
               this.cargarUsuarios();
        }

        private void btnAgregar_Click(object sender, RoutedEventArgs e)
        {
            this.usuarios.agregar(this.txtUsuario.Text, this.txtClave.Password);
            this.cargarUsuarios();
        }

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {

            ASADAS asada = new ASADAS();
           asada.Show();


        }


        private void setUsuarioObj(Usuario objInformacion)
        {
            this.txtUsuario.Text = objInformacion.Nombre;
          //  this.txtClave. = objInformacion.Clave;



        }

        private void dgUsuarios_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgUsuarios.SelectedIndex != -1)
            {

                Usuario objUsuarioSelect = this.dgUsuarios.SelectedItem as Usuario;
                setUsuarioObj(objUsuarioSelect);
                    
                   
            }

            else
            {
                MessageBox.Show("Selecciona el usuario que deseas mostrar");
            }
        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            this.cargarUsuarios();
        }



    }
}
